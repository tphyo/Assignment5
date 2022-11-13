//
//  DetailsViewController.swift
//  Assignment5
//
//  Created by Thet Hlaing Phyo on 11/11/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var filmsLabel: UILabel!
    @IBOutlet weak var homeworldLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var films = [String]()
    var name : String = ""
    var eyeColor : String = ""
    var hairColor : String = ""
    var homeworld : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
        hairColorLabel.text = hairColor
        eyeColorLabel.text = eyeColor
        homeworldLabel.text = homeworld
        
        for i in films {
            let url = URL(string: i)
            getData(url: url!)
            
            
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
    
}
