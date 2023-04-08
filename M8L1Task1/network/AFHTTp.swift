
import Foundation
import Alamofire

private let IS_TESTER = true
private let DEP_SER = "https://api.github.com/"
private let DEV_SER = "https://api.github.com/"

let headers: HTTPHeaders = [
    "Accept" : "application/json"
]
class AFHTTp{
    
    // MARK: - AFHTTp Requests
    
    class func get(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void){
        AF.request(server(url: url), method: .get, parameters: params, headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    //MARK: - AFHTTp Methods
    class func server(url: String) -> URL {
        if IS_TESTER {
            return URL(string: DEV_SER + url)!
        }
        return URL(string: DEP_SER + url)!
    }
    
    //MARK: - AFHTTp Apis
    static let API_USER_LIST = "users"
    static let API_USER_SINGLE = "users/" //login
    
    //MARK: - AFHTTp params
    class func paramsEmpty() -> Parameters {
        let parameters: Parameters = [:]
        return parameters
    }
    
    
}
