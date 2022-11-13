//
//  ApiHandler.swift
//  Assignment5
//
//  Created by Thet Hlaing Phyo on 11/11/22.
//

import Foundation
class ApiHandler {
    
    
//    func getData(url: URL) {
//        //GET request
//        var request = URLRequest(url: url)
//        let people = ViewController()
//        request.httpMethod = "GET"
//        let task = URLSession.shared.dataTask(with: request) {
//            data, response, error in
//            if let data = data {
//                let decoder = JSONDecoder()
//                do {
//                    let parsedData = try? decoder.decode(Starwar.self, from: data)
//                    people.people += parsedData!.results!
//                    people.nextUrl = parsedData!.next ?? ""
//
//                    for i in people.people {
//                        people.urls.append(i.homeworld!)
//                    }
//
//                    for j in people.urls {
//                        self.getHomeworldName(url: URL(string: j)!)
//                    }
//                }
//                catch {
//                    print(error.localizedDescription)
//                }
//            }
//        }
//        task.resume()
//
//    }
//
//    func getHomeworldName(url: URL) {
//        //GET request
//        var request = URLRequest(url: url)
//        var people = ViewController()
//        request.httpMethod = "GET"
//
//        let task = URLSession.shared.dataTask(with: request) {
//            data, response, error in
//            if let data = data {
//                let decoder = JSONDecoder()
//                do {
//                    let parsedData = try? decoder.decode(Homeworld.self, from: data)
//                    people.homeworld.append((parsedData!.url!, parsedData!.name ?? "none"))
//
//                    //To wait for filling data to array
//                    if people.homeworld.count % 10 == 0 {
//                        DispatchQueue.main.async {
//                            people.myTableView.reloadData()
//                        }
//                        people.isPaginating = false
//                    }
//                }
//                catch {
//                    print(error.localizedDescription)
//                }
//            }
//        }
//        task.resume()
//    }
    
    
    
    
//    func getData(url: URL, model: String) -> AnyObject {
//        //GET request
//        var request = URLRequest(url: url)
//
//        request.httpMethod = "GET"
//        var parsedData : AnyObject?
//        let task = URLSession.shared.dataTask(with: request) {
//            data, response, error in
//            if let data = data {
//                let decoder = JSONDecoder()
//                do
//                {
//                    if model == "Homeworld"
//                    {
//                        parsedData = try? decoder.decode(Homeworld.self, from: data) as AnyObject
//                    }
//                    else if model == "Starwar"
//                    {
//                        parsedData = try? decoder.decode(Starwar.self, from: data) as AnyObject
//                    }
//                    else if model == "Result"
//                    {
//                        parsedData = try? decoder.decode(Result.self, from: data) as AnyObject
//                    }
//                    else if model == "Film"
//                    {
//                        parsedData = try? decoder.decode(Film.self, from: data) as AnyObject
//                    }
//                }
//                catch {
//                    print(error.localizedDescription)
//                }
//            }
//        }
//        task.resume()
//        return parsedData!
//
//    }
    
    
}


//let api = ApiHandler()
//api.getData("url")
