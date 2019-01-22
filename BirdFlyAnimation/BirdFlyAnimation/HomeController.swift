//
//  ViewController.swift
//  BirdFlyAnimation
//
//  Created by Mai Dinh Chuong on 1/22/19.
//  Copyright © 2019 Mai Dinh Chuong. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    // chú ý biến khi khởi tạo bird, phải dùng var để frame của chim có thể thay đổi từ trên xuống dưới.
    private var bird = UIImageView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
        addBird()
        flyUpAndDown()
    }
    
    private func setupUI()
    {
        let background = UIImageView(image: UIImage(named: "BackgroundImage.jpg"))
        background.frame = self.view.bounds;
        background.contentMode = .scaleAspectFill
        self.view.addSubview(background)
    }
    
    private func addBird()
    {
        bird = UIImageView(frame: CGRect(x: 10, y: 30, width: 110, height: 68))
        bird.animationImages = [UIImage(named:"bird0.png")!,
                                UIImage(named:"bird1.png")!,
                                UIImage(named:"bird2.png")!,
                                UIImage(named:"bird3.png")!,
                                UIImage(named:"bird4.png")!,
                                UIImage(named:"bird5.png")!]
        bird.animationRepeatCount = 0;
        bird.animationDuration = 1;
        self.view.addSubview(bird)
        bird.startAnimating()
    }
    
    private func flyUpAndDown()
    {
        UIView.animate(withDuration: 10, animations: {
            self.bird.center = CGPoint(x: self.view.bounds.size.width - 10, y: self.view.bounds.size.height - 30)
        }, completion: { (finished) in
            self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(CGAffineTransform(rotationAngle: 45))
            UIView.animate(withDuration: 5, animations: {
                self.bird.center = CGPoint(x: 10, y: -30)
            }, completion: { (finished) in
                self.bird.transform = CGAffineTransform.identity
                self.flyUpAndDown()
            })
        })
    }
    
    
}
