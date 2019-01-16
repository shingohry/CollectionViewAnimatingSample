//
//  ViewController.swift
//  CollectionViewAnimatingSample
//
//  Created by hiraya.shingo on 2019/01/16.
//  Copyright © 2019 shingo.hiraya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    var data = [4, 3, 2, 1]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addButtonDidTap(_ sender: Any) {
        let next = data.first! + 1
        data.insert(next, at: 0)

        collectionView.performBatchUpdates({
            self.collectionView.insertItems(at: [IndexPath(item: 0, section: 0)])
        }, completion: nil)
    }

    @IBAction func plus2ButtonDidTap(_ sender: Any) {
        let next = data.first! + 1
        data.insert(next, at: 0)
        data.insert(next + 1, at: 0)

        collectionView.performBatchUpdates({
            self.collectionView.insertItems(at: [IndexPath(item: 0, section: 0),
                                                 IndexPath(item: 1, section: 0)])
        }, completion: nil)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        cell.label.text = "\(data[indexPath.item])"
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 160)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//
//    }
}

class Cell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
}
