//
//  IncidentViewController.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-09-30.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
class IncidentSubmitViewController: UIViewController
{
    @IBOutlet var messageLabel: UITextView?
    @IBOutlet var tableView: UITableView?
    
    var messageString = ""
    var message: Message?
    var incident = ["Question", "Medical Update", "Supplies"]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.layoutIfNeeded()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let message = self.message?.content as? String {
            self.messageLabel?.text = message
            self.messageString = message
        }
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.tableView?.reloadData()
    }
    
    @IBAction func didTapMedical(_ sender: Any) {
        
    }
        
    @IBAction func didTapSupplies(_ sender: Any) {

    }
        
    @IBAction func didTapOther(_ sender: Any) {
        
    }
}

extension IncidentSubmitViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? IncidentTVCell {
            cell.incidentLabel.text = self.incident[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.incident.count
    }
}

extension IncidentSubmitViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var newIncident = Incident(message: self.messageString)
        if let dogid = self.message?.dogId {
            newIncident.dogId = Int(dogid)
        }
        newIncident.incidentTypeId = indexPath.row
        
        let dict = newIncident.dictionaryRepresentation()
        
        Alamofire.request("http://rezqs.herokuapp.com/api/incidents", method: .post, parameters: dict, encoding: JSONEncoding.default, headers: nil).responseString { (responseString) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newIncident"), object: nil, userInfo: nil)
        }
        
        let alertController = UIAlertController(title: "Incident Submitted", message: nil, preferredStyle: .alert)
        let completeButton = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            self.navigationController?.popViewController(animated: true)
        })
        alertController.addAction(completeButton)
        self.present(alertController, animated: true, completion: nil)
    }
}
