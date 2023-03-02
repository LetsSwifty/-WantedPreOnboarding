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
    
    private var imageStringList: [String] = []
    private var imageList: [UIImage?] = []
    private let imageList1: [UIImage?] = [
        UIImage(named: "unsplash-baseball1"),
        UIImage(named: "unsplash-nature1"),
        UIImage(named: "unsplash-korea1"),
        UIImage(named: "unsplash-japan1"),
        UIImage(named: "unsplash-soccer1"),
    ]
    
    
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

// MARK: Network Method
extension ImageLoadViewController {
    private func requestImage() {
        let api = NetworkService.getImage(query: "movie", offset: 0, limit: NetworkService.limit)
        api.request(withDataType: UnsplashAPIResponse.self) { result in
            switch result {
            case .success(let response):
                print("success = \(response)")
                self.process(data: response)
            case .failure:
                print("failure")
            }
        }
    }
    
    private func process(data: UnsplashAPIResponse) {
        let result = data.results
        
        for i in 0..<4 {
            guard let url = URL(string: result[i].urls.regular) else { return }
            convert(image: url)
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func convert(image url: URL) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let imageData = data else { return }
            
            self.imageList.append(UIImage(data: imageData))
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource Method
extension ImageLoadViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return imageList1.count
        return imageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageListCell.identifier, for: indexPath)
        guard let convertedCell = cell as? ImageListCell else { return cell }
        convertedCell.delegate = self
        convertedCell.indexPath = indexPath
//        convertedCell.setImage(imageList1[indexPath.row])
        convertedCell.setImage(imageList[indexPath.row])
        
        return convertedCell
    }
}

// MARK: ImageCellAction Method
extension ImageLoadViewController: ImageCellAction {
    func loadImage(indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)
    }
}
