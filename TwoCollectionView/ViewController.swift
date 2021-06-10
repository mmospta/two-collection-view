//
//  ViewController.swift
//  TwoCollectionView
//
//  Created by Phonthep Aungkanukulwit on 10/6/2564 BE.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    
    var list1: [String] = ["0:0", "0:1", "0:2", "0:3", "0:4", "0:5", "0:6"]
    var list2: [[String]] = [["0:0", "0:1"], ["1:0", "1:1", "1:2", "1:3", "1:4"], [], ["3:0"]]
    var itemIndexFirstCell: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstBundle = Bundle(for: FirstCollectionViewCell.self)
        let firstNib = UINib(nibName: "FirstCollectionViewCell", bundle: firstBundle)
        firstCollectionView.register(firstNib, forCellWithReuseIdentifier: "FirstCollectionViewCell")
        
        let secondBundle = Bundle(for: SecondCollectionViewCell.self)
        let secondNib = UINib(nibName: "SecondCollectionViewCell", bundle: secondBundle)
        secondCollectionView.register(secondNib, forCellWithReuseIdentifier: "SecondCollectionViewCell")
        
        // set selected first row
        let indexPath = self.firstCollectionView.indexPathsForSelectedItems?.first ?? IndexPath(item: 0, section: 0)
        self.firstCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally)
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == firstCollectionView {
            return list1.count
        } else if collectionView == secondCollectionView {
            //if check index first dimension list2[_]
            if list2.indices.contains(itemIndexFirstCell) {
                return list2[itemIndexFirstCell].count
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == firstCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionViewCell", for: indexPath) as? FirstCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.delegate = self
            cell.setupUI(string: list1[indexPath.row])
            return cell
        } else if collectionView == secondCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as? SecondCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            if list2.indices.contains(itemIndexFirstCell) {
                cell.setupUI(string: list2[itemIndexFirstCell][indexPath.row])
            }
            return cell
        }
        return UICollectionViewCell()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2, height: 200)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        itemIndexFirstCell = indexPath.row
    }
}

extension ViewController: FirstCollectionViewCellDelegate {
    func didSelectItem() {
        secondCollectionView.reloadData()
    }
}
