//
//  ViewController.swift
//  WantedPreOnboarding
//
//  Created by Taehwan Kim on 2023/02/23.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var imageViewFive: UIImageView!
    @IBOutlet weak var imageViewFour: UIImageView!
    @IBOutlet weak var imageViewThree: UIImageView!
    @IBOutlet weak var imageViewTwo: UIImageView!
    @IBOutlet weak var imageViewOne: UIImageView!
    
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonAll: UIButton!
    
    private let operationQueue = OperationQueue()
    private var imageDatas: [Data] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        imageTag()
    }
    
    private func imageTag() {
        imageViewFive.tag = 5
        imageViewFour.tag = 4
        imageViewThree.tag = 3
        imageViewTwo.tag = 2
        imageViewOne.tag = 1
    }
    
    
    
    @IBAction func buttonFiveTapped(_ sender: Any) {
        DispatchQueue.main.async {
            self.imageViewFive.image = UIImage(systemName: "photo")
        }
        operationQueue.addOperation {
            let viewModel = ViewModel(imageURL: WPModel.fiveImageUrl)
            viewModel.fetchImage { [weak self] result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        let image = UIImage(data: data)
                        self?.imageViewFive.image = image
                    }
                case .failure(let error):
                    print(String(describing: error))
                    break
                }
            }
        }
    }
    
    @IBAction func buttonFourTapped(_ sender: Any) {
        DispatchQueue.main.async {
            self.imageViewFour.image = UIImage(systemName: "photo")
        }

        operationQueue.addOperation {
            let viewModel = ViewModel(imageURL: WPModel.fourImageUrl)
            viewModel.fetchImage { [weak self] result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        let image = UIImage(data: data)
                        self?.imageViewFour.image = image
                    }
                case .failure(let error):
                    print(String(describing: error))
                    break
                }
            }
        }

    }

    @IBAction func buttonThreeTapped(_ sender: Any) {
        DispatchQueue.main.async {
            self.imageViewThree.image = UIImage(systemName: "photo")
        }
        operationQueue.addOperation {
            let viewModel = ViewModel(imageURL: WPModel.threeImageUrl)
            viewModel.fetchImage { [weak self] result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        let image = UIImage(data: data)
                        self?.imageViewThree.image = image
                    }
                case .failure(let error):
                    print(String(describing: error))
                    break
                }
            }
        }
    }

    @IBAction func buttonTwoTapped(_ sender: Any) {
        DispatchQueue.main.async {
            self.imageViewTwo.image = UIImage(systemName: "photo")
        }
        operationQueue.addOperation {
            let viewModel = ViewModel(imageURL: WPModel.twoImageUrl)
            viewModel.fetchImage { [weak self] result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        let image = UIImage(data: data)
                        self?.imageViewTwo.image = image
                    }
                case .failure(let error):
                    print(String(describing: error))
                    break
                }
            }
        }
    }
    
    @IBAction func buttonOneTapped(_ sender: Any) {
        DispatchQueue.main.async {
            self.imageViewOne.image = UIImage(systemName: "photo")
        }

        operationQueue.addOperation {
            let viewModel = ViewModel(imageURL: WPModel.oneImageUrl)
            viewModel.fetchImage { [weak self] result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        let image = UIImage(data: data)
                        self?.imageViewOne.image = image
                    }
                case .failure(let error):
                    print(String(describing: error))
                    break
                }
            }
        }
    }
    
    @IBAction func buttonAllTapped(_ sender: Any) {
        DispatchQueue.main.async {
            self.imageViewFive.image = UIImage(systemName: "photo")
            self.imageViewFour.image = UIImage(systemName: "photo")
            self.imageViewThree.image = UIImage(systemName: "photo")
            self.imageViewTwo.image = UIImage(systemName: "photo")
            self.imageViewOne.image = UIImage(systemName: "photo")
        }
        let urls = [WPModel.oneImageUrl, WPModel.twoImageUrl, WPModel.threeImageUrl, WPModel.fourImageUrl, WPModel.fiveImageUrl]
        
        for (index, url) in urls.enumerated() {
            let imageView = self.view.viewWithTag(index + 1) as! UIImageView
            let viewModel = ViewModel(imageURL: url)
            viewModel.fetchImage { result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.sync {
                            let image = UIImage(data: data)
                            imageView.image = image
                    }
                case .failure(let error):
                    print(String(describing: error))
                    break
                }
            }
        }
    }
}

