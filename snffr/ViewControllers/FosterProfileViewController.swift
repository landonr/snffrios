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
    
    let sections = ["Address", "House", "Phone"]
    
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
    
    @IBAction func didTapSaveButton() {
        if let foster = self.activeFoster {
            let address = Address()
            let house = House()
            let phone = Phone()
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? FosterProfileViewTableViewCell {
                address.addressLine1 = cell.textField?.text
            }
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? FosterProfileViewTableViewCell {
                address.city = cell.textField?.text
            }
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? FosterProfileViewTableViewCell {
                address.postalCode = cell.textField?.text
            }
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as? FosterProfileViewTableViewCell {
                if let feetText = cell.textField?.text,
                    let squareFeet = Int(feetText) {
                    house.squareFeet = squareFeet
                }
            }
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 2)) as? FosterProfileViewTableViewCell {
                phone.phoneNumber = cell.textField?.text
            }
            foster.address = address
            foster.phone = phone
            foster.house = house
            self.activeFoster = foster
            FosterViewModel.sharedInstance.updateFoster(foster: foster)
        }
    }
}

extension FosterProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell") as? FosterProfileViewTableViewCell {
            if let foster = self.activeFoster {
                cell.textField?.delegate = self
                if indexPath.section == 0 {
                    if indexPath.row == 0 {
                        cell.titleLabel.text = "Address"
                        cell.textField?.text = foster.address?.addressLine1
                    } else if indexPath.row == 1 {
                        cell.titleLabel.text = "City"
                        cell.textField?.text = foster.address?.city
                    } else if indexPath.row == 2 {
                        cell.titleLabel.text = "Postal Code"
                        cell.textField?.text = foster.address?.postalCode
                    }
                } else if indexPath.section == 1 {
                    cell.titleLabel.text = "Square Feet"
                    if let squareFeet = foster.house?.squareFeet {
                        cell.textField?.text = String(describing: squareFeet)
                    }
                } else if indexPath.section == 2 {
                    cell.titleLabel.text = "Phone Number"
                    cell.textField?.text = foster.phone?.phoneNumber
                }
            }
            return cell
        }
        return UITableViewCell()
    }
}

extension FosterProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell") as? FosterProfileViewTableViewCell {
            cell.textField?.becomeFirstResponder()
        }
    }
}

extension FosterProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

class FosterProfileViewTableViewCell: UITableViewCell
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
}
