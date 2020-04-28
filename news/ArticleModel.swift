//
//  ArticleModel.swift
//  news
//
//  Created by madi on 4/28/20.
//  Copyright © 2020 madi. All rights reserved.
//

import Foundation

protocol ArticleModelProtocol {
       func articlesRetrieved(_ articles:[Article])
       
   }

class ArticleModel {
    
    var delegate:ArticleModelProtocol?
   
    func getArticles()  {
        //send request to API
        
        //parse returned JSON into article instances
        
        //create string URL
        // TODO: extract API key into constants file and append +APIKey
        let stringURL = "https://newsapi.org/v2/everything?q=feminism&language=en&apiKey=376721738440420bb334e9e94fedb8bc"
        
        // create URL object
        let url = URL(string: stringURL)
        
          //check that !nil
        guard url != nil
            else{
                print("couldn't create url object")
                return
            
        }
        
        //get URL session
        
        let session = URLSession.shared
        
        //create data task
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            //check that there is data & that there are no errors
            
            if data != nil && error == nil {
                // parse json using json decoder
                
                let decoder = JSONDecoder()
                
                do {
                    
                    //Parse JSON into article service
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    //get articles
                    let articles = articleService.articles!
                    
                    //pass articles to delegate
                    //pass back to VC
                    DispatchQueue.main.async {
                        self.delegate?.articlesRetrieved(articles) // run in main thread
                    }
                   
                
                }
                catch {
                    print("error retrieving articles")
                }  //end do-catch
                
            } // end if
        } //end data task
        
        //start data task by calling resume method
        dataTask.resume()
        
        
    }
}
