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
        
        //clean up cell before displaying next article
        articleImageView.image = nil
        headlineLabel.text = ""
        
        articleToDisplay = article
        //Set headline
        headlineLabel.text = articleToDisplay!.title
        //download and display image
        
        //check that article HAS an image 
        
        //create url string
        
        var urlImageString = articleToDisplay!.urlToImage!
        
        // check cache manager to see if we've already downloaded the image 
        
        if let imageData = CacheManager.retrieveData(urlImageString) {
            //image has been cached
            //set image view and return
            articleImageView.image = UIImage(data: imageData)
            return
        }
        
        //create url
         var url = URL(string: urlImageString)
        
        //check that url != nil
        
        guard url != nil
            else {
            print("url does not exist")
            return
            }
        
        //get URL session
        
        let session = URLSession.shared
        
        //create data task
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            //check for data / no errors
            if error == nil && data != nil {
                
                //save data in cache
                CacheManager.saveData(urlImageString, data!)
                
                //make sure we are displaying the correct image
                if self.articleToDisplay!.urlToImage == urlImageString {
                    //display image data in image view
                    DispatchQueue.main.async {
                         self.articleImageView.image = UIImage(data: data!)
                    }
                } // end second if
               
            } // end first if
        } // end data task
        
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
