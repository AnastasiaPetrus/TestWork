//
//  FontsTableViewController.swift
//  TestWork
//
//  Created by Anastasia on 6/7/19.
//  Copyright © 2019 Anastasia. All rights reserved.
//

import UIKit

class FontsTableViewController: UITableViewController {
    var fonts: [Array] = [Array<String>]()
    var familyNames: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllNamesOfFonts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.selectRow(at: getSavedMark(), animated: true, scrollPosition: .none)
    }
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    func getSavedMark() -> IndexPath? {
        var savedMark: IndexPath = IndexPath()
        if isKeyPresentInUserDefaults(key: "SelectedSection") == true &&  isKeyPresentInUserDefaults(key: "SelectedRow") == true{
            let row: NSNumber = NSNumber(value: UserDefaults.standard.integer(forKey: "SelectedRow"))
            let section: NSNumber = NSNumber(value:UserDefaults.standard.integer(forKey: "SelectedSection"))
            savedMark = IndexPath(row: row.intValue, section: section.intValue)
            return savedMark
        } else {
            return nil
        }
    }
    
    func getAllNamesOfFonts() {
        UIFont.familyNames.forEach({ familyName in
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            fonts.append(fontNames)
            familyNames.append(familyName)
        })
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return familyNames.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fonts[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.font = UIFont(name: "\(fonts[indexPath.section][indexPath.row])", size: 16)
        cell.textLabel?.text = "\(fonts[indexPath.section][indexPath.row])"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let savedMark = getSavedMark() {
            if savedMark != indexPath {
                tableView.deselectRow(at: savedMark, animated: false)
            }
        }
        UserDefaults.standard.set(indexPath.section, forKey: "SelectedSection")
        UserDefaults.standard.set(indexPath.row, forKey: "SelectedRow")
        UserDefaults.standard.synchronize()
    }
}
