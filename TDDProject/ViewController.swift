//
//  ViewController.swift
//  TDDProject
//
//  Created by Simon Italia on 1/10/20.
//  Copyright © 2020 SDI Group Inc. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    var pictureSelectAction: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //register tableView cell reuse identifier programmatically
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        //setup navigation controller
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Storm Viewer"

        //load images
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pictureSelectAction?(pictures[indexPath.row])
    }

}

