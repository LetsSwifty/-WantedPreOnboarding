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
    
    private let imageList1: [UIImage?] = [
        UIImage(named: "unsplash-baseball1"),
        UIImage(named: "unsplash-nature1"),
        UIImage(named: "unsplash-korea1"),
        UIImage(named: "unsplash-japan1"),
        UIImage(named: "unsplash-soccer1"),
    ]
    
//    private let imageList2: [UIImage?] = [
//        UIImage(named: "unsplash-baseball2"),
//        UIImage(named: "unsplash-nature2"),
//        UIImage(named: "unsplash-korea2"),
//        UIImage(named: "unsplash-japan2"),
//        UIImage(named: "unsplash-soccer2"),
//    ]
    
    
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
        loadAllButton.addTarget(self, action: #selector(loadAllImage), for: .touchUpInside)
    }
    
    @objc
    private func loadAllImage() {
        tableView.reloadData()
    }

}

extension ImageLoadViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageList1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageListCell.identifier, for: indexPath)
        guard let convertedCell = cell as? ImageListCell else { return cell }
        convertedCell.delegate = self
        convertedCell.indexPath = indexPath
        convertedCell.setImage(imageList1[indexPath.row])
        
        return convertedCell
    }
}

extension ImageLoadViewController: ImageCellAction {
    func loadImage(indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)
    }
}
