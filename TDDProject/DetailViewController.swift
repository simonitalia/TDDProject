//
//  DetailViewController.swift
//  TDDProject
//
//  Created by Simon Italia on 1/10/20.
//  Copyright © 2020 SDI Group Inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let imageView = UIImageView()
    var picture: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //load image from bundle to display
        if let picture = picture {
            imageView.image = UIImage(named: picture)
        }
    }
    
    override func loadView() {
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        
        //set VC view to imageView
        view = imageView
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
