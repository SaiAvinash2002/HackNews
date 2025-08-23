//
//  HomeViewController.swift
//  HackNews
//
//  Created by Sai Avinash Vagicherla on 8/22/25.
//

import UIKit

struct News {
    let id: String?
    let title: String?
    let num_comments: Int?
    let points: Int?
    let url: String?
    let author: String?
    let created_at: String?
}

class HomeViewController: UIViewController , UITableViewDataSource{
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as? ListCell
        cell?.authorLabelCell.text = "Show HN: Draw a fish and watch it swim with the others"
      return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
