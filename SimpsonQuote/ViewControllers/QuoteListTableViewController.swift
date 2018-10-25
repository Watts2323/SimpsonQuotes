//
//  QuoteListTableViewController.swift
//  SimpsonQuote
//
//  Created by Xavier on 10/25/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

import UIKit

class QuoteListTableViewController: UITableViewController {
    
    var quotes: [Quote] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuoteController.fetchCharacters { (quotes) in
            guard let quotes = quotes else { return }
            self.quotes = quotes
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return quotes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath)
        
        let quote = quotes[indexPath.row]

        // Configure the cell...
        cell.textLabel?.text = quote.name

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let destinationVC = segue.destination as? QuoteDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return}
            let simpQuotes = quotes[indexPath.row]
            destinationVC.quote = simpQuotes
        }
    }
}
