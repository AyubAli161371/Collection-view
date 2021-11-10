//
//  ViewController.swift
//  collectionView
//
//  Created by - on 10/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    let productTypeName: [String] = ["Bedsheet","Books","furniture","kids table","kids","mans wear"]
    let productImage: [UIImage] = [
     UIImage(named: "Bedsheet")!,
     UIImage(named: "Books")!,
     UIImage(named: "furniture")!,
     UIImage(named: "kidstable")!,
     UIImage(named: "kids")!,
     UIImage(named: "manswear")!
        ]

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        // Do any additional setup after loading the view.
    }
    
}



extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    // Asks your data source object for the number of items in the specified section.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productTypeName.count
    }
    // Asks your data source object to provide a supplementary view to display in the collection view.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCollectionViewCell
        cell.myImage.image = productImage[indexPath.item]
        cell.myLabel.text = productTypeName[indexPath.row]
//        cell.layer.cornerRadius = 10
//        cell.layer.borderWidth = 2.0
//        cell.layer.borderColor = UIColor.white.cgColor
        cell.designMyCell()
                return cell
    }
    
    // For size what you want
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let size = (collectionView.frame.size.width - 10) / 2
        return CGSize(width: size, height: size)
    }
}
 
//// For design cell
extension UIView{
    func designMyCell(){
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.masksToBounds = true
        // A Boolean indicating whether sublayers are clipped to the layer's bounds
    }
}

