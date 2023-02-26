//
//  ViewController.swift
//  grizzly-iOS
//
//  Created by 임 용관 on 2023/02/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    @IBOutlet weak var fourthImage: UIImageView!
    @IBOutlet weak var fifthImage: UIImageView!
    
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var fifthButton: UIButton!
    
    @IBOutlet weak var lastButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstImage.image = UIImage(systemName: "photo")
        secondImage.image = UIImage(systemName: "photo")
        thirdImage.image = UIImage(systemName: "photo")
        fourthImage.image = UIImage(systemName: "photo")
        fifthImage.image = UIImage(systemName: "photo")
        // Do any additional setup after loading the view.
        
    }

    @IBAction func firstAction(_ sender: Any) {
        let url = URL(string: "https://www.adobe.com/kr/creativecloud/photography/hub/guides/media_159fdae2ae33a36aa49f0f2b79fcd72a312252c8f.jpeg?width=2000&format=webply&optimize=medium")
        firstImage.load(url: url!)
        firstImage.reset()
    }
    
    @IBAction func secondAction(_ sender: Any) {
        let url = URL(string: "https://mediahub.seoul.go.kr/wp-content/uploads/2020/10/d13ea4a756099add8375e6c795b827ab.jpg")
        secondImage.load(url: url!)
        secondImage.reset()
    }
    
    @IBAction func thirdAction(_ sender: Any) {
        let url = URL(string: "https://d2v80xjmx68n4w.cloudfront.net/gigs/fPoZ31584321311.jpg")
        thirdImage.load(url: url!)
        thirdImage.reset()
    }
    
    @IBAction func fourthAction(_ sender: Any) {
        let url = URL(string: "https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/4dit/image/NOs1ajU_u2GUfLb-aWQk9Z6oxPs")
        fourthImage.load(url: url!)
        fourthImage.reset()
    }
    
    @IBAction func fifthAction(_ sender: Any) {
        let url = URL(string: "https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/04/a0004023/img/basic/a0004023_main.jpg?20191226165401")
        fifthImage.load(url: url!)
        fifthImage.reset()
    }
    
    @IBAction func lastAction(_ sender: Any) {
        fifthAction(sender)
        fourthAction(sender)
        thirdAction(sender)
        secondAction(sender)
        firstAction(sender)
    }
    
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    func reset() {
        DispatchQueue.global().async { [weak self] in
            DispatchQueue.main.async {
                self?.image = UIImage(systemName: "photo")
            }
        }
    }
}

