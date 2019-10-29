//
//  ApiRouter.swift
//  
//
//  Created by user on 10/28/19.
//
import  Alamofire
import Foundation
let baseURL = "http://i0sa.com/"
///security -> allow arbitary rules
enum ApiRouter : URLRequestConvertible {
    
    case Home
    case ResturantType(params : Parameters)
    case ResturantDetails(params : Parameters)
    var type : HTTPMethod {
        return .get
    }
    var path :String {
        switch  self {
        case  .Home:
            return "Home"
        case .ResturantDetails:
            return "Rest"
            
        case .ResturantType:
            return "RestTypes"
            
        }
    }
    var params : Parameters? {
        switch self {
        case .ResturantType(let params) , .ResturantDetails(let params):
            return params
        default:
            return nil
        }
    }
    var encoding :ParameterEncoding {
        return URLEncoding.default
    }
    
    func asURLRequest() throws -> URLRequest {
        let request = try URLRequest(url: baseURL + path ,method: type)
        if let params = params {
            return try URLEncoding.default.encode(request, with: params)
        }
        return request
        
    }
}
