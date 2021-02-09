//
//  TableViewController.swift
//  Task1.2
//
//  Created by Denis Larin on 08.02.2021.
//

import UIKit

class TableViewController: UITableViewController {
            
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        guard let url = URL(string: "https://placehold.it/375x150?text=\(indexPath.row + 1)") else { return cell }
        downloadImage(withURL: url, forCell: cell)
        
        return cell
    }
    
    func downloadImage(withURL url: URL, forCell cell: UITableViewCell) {
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil { return }

            guard let data = data else { return }

            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                cell.imageView?.image = image
                cell.setNeedsLayout()
            }
        }
        
        task.resume()
    }
    
}

