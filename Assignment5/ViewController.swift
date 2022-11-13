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
    
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    var people = [Result]()
    var urls = [String]()
    var homeworld = [(String, String)]()
    var nextUrl : String?
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        let url = URL(string: "https://swapi.dev/api/people/")
        self.getData(url: url!)
    }
    
    
    func getData(url: URL) {
        //GET request
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let parsedData = try? decoder.decode(Starwar.self, from: data)
                    self.people += parsedData!.results!
                    self.nextUrl = parsedData!.next
                    
                    for i in self.people {
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
                    self.homeworld.append((parsedData!.url!, parsedData!.name ?? ""))
                    
                    //To wait for filling data to array
                    if self.homeworld.count % 10 == 0 {
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
            detailsVC.films = people[indexPath!.row].films!
            detailsVC.name = people[indexPath!.row].name!
            detailsVC.eyeColor = people[indexPath!.row].eye_color!
            detailsVC.hairColor = people[indexPath!.row].hair_color!
            for (url, place) in homeworld {
                if url == people[indexPath!.row].homeworld {
                    detailsVC.homeworld = place
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
        
        for (url, place) in homeworld {
            if url == people[indexPath.row].homeworld {
                cell.homeWorldLabel.text = place
            }
        }
        
        //initiate paginiation
        if indexPath.item == people.count - 1 {
            myActivityIndicator.isHidden = false
            myActivityIndicator.startAnimating()
            getData(url: URL(string: nextUrl!)!)

        }
        else {
            myActivityIndicator.stopAnimating()
            myActivityIndicator.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //            self.performSegue(withIdentifier: "ShowDetailsVC", sender: indexPath.row)
    }
}


