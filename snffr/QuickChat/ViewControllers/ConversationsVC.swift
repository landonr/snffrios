//  MIT License

//  Copyright (c) 2017 Haik Aslanyan

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.


import UIKit
import Firebase
import AudioToolbox

class ConversationsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var alertBottomConstraint: NSLayoutConstraint!
    
    lazy var leftButton: UIBarButtonItem = {
        let image = UIImage.init(named: "default profile")?.withRenderingMode(.alwaysOriginal)
        let button  = UIBarButtonItem.init(image: image, style: .plain, target: self, action: #selector(ConversationsVC.showProfile))
        return button
    }()
    var items = [Conversation]()
    var selectedUser: User?
    var selectedDog: Dog?
    
    //MARK: Methods
    func customization()  {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        //NavigationBar customization
        let navigationTitleFont = UIFont(name: "AvenirNext-Regular", size: 18)!
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: navigationTitleFont, NSForegroundColorAttributeName: UIColor.white]
        // notification setup
        NotificationCenter.default.addObserver(self, selector: #selector(self.pushToUserMesssages(notification:)), name: NSNotification.Name(rawValue: "showUserMessages"), object: nil)
        //right bar button
        let icon = UIImage.init(named: "compose")?.withRenderingMode(.alwaysOriginal)
        var rightButton = UIBarButtonItem.init(image: icon!, style: .plain, target: self, action: #selector(ConversationsVC.showContacts))
        //left bar button image fetching
        rightButton = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(ConversationsVC.showContacts))
        rightButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Helvetica", size: 32.0)!], for: .normal)
        rightButton.tintColor = UIColor.white
        self.parent?.navigationItem.leftBarButtonItem = self.leftButton
        self.parent?.navigationItem.rightBarButtonItem = rightButton
        self.tableView.tableFooterView = UIView.init(frame: CGRect.zero)
        if let id = Auth.auth().currentUser?.uid {
            User.info(forUserID: id, completion: { [weak weakSelf = self] (user) in
                let image = user.profilePic
                let contentSize = CGSize.init(width: 30, height: 30)
                UIGraphicsBeginImageContextWithOptions(contentSize, false, 0.0)
                let _  = UIBezierPath.init(roundedRect: CGRect.init(origin: CGPoint.zero, size: contentSize), cornerRadius: 14).addClip()
                image.draw(in: CGRect(origin: CGPoint.zero, size: contentSize))
                let path = UIBezierPath.init(roundedRect: CGRect.init(origin: CGPoint.zero, size: contentSize), cornerRadius: 14)
                path.lineWidth = 2
                UIColor.white.setStroke()
                path.stroke()
                let finalImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!.withRenderingMode(.alwaysOriginal)
                UIGraphicsEndImageContext()
                DispatchQueue.main.async {
                    weakSelf?.leftButton.image = finalImage
                    weakSelf = nil
                }
            })
        }
    }
    
    //Downloads conversations
    func fetchData() {
        Conversation.showConversations { (conversations) in
            self.items = conversations
            self.items.sort{ $0.lastMessage.timestamp > $1.lastMessage.timestamp }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //Shows profile extra view
    func showProfile() {
        let info = ["viewType" : ShowExtraView.profile]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showExtraView"), object: nil, userInfo: info)
        self.inputView?.isHidden = true
    }
    
    //Shows contacts extra view
    func showContacts() {
        let info = ["viewType" : ShowExtraView.contacts]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showExtraView"), object: nil, userInfo: info)
    }
    
    //Shows Chat viewcontroller with given user
    func pushToUserMesssages(notification: NSNotification) {
        if let user = notification.userInfo?["user"] as? Dog {
            self.selectedDog = user
            self.performSegue(withIdentifier: "segue", sender: self)
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            let vc = segue.destination as! ChatVC
            vc.currentDog = self.selectedDog
        }
    }

    //MARK: Delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func itemsForMe() -> [Conversation] {
        var items = [Conversation]()
        for item in self.items {
            for dog in DogViewModel.sharedInstance.dogsForMe() {
                if item.dog?.dogId == dog.dogId {
                    items.append(item)
                }
            }
        }
        return items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsForMe().count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ConversationsTBCell
        let dog = self.itemsForMe()[indexPath.row].dog!
        
        cell.clearCellData()
        cell.profilePic.image = dog.image
    
        if let image = dog.image {
            cell.profilePic.image = image
        } else {
            cell.profilePic.image = UIImage.init(named: "loading")
            DogViewModel.sharedInstance.dogs[indexPath.row].downloadImage(indexpathRow: indexPath.row, completion: { (state, index) in
                if state == true {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            })
        }
        
        cell.nameLabel.text = dog.name
        switch self.itemsForMe()[indexPath.row].lastMessage.type {
        case .text:
            let message = self.itemsForMe()[indexPath.row].lastMessage.content as! String
            cell.messageLabel.text = message
        case .location:
            cell.messageLabel.text = "Location"
        default:
            cell.messageLabel.text = "Media"
        }
        let messageDate = Date.init(timeIntervalSince1970: TimeInterval(self.itemsForMe()[indexPath.row].lastMessage.timestamp))
        let dataformatter = DateFormatter.init()
        dataformatter.timeStyle = .short
        let date = dataformatter.string(from: messageDate)
        cell.timeLabel.text = date
        if self.itemsForMe()[indexPath.row].lastMessage.owner == .sender && self.itemsForMe()[indexPath.row].lastMessage.isRead == false {
            cell.nameLabel.font = UIFont(name:"AvenirNext-DemiBold", size: 17.0)
            cell.messageLabel.font = UIFont(name:"AvenirNext-DemiBold", size: 14.0)
            cell.timeLabel.font = UIFont(name:"AvenirNext-DemiBold", size: 13.0)
            cell.profilePic.layer.borderColor = GlobalVariables.blue.cgColor
            cell.messageLabel.textColor = GlobalVariables.purple
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if DogViewModel.sharedInstance.dogs.count > 0 {
            //self.selectedUser = self.itemsForMe()[indexPath.row].user
            self.selectedDog = self.itemsForMe()[indexPath.row].dog
            self.performSegue(withIdentifier: "segue", sender: self)
        }
    }
       
    //MARK: ViewController lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customization()
        self.fetchData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectionIndexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: selectionIndexPath, animated: animated)
        }
    }
}





