//
//  CategoryTableViewCell.swift
//  dtc-travel-app
//
//  Created by Quyen Castellanos on 7/30/17.
//  Copyright © 2017 Pariveda. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let reuseId:String = "entryCell"
    private var images:[String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.register(UINib(nibName: "EntryCell", bundle: nil), forCellWithReuseIdentifier: reuseId)
        print(self.collectionView.bounds.width)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure (images:[String]) {
        self.images = images
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as? EntryCollectionViewCell else {
            preconditionFailure("Unable to dequeue cell as an EntryCollectionViewCell")
        }
        
        cell.image.image = UIImage(named: self.images[indexPath.row])
        
        cell.backgroundColor = UIColor.gray
        cell.layer.cornerRadius = 10.0
        return cell
    }
}
