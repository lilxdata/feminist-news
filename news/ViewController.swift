//
//  ViewController.swift
//  news
//
//  Created by madi on 4/28/20.
//  Copyright © 2020 madi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //create instance of ArticleModel
    var model = ArticleModel()
    var articles = [Article]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //set VC as data source and delegate of table view
        tableView.delegate = self
        tableView.dataSource = self
        
        //get articles from model
        model.delegate = self //assign view controller as delegate
        model.getArticles()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // detect which article the user selected
        // first, detect index path
        let indexPath = tableView.indexPathForSelectedRow
        
        guard indexPath != nil else {
            //no row selected
            return
        }
        
        //get article
        let article = articles[indexPath!.row]
        
        // get reference to detail view controller
        
        let detailVC = segue.destination as! DetailViewController
        // pass article url to detail view controller
        
        detailVC.articleUrl = article.url!
    }
}




extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //get a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell //cast as article cell
        
        //get article
        let article = articles[indexPath.row]
        
        //customize cell
        
        cell.displayArticle(article)
        
        // return cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("table")
    }
    
}

extension ViewController: ArticleModelProtocol {
    // Article Model Protocol Methods
     
     func articlesRetrieved(_ articles: [Article]) {
       // set articles property of VC to articles retrieved from model
        self.articles = articles
        
        //refresh table view after setting articles to articles received (otherwise will be empty array still)
        tableView.reloadData()
     }
}
