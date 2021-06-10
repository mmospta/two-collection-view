//
//  SecondCollectionViewCell.swift
//  TwoCollectionView
//
//  Created by Phonthep Aungkanukulwit on 10/6/2564 BE.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupUI(string: String) {
        label.text = string
    }

}
