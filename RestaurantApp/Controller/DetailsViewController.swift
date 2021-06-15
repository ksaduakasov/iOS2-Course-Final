//
//  DetailsViewController.swift
//  RestaurantApp
//
//  Created by Kalbek Saduakassov on 15.06.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    
    var object: MenuEntity.Entities?
    var posterURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(object, posterURL)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        updateUI(object, posterURL)
    }
    
    private func updateUI(_ details: MenuEntity.Entities?, _ posterURL: String?) {
        if let object = object {
            self.titleLabel.text = object.menuname
            self.descriptionLabel.text = object.description
            let posterURL = URL(string: self.posterURL!)
            self.imageView.kf.setImage(with: posterURL)
        }
    }
    

}
