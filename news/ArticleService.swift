//
//  ArticleService.swift
//  news
//
//  Created by madi on 4/28/20.
//  Copyright © 2020 madi. All rights reserved.
//

import Foundation

struct ArticleService : Decodable {
    var totalResults: Int?
    var articles: [Article]? //array of article struct  
}
