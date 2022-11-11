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
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        let url = URL(string: "https://swapi.dev/api/people/")
//        var api = ApiHandler()
        getData(url: url!)
//        self.myTableView.reloadData()


//        self.myTableView.reloadData()
        // Do any additional setup after loading the view.
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
                   self.people = (parsedData!.results!)
                   print("Parsed Data: \(parsedData!.results!)")
                 DispatchQueue.main.async
                 {
                     self.myTableView.reloadData()
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
            var detailsVC = segue.destination as! DetailsViewController
            let cell = sender as! MyTableViewCell
            let indexPath = myTableView.indexPath(for: cell)
            detailsVC.film = people[indexPath!.row].films!
            detailsVC.name = people[indexPath!.row].name!
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
        cell.homeWorldLabel.text = people[indexPath.row].homeworld
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//       self.performSegue(withIdentifier: "ShowDetailsVC", sender: indexPath.row)
//    }
}


