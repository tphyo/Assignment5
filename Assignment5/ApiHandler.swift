//
//  ApiHandler.swift
//  Assignment5
//
//  Created by Thet Hlaing Phyo on 11/14/22.
//
// ApiHandler code doesn't work
//import Foundation

//class ApiHandler {
//
//    var object = ViewController()
//    var secondobject = DetailsViewController()
//
//    func getData(url: URL) {
//        object.myActivityIndicator.startAnimating()
//        //GET request
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        let task = URLSession.shared.dataTask(with: request) {
//            data, response, error in
//            if let data = data {
//                let decoder = JSONDecoder()
//                do {
//                        let parsedData = try? decoder.decode(Starwar.self, from: data)
//                        self.object.people = parsedData!.results!
//                        self.object.nextUrl = parsedData!.next ?? ""
//                        self.object.previousUrl = parsedData!.previous ?? ""
//
//                        for i in self.object.people {
//                            self.object.urls.append(i.homeworld!)
//                        }
//
//                        for j in self.object.urls {
//                            self.getHomeworldName(url: URL(string: j)!)
//                        }
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
//        request.httpMethod = "GET"
//
//        let task = URLSession.shared.dataTask(with: request) {
//            data, response, error in
//            if let data = data {
//                let decoder = JSONDecoder()
//                do {
//                        let parsedData = try? decoder.decode(Homeworld.self, from: data)
//                        self.object.homeworld.append((parsedData?.url ?? "none", parsedData?.name ?? "none"))
//
//                    //To wait for filling data to array
//                    if self.object.homeworld.count % 10 == 0 {
//                        DispatchQueue.main.async {
//                            self.object.myTableView.reloadData()
//                        }
//                        //                        self.isPaginating = false
//                    }
//                }
//                catch {
//                    print(error.localizedDescription)
//                }
//            }
//        }
//        task.resume()
//    }
//
//    func getDetailsData(url: URL) {
//        //GET request
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        let task = URLSession.shared.dataTask(with: request) {
//            data, response, error in
//            if let data = data {
//                let decoder = JSONDecoder()
//                do {
//                    let parsedData = try? decoder.decode(Film.self, from: data)
//                    DispatchQueue.main.async {
//                        self.secondobject.filmsLabel.text! += ("\n" + parsedData!.title!)
//                        //                            self.titles.append(parsedData!.title!)
//                    }
//                    //                        self.setData(titles: self.titles)
//                    DispatchQueue.main.async {
//                        self.secondobject.myActivityIndicator.stopAnimating()
//                        self.secondobject.myActivityIndicator.isHidden = true
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
    // Do any additional setup after loading the view.
//}





