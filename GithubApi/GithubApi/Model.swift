//
//  Model.swift
//  GithubApi
//
//  Created by 박준영 on 10/1/21.
//

import Foundation


struct Follower : Codable {
    var login : String
    var avatarUrl : String
}

class Github { 
     
    
    func requestFlickr(searchKey: String, completion: @escaping (_ data: [Flicker]?) -> Void){
        //사용할 apikey
        let apiKey = "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"
        //작업할 url
        guard let url: URL = URL(string: "https://api.github.com/users/UCDAyoung/followers") else {
            return
        }
        //url을 담은 dataTask, 해당 url을 가지고 할 작업을 담은 dataTask
        let dataTask: URLSessionTask = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            //에러확인
            if let error = error{
                print(error.localizedDescription)
                return
            }
            //응답확인
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completion(nil)
                return
            }
            //데이터 확인
            guard let data = data else{
                return
            }
            //정상 작동 시, 데이터를 사용할 수 있게 decode해서 받아오기
            do{
                let apiResponse = try JSONDecoder().decode(Follower.self, from: data)
                //정상 작동을 해야 그제서야 completion handler 작업 수행 // 클로저
                completion(apiResponse.photos.photo)
            }catch(let err){
                print(err.localizedDescription)
            }
        }
        //모든 작업은 일시정지(suspend) 상태로 진행됨. resume()이 호출돼야 dataTask가 실행됨.
        dataTask.resume()
    }
}


