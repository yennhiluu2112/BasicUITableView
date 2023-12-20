//
//  SecondViewController.swift
//  MovieList
//
//  Created by nhi.luu on 06/12/2023.
//

import UIKit

class SecondViewController: UIViewController {
    var users: [User] = User.getDummyDatas()

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        collectionView.delegate = self
        collectionView.dataSource = self
        setupHeader()
        setUpCell()
   
    }
    
    private func setUpCell(){
        let nib = UINib(nibName: "SecondCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        
        let screenWidth = UIScreen.main.bounds.width - 10
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: (screenWidth/3)*2)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        collectionView!.collectionViewLayout = layout
    }
    
    private func setupHeader(){
        let headerNib = UINib(nibName: "SecondHeaderView", bundle: .main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
    }
    

}

extension SecondViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SecondCollectionViewCell
        
        let item = users[indexPath.row]
        cell.nameLabel.text = item.name
        cell.avatarImageView.image = UIImage(named: "siren")
        return cell
    }
  
    
    
    
}

extension SecondViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! SecondHeaderView
            
            reusableview.frame = CGRect(x: 0 , y: 0, width: self.view.frame.width, height: 50)
            
            reusableview.titleLabel.text = "Users"
            reusableview.totalLabel.text = "\(users.count)"
            
            return reusableview
        default:
            fatalError("Unexpected element kind")
        }
    }
}
 
