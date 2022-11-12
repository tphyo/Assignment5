//
//  DetailsViewController.swift
//  Assignment5
//
//  Created by Thet Hlaing Phyo on 11/11/22.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var filmsLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    var film = [String]()
    var name : String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        for i in film {
//            print(i)
            let url = URL(string: i)
            getData(url: url!)
            
            
        }
//        for i in filmName {
//            filmsLabel.text = ("\n" + i.title)
//        }
        
        
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
                        let parsedData = try? decoder.decode(Film.self, from: data)
                        DispatchQueue.main.async {
                            self.filmsLabel.text! += ("\n" + parsedData!.title!)
                        }
                        
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
            task.resume()
            
        }
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func ButtonTapped(_ sender: Any) {
        
    }
    
}