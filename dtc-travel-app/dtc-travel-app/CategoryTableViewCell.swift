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
    private var entries:[Entry] = []
    private var delegate:TripBoardViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.register(UINib(nibName: "EntryCell", bundle: nil), forCellWithReuseIdentifier: reuseId)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure (entries:[Entry], delegate:TripBoardViewController) {
        self.entries = entries
        self.delegate = delegate
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.entries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = self.delegate {
            let entryType = entries[indexPath.row].type
            
            switch entryType {
            case "image", "audio":
                delegate.presentImageEntry()
            case "text":
                delegate.presentTextEntry(entry: entries[indexPath.row])
            default:
                break
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as? EntryCollectionViewCell else {
            preconditionFailure("Unable to dequeue cell as an EntryCollectionViewCell")
        }
        
        cell.image.image = UIImage(named: self.entries[indexPath.row].imageString ?? "")
        cell.layer.cornerRadius = 10.0
        return cell
    }
}
