//
//  FriendTableViewCell.swift
//  Vk_api
//
//  Created by Valentin Mironov on 10.07.2021.
//

import UIKit
import Kingfisher
class FriendTableViewCell: UITableViewCell {

    @IBOutlet private weak var secondNameLabel: UILabel!
    @IBOutlet private weak var firstNameLabel: UILabel!
    @IBOutlet private weak var photoImageView: UIImageView!
    
    private var vm: FriendViewModel?
    
    func configure(vm: FriendViewModel){
        self.vm = vm
        secondNameLabel.text = vm.secondName
        firstNameLabel.text = vm.firstName
        photoImageView.kf.setImage(with: vm.imageURL)
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        secondNameLabel.text = "Фамилия"
        firstNameLabel.text = "Имя"
        photoImageView.image = UIImage(systemName: "photo")
    }
}

