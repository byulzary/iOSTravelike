

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var placeNameLabel: UILabel!
    
    func configure(with placeName: String){
        placeNameLabel.text=placeName
    }
}
