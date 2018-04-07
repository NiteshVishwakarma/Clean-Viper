//
//  MovieModel.swift
//  TheMoviesApp
//
//  Created by Nitesh Vishwakarma on 22/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import ObjectMapper
import RxSwift
import RxAlamofire

class MovieWrapper : Mappable
{
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        results <- map ["results"]
    }
    var results : [MovieMapper]?
}


class MovieMapper : Mappable
{
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        backdrop_path <- map["backdrop_path"]
        title <- map["original_title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        poster_path <- map["poster_path"]
        release_date <- map["release_date"]
        vote_average <- map["vote_average"]
        vote_count <- map["vote_count"]
    }
    
    var backdrop_path : String?
    var title : String?
    var overview : String?
    var poster_path : String?
    var release_date : String?
    var popularity : String?
    var vote_average : String?
    var vote_count : Int?
    
    
}
extension ObservableType {
    public func mapObject<T: Mappable>(type: T.Type) -> Observable<T> {
        return flatMap { data -> Observable<T> in
            let json = data as? AnyObject
            guard let object = Mapper<T>().map(JSON: json as! [String : Any]) else {
                throw NSError(
                    domain: "",
                    code: -1,
                    userInfo: [NSLocalizedDescriptionKey: "ObjectMapper can't mapping"]
                )
            }
            
            return Observable.just(object)
        }
    }
    
    public func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return flatMap { data -> Observable<[T]> in
            let json = data as? AnyObject
            guard let objects = Mapper<T>().mapArray(JSONObject: json) else {
                throw NSError(
                    domain: "",
                    code: -1,
                    userInfo: [NSLocalizedDescriptionKey: "ObjectMapper can't mapping"]
                )
            }
            
            return Observable.just(objects)
        }
}
}
