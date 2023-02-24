//
//  ImageLoadViewController.swift
//  WantedPreOnBorading-pre_Project
//
//  Created by dongyeongkang on 2023/02/16.
//

import UIKit

class ImageLoadViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadAllButton: UIButton!
    
    private var imageList: [UIImage?] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        addAction()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func addAction() {
        loadAllButton.addTarget(self, action: #Selector(loadAllImage), for: .touchUpInside)
    }
    
    @objc
    private func loadAllImage() {
    }

}

extension ImageLoadViewController: UITalbeViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageList.count   
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageListCell.identifier, for: indexPath)
        guard let convertedCell = cell as? ImageListCell else { return cell }
//        convertedCell.setImage()
        
        return convertedCell
    }
}
class ImageListCell: UITableViewCell {

    static let identifier: String = String(describing: ImageListCell.self)
    
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var loadButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
             
    }
    
    public func setImage(_ image: UIImage?) {
        
    }


}
