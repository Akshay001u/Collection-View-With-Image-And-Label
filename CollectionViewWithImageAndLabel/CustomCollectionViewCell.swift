//
//  CustomCollectionViewCell.swift
//  CollectionViewWithImageAndLabel
//
//  Created by Akshay on 18/04/1956 Saka.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var selectLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectLabel.layer.cornerRadius = 4
        self.selectLabel.layer.masksToBounds = true
        self.selectLabel.layer.borderColor =  UIColor.black.cgColor
        self.selectLabel.layer.borderWidth = 1.0
        self.selectLabel.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
    }
    
    
    var isEditing : Bool = false{
        didSet{
            selectLabel.isHidden = !isEditing
        }
    }
    
    override var isSelected: Bool{
        didSet{
            if isEditing{
                selectLabel.text = isSelected ? "✔" : ""
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        selectLabel.isHidden = !isEditing
    }
}
