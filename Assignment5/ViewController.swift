//
//  ViewController.swift
//  Assignment5
//
//  Created by Thet Hlaing Phyo on 11/10/22.
//
//  Emonic Academy
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var people = [Result]()
    var homeworldLink = [Result]()
    var homeworldName = [String]()
    var name : String = ""
    var urls = [String]()
    var homeworld = [(String, String)]()
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        let url1 = URL(string: "https://swapi.dev/api/people/")
        self.getData(url: url1!)
        //        let api = ApiHandler()
        //        let first = api.getData(url: url1!, model: "Starwar")
        //        self.people = first.results! as! [Result]
        
        //        let url1 = URL(string: homeworldLink)
        //        getData1(url: url!)
        
        
        
        
    }
    
    
    func getData(url: URL) {
        //GET request
        var request = URLRequest(url: url)
        //     let temp = ViewController()
        
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let parsedData = try? decoder.decode(Starwar.self, from: data)
                    self.people = parsedData!.results!
                    self.homeworldLink = parsedData!.results!
                    
                    for i in self.homeworldLink {
                        self.urls.append(i.homeworld!)

                    }

                    for j in self.urls {
                        self.getHomeworldName(url: URL(string: j)!)
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
        
    }
    
    func getHomeworldName(url: URL) {
        //GET request
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let parsedData = try? decoder.decode(Homeworld.self, from: data)
                    
                    self.name = parsedData!.name!
                    
                    self.homeworldName.append(self.name)
                    
                    self.homeworld.append((parsedData!.url!, parsedData!.name!))
                    
                    //To wait for filling data to array
                    if self.homeworldName.count == 10 {
                        DispatchQueue.main.async {
                            self.myTableView.reloadData()
                        }
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailsVC" {
            let detailsVC = segue.destination as! DetailsViewController
            let cell = sender as! MyTableViewCell
            let indexPath = myTableView.indexPath(for: cell)
            detailsVC.film = people[indexPath!.row].films!
            detailsVC.name = people[indexPath!.row].name!
            detailsVC.eyeColor = people[indexPath!.row].eye_color!
            detailsVC.hairColor = people[indexPath!.row].hair_color!
//            detailsVC.homeworld = homeworldName[indexPath!.row]
            for (i,j) in homeworld {
                if i == people[indexPath!.row].homeworld {
                    detailsVC.homeworld = j
                }
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        cell.characterLabel.text = people[indexPath.row].name
        cell.eyeColorLabel.text = people[indexPath.row].eye_color
        cell.hairColorLabel.text = people[indexPath.row].hair_color
        
        for (i,j) in homeworld {
            if i == people[indexPath.row].homeworld {
                cell.homeWorldLabel.text = j
            }
        }
//        cell.homeWorldLabel.text = homeworldName[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    @IBAction func ButtonTapped(_ sender: Any) {
        self.myTableView.reloadData()
        
    }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            self.performSegue(withIdentifier: "ShowDetailsVC", sender: indexPath.row)
        }
}


