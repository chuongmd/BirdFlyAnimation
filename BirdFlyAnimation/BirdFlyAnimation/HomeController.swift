//
//  ViewController.swift
//  BirdFlyAnimation
//
//  Created by Mai Dinh Chuong on 1/22/19.
//  Copyright © 2019 Mai Dinh Chuong. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    // chú ý biến khi khởi tạo bird, phải dùng var để frame của chim có thể thay đổi từ trên xuống dưới
    private var bird = UIImageView()
    private var birdewidth: CGFloat = 0.0
    private var birdheight: CGFloat = 0.0
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
        addBird()
        fly()
    }
    
    private func setupUI()
    {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        
        backgroundImage.image = UIImage(named: "BackgroundImage.jpg")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.addSubview(backgroundImage)
    }
    
    private func addBird()
    {
        bird = UIImageView(frame: CGRect(x: 30, y: 30, width: 110, height: 68))
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
    
    private func birdMove(duration : TimeInterval, x: CGFloat, y: CGFloat, scaleX: CGFloat, scaleY: CGFloat, rotation: CGFloat, callback: @escaping ()->())
    {
        UIView.animate(withDuration: 5, animations: {
            self.bird.center = CGPoint(x: x, y: y)
        }, completion: { (finished) in
            self.bird.transform = .identity
            self.bird.transform = CGAffineTransform(scaleX: scaleX, y: scaleY).concatenating(CGAffineTransform(rotationAngle: rotation))
            callback()
        })
    }
    
    private func fly() {
        let width = self.view.bounds.size.width
        let height = self.view.bounds.size.height
        
        birdMove(duration: 5, x: width-50, y: height-34, scaleX: -1, scaleY: 1, rotation: 0) {
            self.birdMove(duration: 5, x: 50, y: height-34, scaleX: -1, scaleY: -1, rotation: 90, callback: {
                self.birdMove(duration: 5, x: width-50, y: 34, scaleX: -1, scaleY: 1, rotation: 0, callback: {
                    self.birdMove(duration: 5, x: 30, y: 30, scaleX: 1, scaleY: 1, rotation: 0, callback: {
                        self.fly()
                    })
                })
            })
        }
    }
}
