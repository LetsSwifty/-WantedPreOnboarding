//
//  ImageListCell.swift
//  WantedPreOnBorading-pre_Project
//
//  Created by 강동영 on 2023/02/25.
//

import UIKit

protocol ImageCellAction: AnyObject {
    func loadImage(indexPath: IndexPath)
}

class ImageListCell: UITableViewCell {

    static let identifier: String = String(describing: ImageListCell.self)
    
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var loadButton: UIButton!
    
    weak var delegate: ImageCellAction?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
             
        contentImageView.image = UIImage(systemName: "photo")
        loadButton.layer.cornerRadius = 8
        loadButton.addTarget(self, action: #selector(loadImage), for: .touchUpInside)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print(#function)
        contentImageView.image = UIImage(systemName: "photo")
    }
    
    public func setImage(_ image: UIImage?) {
        DispatchQueue.main.async {
            self.contentImageView.image = image
        }
    }
    
    @objc
    private func loadImage() {
        guard let indexPath = indexPath else { return }
        
        delegate?.loadImage(indexPath: indexPath)
    }


}
