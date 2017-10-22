//
//  ProfileViewController.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-09-29.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController
{
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var profilePicture: UIImageView?
    @IBOutlet var bioField: UITextView?
    @IBOutlet var tableView: UITableView!
    
    let sections = ["Medical", "Vaccinations", "Training"]
    let trainingArray = ["3 years of doggo university", "not trained", "phd masters in being a good boye."]
    let medicalArray = ["Broken hip in 2014", "Very Healthy", "Underweight"]
    let vaccinationArray = ["All the shots", "the good shots", "no shots"]

    var profileId: String?
    var activedoggo: Dog?
    var medicals = [Medical]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.layoutIfNeeded()
    }
    
    func medicalsForId(id: Int) -> [Medical]
    {
        var meds = [Medical]()
        for med in self.medicals {
            if med.medicalInfoTypeId! == id {
                meds.append(med)
            }
        }
        return meds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.nameLabel?.text = self.activedoggo?.name
        self.profilePicture?.image = self.activedoggo?.image
        if let dogid = self.activedoggo?.dogId {
            self.medicals = MedicalInfoViewModel.sharedInstance.userForId(id: String(dogid))!
        }
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.medicalsForId(id: section+1).count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text = self.medicalsForId(id: indexPath.section+1)[indexPath.row].info
        return cell
    }
}
