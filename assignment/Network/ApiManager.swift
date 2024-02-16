//
//  NetworkManager.swift
//  assignment
//
//  Created by Raqeeb on 2/16/24.
//

import Foundation



protocol NetworkManagerProtocol {
    func perform(_ request: URLRequest,completion:@escaping(Result<Data,NetworkError>)->Void)
}

class NetworkManager: NetworkManagerProtocol {
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func perform(_ request: URLRequest, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let task = urlSession.dataTask(with: request) { resData, response, resError in
            let result: Result<Data,NetworkError>
            defer {
                completion(result)
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                result = .failure(.httpResponseNotFound)
                return
            }
            guard let data = resData else {
                result = .failure(.dataNotFound)
                return
            }
            if httpResponse.statusCode == 200 {
                result = .success(data)
                
            }else if httpResponse.statusCode == 501 {
                result = .failure(.internalServerError)
            }else{
                result = .failure(.error(error: resError))
            }
        }
        
        task.resume()
        
    }
}
