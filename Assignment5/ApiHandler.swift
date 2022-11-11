//
//  ApiHandler.swift
//  Assignment5
//
//  Created by Thet Hlaing Phyo on 11/11/22.
//

import Foundation
class ApiHandler {
 
    func getData(url: URL) {
     //GET request
     var request = URLRequest(url: url)
     let temp = ViewController()
        
     request.httpMethod = "GET"
     
     let task = URLSession.shared.dataTask(with: request) {
         data, response, error in
         if let data = data {
             let decoder = JSONDecoder()
             do {
                   let parsedData = try? decoder.decode(Starwar.self, from: data)
                   temp.people = (parsedData!.results!)
                   print("Parsed Data: \(parsedData!.results!)")
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
     
 }


}


//let api = ApiHandler()
//api.getData("url")
