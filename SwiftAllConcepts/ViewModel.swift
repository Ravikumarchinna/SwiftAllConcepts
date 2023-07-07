//
//  ViewModel.swift
//  MVCSwift
//
//  Created by naresh kukkala on 06/07/23.
//

import UIKit

class ViewModel: NSObject {
    var jsonPlaceHolder1 = [JsonPlaceHolder]()
    var jsonPlaceHolder2 = [JsonPlaceHolder]()
    var jsonPlaceHolder3 = [JsonPlaceHolder]()
    
    static var mainURL = "https://jsonplaceholder.typicode.com/comments?postId="
    
    enum EndPoints: String{
        case jsonPlaceHolderED1 = "2"
        case jsonPlaceHolderED2 = "3"
        case jsonPlaceHolderED3 = "4"
        
        var url: String {
            return mainURL + self.rawValue
        }
    }
    
    func getHomeDataWithDispatchGroup(completion: @escaping ([JsonPlaceHolder]) -> Void) {
        
        ///`Create Object Of DispatchGroup`
        
        let dispatchGroup = DispatchGroup()
  
        
        /// `TASK FIRST--------------------------------`
        // enter for first API
        dispatchGroup.enter()
        
        // Call first API
        getData(EndPoints.jsonPlaceHolderED1.url, [JsonPlaceHolder].self) { data in
            self.jsonPlaceHolder1 = data

            // Once we get data then call Leave
            dispatchGroup.leave()
        }
        
        /// `TASK SECOND--------------------------------`
        // enter for Second  API
        dispatchGroup.enter()
        
        // Call first API
        getData(EndPoints.jsonPlaceHolderED2.url, [JsonPlaceHolder].self) { data in
            self.jsonPlaceHolder2 = data
            
            // Once we get data of second then call Leave
            dispatchGroup.leave()
        }
        
        /// `TASK THIRD--------------------------------`
        // enter for third  API
        dispatchGroup.enter()
        
        // Call third API
        getData(EndPoints.jsonPlaceHolderED3.url, [JsonPlaceHolder].self) { data in
            self.jsonPlaceHolder3 = data
            
            // Once we get data of second then call Leave
            dispatchGroup.leave()
        }

        
        /// `Notify Main thread`
        dispatchGroup.notify(queue: .main) {
            completion(self.jsonPlaceHolder1)
        }
    }
    
    private func getData<DataKind:Codable>(_ url: String,_ dataKind: DataKind.Type, _ completion: @escaping (_ data:DataKind)->Void) {
        let url = URL(string: url)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error == nil && data != nil {
                let convertedData = try! JSONDecoder().decode(dataKind, from: data!)
                completion(convertedData)
            }
        }.resume()
    }
}
