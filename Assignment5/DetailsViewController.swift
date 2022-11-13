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
    
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    var filmsURL = [String]()
    var films = [String]()
    var name : String = ""
    var eyeColor : String = ""
    var hairColor : String = ""
    var homeworld : String = ""
    var titles = [String]()
    
    
    override func viewDidLoad() {
        myActivityIndicator.isHidden = false
        self.myActivityIndicator.startAnimating()
        super.viewDidLoad()
        
        nameLabel.text = name
        hairColorLabel.text = hairColor
        eyeColorLabel.text = eyeColor
        homeworldLabel.text = homeworld
        
        for i in filmsURL {
            let url = URL(string: i)
            getData(url: url!)
        }
        
        //        setData(titles: films)
        
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
                            //                            self.titles.append(parsedData!.title!)
                        }
                        //                        self.setData(titles: self.titles)
                        DispatchQueue.main.async {
                            self.myActivityIndicator.stopAnimating()
                            self.myActivityIndicator.isHidden = true
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
    
    //    func setData(titles: [String]) {
    //        DispatchQueue.main.async {
    //            if titles.count == 0 {
    //                self.filmsLabel.text! = "None"
    //            }
    //            self.filmsLabel.text! = titles.joined(separator: "\n")
    //            self.filmsLabel.numberOfLines = titles.count + 1
    //            self.filmsLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
    //        }
    //    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
