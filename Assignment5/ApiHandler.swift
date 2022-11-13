//
//  ApiHandler.swift
//  Assignment5
//
//  Created by Thet Hlaing Phyo on 11/11/22.
//

import Foundation
class ApiHandler {
    
    func getData(url: URL, model: String) -> AnyObject {
        //GET request
        var request = URLRequest(url: url)
        
        let temp = ViewController()
        request.httpMethod = "GET"
        var parsedJSON : AnyObject!
        var parsedData : AnyObject!
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do
                {
                    if model == "Homeworld"
                    {
                        parsedData = try? decoder.decode(Homeworld.self, from: data) as AnyObject
                    }
                    else if model == "Starwar"
                    {
                        parsedData = try? decoder.decode(Starwar.self, from: data) as AnyObject
                    }
                    else if model == "Result"
                    {
                        parsedData = try? decoder.decode(Result.self, from: data) as AnyObject
                    }
                    else if model == "Film"
                    {
                        parsedData = try? decoder.decode(Film.self, from: data) as AnyObject
                    }
                    //                   temp.homeworldName.append(parsedData!.name!)
                    parsedJSON = parsedData
                    
                    //                   print("Parsed Data: \(parsedData!.name!)")
                    //                 DispatchQueue.main.async
                    //                 {
                    //                     self.myTableView.reloadData()
                    //                 }
                    
                }
                catch {
                    print(error.localizedDescription)
                }
                
                
            }
        }
        task.resume()
        return parsedJSON
        
    }
    
    
}


//let api = ApiHandler()
//api.getData("url")
