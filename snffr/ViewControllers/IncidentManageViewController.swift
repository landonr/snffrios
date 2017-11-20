//
//  IncidentManageViewController.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-09-30.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation
import UIKit

class IncidentManageViewController: UIViewController
{
    @IBOutlet var tableView: UITableView?
    var queue = OperationQueue()
    var message: Message?
    var incidentTypes = ["Question", "Medical Update", "Supplies"]
    var activeDog: Dog?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.layoutIfNeeded()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        
        self.loadData()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.loadData),
            name: NSNotification.Name(rawValue: "newIncident"),
            object: nil)
    }
    
    func loadData()
    {
        self.tableView?.reloadData()
    }
    
    func completeIncident(index: Int) {
        IncidentViewModel.sharedInstance.incidents[index].incidentStatusId = 0
        IncidentViewModel.sharedInstance.updateIncident(IncidentViewModel.sharedInstance.incidents[index])
        self.tableView?.reloadData()
    }
    
    func viewProfile(index: Int) {
        let incident = IncidentViewModel.sharedInstance.incidents[index]
        self.performSegue(withIdentifier: "showProfile", sender: incident)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProfile" {
            if let vc = segue.destination as? DogProfileViewController,
                let incident = sender as? Incident,
                let dogId = incident.dogId {
                vc.activedoggo = DogViewModel.sharedInstance.dogForId(id: String(dogId))
            }
        }
    }
}

extension IncidentManageViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? IncidentManageTVCell {
            let incident = IncidentViewModel.sharedInstance.incidents[indexPath.row]
            cell.incidentStatusLabel.text = incident.message
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let date = dateFormatter.date(from: incident.createdAt!)
            
            let formatter = DateFormatter()
            formatter.dateFormat = "h:mm a"
            formatter.amSymbol = "AM"
            formatter.pmSymbol = "PM"
            
            if let dogid = IncidentViewModel.sharedInstance.incidents[indexPath.row].dogId
                , let dog = DogViewModel.sharedInstance.dogForId(id: String(dogid)) {
                cell.incidentLabel?.text = dog.name
            }
            cell.timeLabel.text = formatter.string(from: date!)
            if incident.incidentStatusId == 0 {
                cell.messageReadLayoutWidth.constant = 0
                cell.layoutIfNeeded()
            } else {
                cell.messageReadLayoutWidth.constant = 10
                cell.layoutIfNeeded()
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return IncidentViewModel.sharedInstance.incidents.count
    }
}

extension IncidentManageViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let incident = IncidentViewModel.sharedInstance.incidents[indexPath.row]
        if let dogId = incident.dogId {
            let dog = DogViewModel.sharedInstance.dogForId(id: String(dogId))
            let message = self.incidentTypes[incident.incidentTypeId!] + " - " + incident.message!
            let alertController = UIAlertController(title: dog?.name, message: message, preferredStyle: .alert)
            let profileButton = UIAlertAction(title: "View Profile", style: .default, handler: { (action) in
                self.viewProfile(index: indexPath.row)
            })
            let dismissButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(profileButton)
            alertController.addAction(dismissButton)
            if incident.incidentStatusId == 1 {
                let completeButton = UIAlertAction(title: "Complete", style: .default, handler: { (action) in
                    self.completeIncident(index: indexPath.row)
                })
                alertController.addAction(completeButton)
            }
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
