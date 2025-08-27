import UIKit

class ContactsTableViewController: UIViewController {
// MARK: - Properties
    private var contactsTitle: UILabel!
    private var contactsTable: UITableView! = UITableView(frame: .zero, style: .plain)
    private var searchBox: UISearchBar! = UISearchBar()
    private var filteredContactsList: [Contacts] = []
    private var contactsList: [Contacts] = Contacts.contactsData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDelegates()
        setupUI()
        setupTable()
    }
    
    func setUpDelegates(){
        contactsTable.delegate = self
        contactsTable.dataSource = self
        searchBox.delegate = self
    }
    
    func setupTable() {
        contactsTable.translatesAutoresizingMaskIntoConstraints = false
        contactsTable.backgroundColor = .white
        contactsTable.register(ContactsTableView.self, forCellReuseIdentifier: "ContactsCell")
        contactsTable.rowHeight = UITableView.automaticDimension
        contactsTable.estimatedRowHeight = 60
        view.addSubview(contactsTable)
        
        NSLayoutConstraint.activate([
            contactsTable.topAnchor.constraint(equalTo: searchBox.bottomAnchor, constant: 20),
            contactsTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            contactsTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            contactsTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - TableView DataSource Methods

extension ContactsTableViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredContactsList.count != 0 ? filteredContactsList.count : contactsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath) as! ContactsTableView
        cell.configure(with: filteredContactsList.isEmpty ? contactsList[indexPath.row] : filteredContactsList[indexPath.row])
        return cell
    }
}

// MARK: - TableView Delegate Methods

extension ContactsTableViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}

// MARK: - SearchBar Delegate Methods

extension ContactsTableViewController : UISearchBarDelegate {
//        searchBarSearchButtonClicked(<#T##UISearchBar#>)
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
//        Send Data to Filter Data
        FilterData(searchBar.text!)
    }
}

// MARK: - Helper Methods

extension ContactsTableViewController {
    func FilterData(_ input: String){
        filteredContactsList = []
        for i in contactsList {
            if i.contactName.hasPrefix(input) {
                filteredContactsList.append(i)
                print(i)
            }
        }
//      Reload Table View
        dataReload()
    }
    
    func dataReload() {
        contactsTable.reloadData()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(red: 66/255.0, green: 209/255.0, blue: 245/255.0, alpha: 1.0)
//      Contacts
        contactsTitle = UILabel()
        contactsTitle.text = "Contacts"
        contactsTitle.font = .systemFont(ofSize: 28, weight: .bold)
        contactsTitle.textColor = .white
        contactsTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contactsTitle)
        
//      Search bar
        searchBox.placeholder = "Search"
        searchBox.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBox)
        
        NSLayoutConstraint.activate([
            contactsTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            contactsTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            searchBox.topAnchor.constraint(equalTo: contactsTitle.bottomAnchor, constant: 20),
            searchBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchBox.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
