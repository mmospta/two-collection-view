//
//  FirstCollectionViewCell.swift
//  TwoCollectionView
//
//  Created by Phonthep Aungkanukulwit on 10/6/2564 BE.
//

import UIKit

protocol FirstCollectionViewCellDelegate {
    func didSelectItem()
}

class FirstCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    
    var delegate: FirstCollectionViewCellDelegate?
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                label.textColor = UIColor.gray
                view.backgroundColor = UIColor.gray
                // delegate
                delegate?.didSelectItem()
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
