//
//  Drama.swift
//  Netflix
//
//  Created by 이범석 on 6/18/25.
//

import Foundation

struct DramaCollection: Decodable {
    var bigBanner : String
    var dramas : [Drama]
    
    // 이렇게 바꿔서 사용이 가능하다.
    enum CodingKeys : String, CodingKey {
        case bigBanner = "BIG_BANNER"
        case dramas = "DRAMAS"
    }
    
}

struct Drama : Decodable {
    var categoryTitle : String
    var posters : [String]
    
    enum CodingKeys : String, CodingKey {
        case categoryTitle = "CATEGORY_TITLE"
        case posters = "POSTERS"
    }
}
