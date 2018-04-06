//
//  GetCSRFImpl.swift
//  MovieList
//
//  Created by Nitesh Vishwakarma on 21/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire

class GetCSRFUseCaseImpl : GetCSRFUseCase
{
    
    private var headers = ["Accept":"*/*","Accept-Encoding":"gzip, deflate, br","Accept-Language":"en-GB,en-US;q=0.9,en;q=0.8","Connection":"keep-alive","Content-Type":"application/json","cuid":"undefined","Host":"test.interviewair.com","Origin":"https://test.interviewair.com","Referer":"https://www.interviewair.com/dev/restagent/","User-Agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36","X-CSRFToken":"","X-Requested-With":"XMLHttpRequest"]
    func getCSRF() -> Observable<String> {
        var data = ""
        
        return RxAlamofire.requestData(.get, "https://test.interviewair.com/pages/getcsrf/")
            .debug()
            .map {
                response in
                print(response)
                
                if let
                    headerFields = response.0.allHeaderFields  as? [String: String],
                    let URL = response.0.url
//                let dict =  response.response?.allHeaderFields[String: Any]
                {
                    var cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: URL)
                    data = cookies.remove(at: 0).value
                }
                
                return data
            }
}

        
        
        
        
        
        
        //let result = Just.get("")
//        let result = Alamofire.request("")
//        print("result : \(result)")
//        return RxAlamofire
//            .request("https://test.interviewair.com/pages/getcsrf/" as! URLRequestConvertible)
//            .subscribe({onNext : {
//                response in
//
//                }} as! (Event<DataRequest>) -> Void) as! Observable<String>
//
//    }
//        if result.ok
//        {
//            data =  (result.cookies["csrftoken"]?.value)!
//            print("Data : \(data)")
//
//        }
        
}
    
    
    
    

