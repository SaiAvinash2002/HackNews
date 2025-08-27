import UIKit
class ContactsTableView: UITableViewCell {
//    MARK: Properties
    let contactImage = UIImageView()
    let contactName = UILabel()
    let contactRole = UILabel()
    let contactCountry = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
//      Contact Image
        contactImage.tintColor = UIColor(red: 66/255.0, green: 209/255.0, blue: 245/255.0, alpha: 1.0)
//       contactImage.clipsToBounds = true
//       contactImage.layer.cornerRadius = 70
        contactImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(contactImage)
        
        // Contact Name
        contactName.font = .systemFont(ofSize: 20, weight: .medium)
        contactName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(contactName)
        
        // Contact Role (pill style)
        contactRole.textColor = .white
        contactRole.backgroundColor = UIColor(red: 66/255.0, green: 206/255.0, blue: 248/255.0, alpha: 1.0)
        contactRole.font = .systemFont(ofSize: 12)
        contactRole.layer.cornerRadius = 2
        contactRole.clipsToBounds = true
        contactRole.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(contactRole)
        
// Contact Country
        contactCountry.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(contactCountry)
        
// Constraints
        NSLayoutConstraint.activate([
            contactImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            contactImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contactImage.widthAnchor.constraint(equalToConstant: 60),
            contactImage.heightAnchor.constraint(equalToConstant: 60),
            
            contactName.leadingAnchor.constraint(equalTo: contactImage.trailingAnchor, constant: 10),
            contactName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            
            contactRole.leadingAnchor.constraint(equalTo: contactName.leadingAnchor),
            contactRole.topAnchor.constraint(equalTo: contactName.bottomAnchor, constant: 5),
            contactRole.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            
            contactCountry.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            contactCountry.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contactCountry.widthAnchor.constraint(equalToConstant: 24),
            contactCountry.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func configure(with contact: Contacts) {
        if let imgName = contact.contactImage {
            contactImage.image = UIImage(named: imgName)
        } else {
            contactImage.image = UIImage(named: "1")
        }
        
        contactName.text = contact.contactName
        contactRole.text = contact.contactRole
        
        if let flagName = contact.contactCountry {
            contactCountry.image = UIImage(named:flagName)
        } else {
            contactCountry.image = UIImage(systemName: "globe")
        }
    }
}
