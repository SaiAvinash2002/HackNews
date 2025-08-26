//
//  SettingsViewController.swift
//  HackNews
//
//  Created by Sai Avinash Vagicherla on 8/25/25.
//

import UIKit

struct Settings {
    var iconTitle: String
    var leftIcon: String
    var rightIcon: String
}

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    var settingsLabel: UILabel!
    var settingsTable: UITableView!
    var searchBox: UISearchBar!
    var filteredSettingsList: [Settings] = []

    var settingsList: [Settings] = [
        Settings(iconTitle: "Airplane Mode", leftIcon: "airplane", rightIcon: "chevron.right"),
        Settings(iconTitle: "Wi-Fi", leftIcon: "wifi", rightIcon: "chevron.right"),
        Settings(iconTitle: "Bluetooth", leftIcon: "phone.connection.fill", rightIcon: "chevron.right"),
        Settings(iconTitle: "Cellular", leftIcon: "antenna.radiowaves.left.and.right", rightIcon: "chevron.right"),
        Settings(iconTitle: "Battery", leftIcon: "battery.100percent", rightIcon: "chevron.right"),
        Settings(iconTitle: "General", leftIcon: "gearshape", rightIcon: "chevron.right"),
        Settings(iconTitle: "Accessibility", leftIcon: "figure.wave", rightIcon: "chevron.right"),
        Settings(iconTitle: "Camera", leftIcon: "camera", rightIcon: "chevron.right"),
        Settings(iconTitle: "Control Center", leftIcon: "switch.2", rightIcon: "chevron.right"),
        Settings(iconTitle: "Display & Brightness", leftIcon: "textformat.size", rightIcon: "chevron.right"),
        Settings(iconTitle: "Home Screen & App Library", leftIcon: "square.grid.2x2", rightIcon: "chevron.right"),
        Settings(iconTitle: "Search", leftIcon: "magnifyingglass", rightIcon: "chevron.right"),
        Settings(iconTitle: "Wallpaper", leftIcon: "photo.fill", rightIcon: "chevron.right"),
        Settings(iconTitle: "Notifications", leftIcon: "bell.badge.fill", rightIcon: "chevron.right"),
        Settings(iconTitle: "Sound & Haptics", leftIcon: "speaker.wave.2.fill", rightIcon: "chevron.right"),
        Settings(iconTitle: "Focus", leftIcon: "moon.fill", rightIcon: "chevron.right"),
        Settings(iconTitle: "Screen Time", leftIcon: "timer", rightIcon: "chevron.right"),
        Settings(iconTitle: "Face ID & Passcode", leftIcon: "faceid", rightIcon: "chevron.right"),
        Settings(iconTitle: "Emergency SOS", leftIcon: "sos", rightIcon: "chevron.right"),
        Settings(iconTitle: "Privacy & Security", leftIcon: "hand.raised.fill", rightIcon: "chevron.right"),
        Settings(iconTitle: "Game Center", leftIcon: "gamecontroller", rightIcon: "chevron.right"),
        Settings(iconTitle: "iCloud", leftIcon: "icloud.fill", rightIcon: "chevron.right"),
        Settings(iconTitle: "Wallet & Apple Pay", leftIcon: "wallet.bifold.fill", rightIcon: "chevron.right"),
        Settings(iconTitle: "Apps", leftIcon: "apps.iphone", rightIcon: "chevron.right"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTable()
    }
    
    func setupUI() {
        view.backgroundColor = .systemGroupedBackground
        
        settingsLabel = UILabel()
        settingsLabel.text = "Settings"
        settingsLabel.font = .systemFont(ofSize: 36, weight: .bold)
        settingsLabel.textAlignment = .left
        settingsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(settingsLabel)
        
//        Search bar
        searchBox = UISearchBar()
        searchBox.placeholder = "Search"
        searchBox.delegate = self
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
        settingsTable = UITableView(frame: .zero, style: .insetGrouped)
        settingsTable.translatesAutoresizingMaskIntoConstraints = false
        settingsTable.delegate = self
        settingsTable.dataSource = self
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
    
    // MARK: - TableView DataSource & Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 6
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
            case 0:
                return 5
            case 1:
                return 8
            case 2:
                return 4
            case 3:
                return 3
            case 4:
                return 3
            case 5:
                return settingsList.count - 23
            default:
                return 0
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsTableViewCell
        
        let setting: Settings
        switch indexPath.section {
            case 0:
                setting = settingsList[indexPath.row]
            case 1:
                setting = settingsList[indexPath.row + 5]
            case 2:
                setting = settingsList[indexPath.row + 13]
            case 3:
                setting = settingsList[indexPath.row + 17]
            case 4:
                setting = settingsList[indexPath.row + 20]
            case 5:
                setting = settingsList[indexPath.row + 23]
            default:
                fatalError("Invalid section")
            }
        cell.configure(with: setting)
        return cell
    }
    
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
                return ""
               }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    
    // MARK: - TableView DataSource & Delegate

    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
//        By default this method value is true
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
//        Send Data to Filter Data
        FilterData(searchBar.text!)
    }
    
    func FilterData(_ input: String){
        for i in settingsList {
            if i.iconTitle.hasPrefix(input) {
                filteredSettingsList.append(i)
                print(i)
            }
        }
//        Send Filtered Data to Table View
    }
}
