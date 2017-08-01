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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.register(UINib(nibName: "EntryCell", bundle: nil), forCellWithReuseIdentifier: reuseId)
        let rect = self.collectionView.bounds
        let contentHeight = 9 / (rect.width / 100) * 100
        self.collectionView.bounds = CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.size.width, height: 500)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as? EntryCollectionViewCell else {
            preconditionFailure("Unable to dequeue cell as an EntryCollectionViewCell")
        }
        
        if indexPath.section == 0 {
            let mod = indexPath.row % 3
            
            switch mod {
            case 0:
                cell.image.image = UIImage(named: "food1.jpg")
            case 1:
                cell.image.image = UIImage(named: "food2.jpg")
            case 2:
                cell.image.image = UIImage(named: "speaker.png")
            default:
                break
            }
        }
        
        cell.backgroundColor = UIColor.gray
        cell.layer.cornerRadius = 10.0
        return cell
    }
}
