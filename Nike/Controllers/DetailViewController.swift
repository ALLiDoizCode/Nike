//
//  DetailViewController.swift
//  Nike
//
//  Created by Jonathan Green on 11/17/19.
//  Copyright © 2019 Jonathan Green. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController {
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var copywrite: UILabel!
    var result:Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = result?.name
        artist.text = result?.artistName
        releaseDate.text = result?.releaseDate
        copywrite.text = result?.copyright
        guard let url = URL(string: result?.artworkUrl100 ?? "") else {
            return
        }
        albumImage.load(url:url)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func openStore(_ sender: Any) {
        print(result?.artistUrl ?? "")
        if let url = URL(string: result?.artistUrl ?? "") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
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
