//
//  MyTripsViewController.swift
//  dtc-travel-app
//
//  Created by Lucinda Krahl on 8/14/17.
//  Copyright © 2017 Pariveda. All rights reserved.
//

import UIKit
import MobileCoreServices

class MyTripsViewController: UICollectionViewController {

    
    
    // MARK: - Properties
    fileprivate let itemsPerRow: CGFloat = 2
    
    // Class attributes
    fileprivate let reuseIdentifier = "tripCell"
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    final fileprivate let tripImages = ["dallas.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellReuseIdentifier: reuseId)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Private
private extension MyTripsViewController {
    func photoForIndexPath(_ indexPath: IndexPath) -> UIImage {
        let tripImage = UIImage(named: tripImages[(indexPath as NSIndexPath).row])
        return tripImage!
    }
}


// MARK: - UICollectionViewDataSource
extension MyTripsViewController {
    //1
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tripImages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? TripPhotoCell else {
            preconditionFailure("Unable to dequeue cell as an TripCollectionViewCell")
        }
        
        cell.imageView.image = UIImage(named: tripImages[0])
        // cell.backgroundColor = UIColor.gray
        cell.layer.cornerRadius = 10.0
        return cell
    }
}

extension MyTripsViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

