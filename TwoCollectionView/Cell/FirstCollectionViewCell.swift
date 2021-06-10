//
//  FirstCollectionViewCell.swift
//  TwoCollectionView
//
//  Created by Phonthep Aungkanukulwit on 10/6/2564 BE.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                label.textColor = UIColor.gray
                view.backgroundColor = UIColor.gray
            } else {
                label.textColor = UIColor.white
                view.backgroundColor = UIColor.clear
            }
        }
    }
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupUI(string: String) {
        label.text = string
    }

}
