//
//  ViewController.swift
//  CollectionViewWithImageAndLabel
//
//  Created by Akshay on 18/04/1956 Saka.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var customCollectionView: UICollectionView!
    
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    
    var images = ["A1","A2","A3","A4","A5","A6","A7","A8","A9","A10","A11","A12","A13","A14","A15","A17","A1","A2","A3","A4","A5","A6","A7","A8","A9","A10","A11","A12"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customCollectionView.dataSource = self
        customCollectionView.delegate = self
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        customCollectionView.allowsMultipleSelection = editing
        deleteButton.isEnabled = editing
       
        customCollectionView.indexPathsForVisibleItems.forEach{(indexpath) in
            let cell = customCollectionView.cellForItem(at: indexpath) as! CustomCollectionViewCell
            cell.isEditing = editing
            }
        }
    
   
    
    @IBAction func deleteSelectedItems(_ sender: UIBarButtonItem){
        if let selectedItems = customCollectionView.indexPathsForSelectedItems {
            let items = selectedItems.map{$0.item}.sorted().reversed()
            for item in items{
                images.remove(at: item)
            }
            customCollectionView.deleteItems(at: selectedItems)
        }
    }
}



extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.customCollectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath)as! CustomCollectionViewCell

        cell.imageView.image = UIImage(named: images[indexPath.item])
        cell.isEditing = isEditing
        return cell
    }
}



extension ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionwidth = collectionView.bounds.width
        return CGSize(width: collectionwidth/3, height: collectionwidth/3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
