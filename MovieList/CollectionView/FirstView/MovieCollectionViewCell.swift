//
//  MovieCollectionViewCell.swift
//  MovieList
//
//  Created by nhi.luu on 06/12/2023.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    func setup(with movie: Movie){
        movieImageView.image = movie.image
        titleLbl.text = movie.title
    }
    
}
