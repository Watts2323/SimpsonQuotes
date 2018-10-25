//
//  QuoteDetailViewController.swift
//  SimpsonQuote
//
//  Created by Xavier on 10/25/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

import UIKit

class QuoteDetailViewController: UIViewController {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    
    var quote: Quote?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        guard let quote = quote else { return}
        QuoteController.fetchImage(with: quote) { (image) in
            DispatchQueue.main.async {
                self.characterImageView.image = image
            }
        }
        
    }
    
    
    func updateViews() {
        guard let quote = quote else { return}
        quoteLabel.text = quote.quote
    }
}
