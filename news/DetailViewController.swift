//
//  DetailViewController.swift
//  news
//
//  Created by madi on 4/28/20.
//  Copyright © 2020 madi. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var articleView: WKWebView!
    var articleUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // check that there is a url
        if articleUrl != nil  {
         
            //create url object
            
            let url = URL(string: articleUrl!)
            
            guard url != nil else {
                return
            }
            let request = URLRequest(url: url!)
            // load it in webview
         //   WKWebView.load(request)
            articleView.load(request)
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
