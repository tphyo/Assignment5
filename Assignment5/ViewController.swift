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
    @IBOutlet weak var button: UIButton!
    
    var people = [Result]()
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        getData()
//        self.myTableView.reloadData()


//        self.myTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
    
    func getData() {
        guard let url = URL(string: "https://swapi.dev/api/people/")
        else
        {
            return
        }
        //GET request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let parsedData = try? decoder.decode(Starwar.self, from: data)
                    self.people = (parsedData!.results!)
                    print("Parsed Data: \(parsedData!.results!)")
                   
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
        
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
    
    @IBAction func buttonTapped(_ sender: Any) {
        self.myTableView.reloadData()
    }
}


