//
//  DogProfileViewController.swift
//  snffr
//
//  Created by Landon Rohatensky on 2017-09-29.
//  Copyright © 2017 Landon Rohatensky. All rights reserved.
//

import Foundation
import UIKit

class DogProfileViewController: UIViewController
{
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var profilePicture: UIImageView?
    @IBOutlet var bioField: UITextView?
    @IBOutlet var tableView: UITableView!
    
    let sections = ["Medical", "Vaccinations", "Training"]
    let trainingArray = ["3 years of doggo university", "not trained", "phd in being a good boye."]
    let medicalArray = ["Broken hip in 2014", "Very Healthy", "Underweight"]
    let vaccinationArray = ["All the shots", "the good shots", "no shots"]

    var profileId: String?
    var activedoggo: Dog?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.layoutIfNeeded()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.nameLabel?.text = self.activedoggo?.name
        self.profilePicture?.image = self.activedoggo?.image
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFoster" {
            if let vc = segue.destination as? FosterProfileViewController,
                let fosterid = self.activedoggo?.careGiverId {
                vc.activeFoster = FosterViewModel.sharedInstance.userForId(id: String(fosterid))
            }
        }
    }
}

extension DogProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MedicalInfoViewModel.sharedInstance.medicalsForInfoTypeIdAndDogId(section+1, dogId: (self.activedoggo?.dogId)!).count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = MedicalInfoViewModel.sharedInstance.medicalsForInfoTypeIdAndDogId(indexPath.section+1, dogId: (self.activedoggo?.dogId)!)[indexPath.row].info
        return cell
    }
}
