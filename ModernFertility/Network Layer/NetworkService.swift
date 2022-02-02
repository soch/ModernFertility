//
//  NetworkService.swift
//
//
//  Created by Amit Jain on 1/31/22.
//

import Foundation

public enum HttpMethod : String, Codable {
    case GET
    case POST
    case PUT
    case DELETE
    
    func enumToString() -> String {
        return self.rawValue
    }
}

//force every service implementing NetworkService to set path (& other request params)
public protocol NetworkService {
    var path:String { get set }
    var httpMethodtype:HttpMethod  { get }
}

extension NetworkService {
    var httpMethodType:HttpMethod { return .GET} //default data
    
    func getBaseUrl() -> String {
        return "https://jsonplaceholder.typicode.com/album/1"
    }
    
    func fetchAPI<GenericModel: Decodable>() async throws -> GenericModel  {
        
        guard let url = URL(string: getBaseUrl() + self.path) else { fatalError("Missing URL") }
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod  = httpMethodtype.enumToString()
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data")
        }
       
        let decoder = JSONDecoder()
        //decoder.keyDecodingStrategy = .convertFromSnakeCase
        //decoder.dateDecodingStrategy = .secondsSince1970
        let decodedData = try decoder.decode(GenericModel.self, from: data)
        
        return decodedData
    }
}
