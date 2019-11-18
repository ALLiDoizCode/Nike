//
//  ViewController.swift
//  Nike
//
//  Created by Jonathan Green on 11/13/19.
//  Copyright © 2019 Jonathan Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    var results:[Result] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        // Do any additional setup after loading the view.
        Top_Albums().getAlbums(success: { (albums) in
           self.results = albums.feed?.results ?? [Result]()
           DispatchQueue.main.async {
               self.tableview.reloadData()
           }
        }) { (error) in
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "album", for: indexPath) as! TableViewCell
        
        cell.name.text = results[indexPath.row].name
        cell.artist.text = results[indexPath.row].artistName
        guard let url = URL(string: results[indexPath.row].artworkUrl100) else {
            return cell
        }
        cell.albumImage.load(url:url)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let row = tableview.indexPathForSelectedRow?.row else {
            return
        }
        guard segue.identifier == "detail" else {
            return
        }
        
        let controller = segue.destination as! DetailViewController
        
        controller.result = results[row]
        
    }
}

