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
            filmsLabel.text! += ("\n" + i)
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
