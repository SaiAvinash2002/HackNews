//
//  SettingsViewController.swift
//  HackNews
//
//  Created by Sai Avinash Vagicherla on 8/25/25.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var settingsLabel: UILabel!
    var settingsTable: UITableView! = UITableView(frame: .zero, style: .insetGrouped)
    var searchBox: UISearchBar! = UISearchBar()
    var filteredSettingsList: [Settings] = []
    var settingsDictonary = Settings.getData()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDelegate()
        setupUI()
        setupTable()
    }
    
    func setUpDelegate(){
        searchBox.delegate = self
        settingsTable.delegate = self
        settingsTable.dataSource = self
    }
    
    func setupUI() {
        view.backgroundColor = .systemGroupedBackground
        //      Settings Title
        settingsLabel = UILabel()
        settingsLabel.text = "Settings"
        settingsLabel.font = .systemFont(ofSize: 36, weight: .bold)
        settingsLabel.textAlignment = .left
        settingsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(settingsLabel)
        
        //      Search bar
        searchBox.placeholder = "Search"
        searchBox.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBox)
        
        NSLayoutConstraint.activate([
            settingsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 42),
            settingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            settingsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            searchBox.topAnchor.constraint(equalTo: settingsLabel.bottomAnchor, constant: 20),
            searchBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchBox.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupTable() {
        settingsTable.translatesAutoresizingMaskIntoConstraints = false
        settingsTable.backgroundColor = .systemGroupedBackground
        settingsTable.separatorStyle = .singleLine
        settingsTable.register(SettingsTableViewCell.self, forCellReuseIdentifier: "SettingsCell")
        view.addSubview(settingsTable)
        
        NSLayoutConstraint.activate([
            settingsTable.topAnchor.constraint(equalTo: searchBox.bottomAnchor, constant: 20),
            settingsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - TableView DataSource & Delegate

extension SettingsViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return settingsDictonary["Network"]!.count
        case 1:
            return settingsDictonary["General"]!.count
        case 2:
            return settingsDictonary["Notifications"]!.count
        case 3:
            return settingsDictonary["Privacy"]!.count
        case 4:
            return settingsDictonary["Payments & Storage"]!.count
        case 5:
            return settingsDictonary["Others"]!.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsTableViewCell
        
        let setting: Settings
        switch indexPath.section {
        case 0:
            setting = settingsDictonary["Network"]![indexPath.row]
        case 1:
            setting = settingsDictonary["General"]![indexPath.row]
        case 2:
            setting = settingsDictonary["Notifications"]![indexPath.row]
        case 3:
            setting = settingsDictonary["Privacy"]![indexPath.row]
        case 4:
            setting = settingsDictonary["Payments & Storage"]![indexPath.row]
        case 5:
            setting = settingsDictonary["Others"]![indexPath.row]
        default:
            fatalError("Invalid section")
        }
        cell.configure(with: setting)
        return cell
    }
}

extension SettingsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Network"
        case 1:
            return "General"
        case 2:
            return "Notifications"
        case 3:
            return "Privacy"
        case 4:
            return "Payments & Storage"
        default:
            return "Others"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
}
    
// MARK: - SearchBar Delegate Methods

extension SettingsViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
//        Send Data to Filter Data
        FilterData(searchBar.text!)
    }
}

// MARK: - Helper Functions

extension SettingsViewController{
    func FilterData(_ input: String){
        filteredSettingsList = []
        for settings in settingsDictonary.values {
            for setting in settings{
                if setting.iconTitle.hasPrefix(input) {
                    filteredSettingsList.append(setting)
            }
        }
    }
//        Send Filtered Data to Table View
        settingsTable.reloadData()
    }
}
