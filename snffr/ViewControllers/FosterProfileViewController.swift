//
//  FosterProfileViewController.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-11-14.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation
import UIKit

class FosterProfileViewController: UIViewController
{
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var tableView: UITableView!
    
    let sections = ["Medical", "Vaccinations", "Training"]
    let trainingArray = ["3 years of doggo university", "not trained", "phd in being a good boye."]
    let medicalArray = ["Broken hip in 2014", "Very Healthy", "Underweight"]
    let vaccinationArray = ["All the shots", "the good shots", "no shots"]
    
    var profileId: String?
    var activeFoster: Foster?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.layoutIfNeeded()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        if let firstName = self.activeFoster?.firstName, let lastName = self.activeFoster?.lastName {
            self.nameLabel?.text = firstName + " " + lastName
        }
    }
}

extension FosterProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return MedicalInfoViewModel.sharedInstance.medicalsForInfoTypeIdAndDogId(section+1, dogId: (self.activedoggo?.dogId)!).count
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cell.textLabel?.text = MedicalInfoViewModel.sharedInstance.medicalsForInfoTypeIdAndDogId(indexPath.section+1, dogId: (self.activedoggo?.dogId)!)[indexPath.row].info
        return cell
    }
}
