//
//  HomeViewController.swift
//  HackNews
//
//  Created by Sai Avinash Vagicherla on 8/22/25.
//

import UIKit

struct News {
    let id: Int?
    let title: String?
    let num_comments: Int?
    let points: Int?
    let authorBy: String?
    let author: String?
    let created_at: String?
}

class HomeViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var listTableView: UITableView!
    var objNewsList: [News]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    listTableView.dataSource = self
    listTableView.delegate = self
        
        let obj1=News(id: 1, title: "by hallak", num_comments: 211, points: 813, authorBy: "Show HN: Draw a fish and watch it swim with the others", author: "hallak", created_at: "4 days ago")
        
        let obj2 = News(id: 2, title: "by baruchel", num_comments: 125, points: 246, authorBy: "At 17, Hannah Cairo solved a major math mystery", author: "Brauchel", created_at: "12 hours ago")
        
        let obj3 = News(id: 3, title: "by elashri", num_comments: 275, points: 242, authorBy: "Replacing tux in my dev workflow", author: "elashri", created_at: "20 hours ago")
        
        objNewsList.append(obj1)
        objNewsList.append(obj2)
        objNewsList.append(obj3)
//
//
//
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objNewsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        Dequeue the rows one by one
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as? ListCell

        
        let objNews: News = objNewsList[indexPath.row]
        cell?.authorLabel.text = objNews.title
        cell?.createdLabel.text = objNews.created_at
        cell?.byAuthor.text = objNews.author
        cell?.pointsLabel.text = String(objNews.points!)
        cell?.numOfComments.text = String(objNews.num_comments!)
        cell?.authorLabelCell.text = objNews.authorBy
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
