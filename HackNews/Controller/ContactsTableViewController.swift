import UIKit

struct Contacts {
    var contactImage: String?
    var contactName: String
    var contactRole: String
    var contactCountry: String?
}

class ContactsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    private var contactsTitle: UILabel!
    private var contactsTable: UITableView!
    private var searchBox: UISearchBar!
    private var filteredContactsList: [Contacts] = []
    private var contactsList: [Contacts] = [
        Contacts(contactImage: "1", contactName: "Mohammed Hussain", contactRole: "SEO Specialist", contactCountry: "f1"),
        Contacts(contactImage: "2", contactName: "John Young", contactRole: "Interactive Designer", contactCountry: "f2"),
        Contacts(contactImage: "3", contactName: "Tamilarasi Mohan", contactRole: "Architect", contactCountry: "f3"),
        Contacts(contactImage: "4", contactName: "Kim Yu", contactRole: "Economist", contactCountry: "f4"),
        Contacts(contactImage: "5", contactName: "Derek Fowler", contactRole: "Web Strategist", contactCountry: "f5"),
        Contacts(contactImage: "6", contactName: "Shreya Nithin", contactRole: "Product Designer", contactCountry: "f6"),
        Contacts(contactImage: "7", contactName: "Emily Adams", contactRole: "Editor", contactCountry: "f7")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTable()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(red: 66/255.0, green: 209/255.0, blue: 245/255.0, alpha: 1.0)
        
        contactsTitle = UILabel()
        contactsTitle.text = "Contacts"
        contactsTitle.font = .systemFont(ofSize: 28, weight: .bold)
        contactsTitle.textColor = .white
        contactsTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contactsTitle)
        
        //      Search bar
        searchBox = UISearchBar()
        searchBox.placeholder = "Search"
        searchBox.delegate = self
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
        func setupTable() {
            contactsTable = UITableView(frame: .zero, style: .plain)
            contactsTable.translatesAutoresizingMaskIntoConstraints = false
            contactsTable.delegate = self
            contactsTable.dataSource = self
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
        
        // MARK: - TableView DataSource
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return contactsList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath) as! ContactsTableView
            let contact = contactsList[indexPath.row]
            cell.configure(with: contact)
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        }
        
        // MARK: - SearchBar DataSource
        
//        searchBarSearchButtonClicked(<#T##UISearchBar#>)
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
//        Send Data to Filter Data
        FilterData(searchBar.text!)
    }
    
    func FilterData(_ input: String){
        for i in contactsList {
            if i.contactName.hasPrefix(input) {
                filteredContactsList.append(i)
                print(i)
            }
        }
//        Send Filtered Data to Table View
    }

}
