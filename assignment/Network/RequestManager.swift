//
//  RequestManager.swift
//  assignment
//
//  Created by Raqeeb on 2/16/24.
//

import Foundation



enum NetworkError : Error {
    case dataNotFound
    case internalServerError
    case httpResponseNotFound
    case decodingError
    case error(error: Error?)
    case urlResuestNotFound
    case invalidServerResponse
}

protocol RequestManagerProtocol {
    
    func performRequest<T:Codable>(router: Router,completion :@escaping(Result<T,NetworkError>)->Void)
}

final class RequestManager: RequestManagerProtocol{
    
    var networkManager : NetworkManagerProtocol
    let parser: DataParser
    
    init(networkManager: NetworkManagerProtocol = NetworkManager(), parser: DataParser = DataParser()) {
        self.networkManager = networkManager
        self.parser = parser
    }
    
    func performRequest<T>(router: Router,completion:@escaping(Result<T, NetworkError>) -> Void) where T : Decodable, T : Encodable {
        
        guard let request = router.urlRequest else {
            completion(.failure(.urlResuestNotFound))
            return
        }
        
        networkManager.perform(request) { dataResult in
            
            var result: Result<T,NetworkError>
            defer {
                completion(result)
            }
            
            switch dataResult {
            case let .success(data):
                
                do {
                    let model: T = try self.parser.parse(data: data)
                    result = .success(model)
                } catch  {
                    
                    result = .failure(.decodingError)
                }
                break
            case let .failure(error):
                result = .failure(error)
            
            }
        }
    }
}
