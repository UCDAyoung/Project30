//
//  RequestAPI.swift
//  DuckDuck
//
//  Created by 박준영 on 10/8/21.
//

import Foundation




func requestDucks(completion : @escaping (_ data : Duck? ) -> Void) {
    
    guard let url : URL = URL(string: "https://random-d.uk/api/random") else {
        completion(nil)
        return
    }
    
    URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
        if let error = error{
            print(error.localizedDescription)
            return
        }
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            completion(nil)
            return
        }
        guard let data = data else{
            return
        }
        do{
            let apiResponse = try JSONDecoder().decode(Duck.self, from: data)
            completion(apiResponse)
            
        }catch(let err){
            print(err.localizedDescription)
        }
    }.resume()
    
}
