//
//  WebSevices.swift
//  weatherApp
//
//  Created by vishnuprasad on 02/06/25.
//

import Foundation

struct Resource<T>{
    let url : URL
    let parse : (Data) -> T?
}
final class WebSevices {
    func loadData<T> (
        resource : Resource<T>,
        completion : @escaping (T?)->()
    ) {
        URLSession.shared.dataTask(with: resource.url){ data , response ,error in
            if let data = data {
                DispatchQueue.main.async{
                    completion(resource.parse(data))
                }
                print(data)
            }else{
                completion(nil)
            }
        }.resume()
    }
}
