//
//  ViewController.swift
//  CodableSample
//
//  Created by Kazunori Aoki on 2021/03/30.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tablePetitions: UITableView!
    var petittions = [Petition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablePetitions.dataSource = self
        
        let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        print(urlString)
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petittions = jsonPetitions.results
            tablePetitions.reloadData()
            
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petittions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "countrycell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "countrycell")
        }
        
        let petition = petittions[indexPath.row]
        
        cell?.textLabel?.text = petition.title
        cell?.detailTextLabel?.text = petition.body
        
        return cell!
    }
    
    
}
