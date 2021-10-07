//
//  NetworkServicesModel.swift
//  AnimeApp
//
//  Created by Memo Figueredo on 30/9/21.
//

import Foundation

class NetworkServicesModel {
//    MARK: - Singleton
    static let shared  =  NetworkServicesModel()
    
   
    // MARK: Managed session to url
    let session = URLSession(configuration: .default)
    
//   MARK: - Generics
    
    func fetchGenricJSONData<T: Decodable>(url: String ,Completion: @escaping(T?, Error?) -> ()) {
        guard let url = URL(string: url) else {return}
        let task = session.dataTask(with: url) { data, response, err in
            if let err = err {
                Completion(nil,err)
                return
            }
            
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                Completion(objects, nil)
            } catch {
                Completion(nil,err)
            }
        }
        task.resume()
    }
    
    
    func fetchTopstories(completion: @escaping (([Results], Error?)-> Void)) {
        
        let token = "fUGq4RWA8G32sBHVOAKdxdX6xZLIK8Xu"
        let URL_BASE = "https://api.nytimes.com/svc/topstories/v2/food.json?api-key=\(token)"
        guard let url = URL(string: URL_BASE) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { data, response, error in
//            print(response!)
            guard let data = data else { return }
            do {
                let topRatesResult = try JSONDecoder().decode(TopStories.self, from: data)

                completion(topRatesResult.results, nil)
            } catch let jsonErr  {
                debugPrint("Failed to decode json:", jsonErr)
                                      completion([], jsonErr)
            }
        }
        task.resume()
        

    }
    
    func fetchListBooks(completion: @escaping (([NewsResults], Error?) -> Void)) {
        let token = "fUGq4RWA8G32sBHVOAKdxdX6xZLIK8Xu"
        let URL_BASE = "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=\(token)"
        guard let url = URL(string: URL_BASE) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in
//            print(response!)
            guard let data = data else { return }
            do {
                let book = try JSONDecoder().decode(BookList.self, from: data)
//                print(book.results)
                completion(book.results, nil)
            } catch  let jsonErr {
                debugPrint("Failed to decode json:", jsonErr)
            }
        }
        task.resume()
    }
    
}


