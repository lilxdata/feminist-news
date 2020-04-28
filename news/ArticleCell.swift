//
//  ArticleCell.swift
//  news
//
//  Created by madi on 4/28/20.
//  Copyright © 2020 madi. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    var articleToDisplay:Article?
    func displayArticle(_ article: Article) {
        
        articleToDisplay = article
        //Set headline
        headlineLabel.text = articleToDisplay!.title
        //download and display image
        
        //check that article HAS an image 
        
        //create url string
        
        var urlImageString = articleToDisplay!.urlToImage
        
        //create url
         var url = URL(string: urlImageString!)
        
        //check that url != nil
        
        guard url != nil
            else {
            print("url does not exist")
            return
            }
        
        //get URL session
        
        var session = URLSession.shared
        
        //create data task
        
        var dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                
            }
        }
        
        // start data task 
        dataTask.resume()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
