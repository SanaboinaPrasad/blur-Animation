//
//  ViewController.swift
//  FacebookAnimation
//
//  Created by Sriram Prasad on 31/10/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView(image: UIImage(named: "green"))
    let slider = UISlider()
    let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear)
    let visualBlurEffect = UIVisualEffectView(effect: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        setupVisualBlurEffect()
        setupSlider()
        
        animator.addAnimations {
            self.imageView.transform = CGAffineTransform(scaleX: 4, y: 4)
            self.visualBlurEffect.effect = UIBlurEffect(style: .regular)
        }
    }
    
    @objc fileprivate func handleTap(){
        //      it hard to interpolate and  specify such as .5 or 0.25 in the middle of the animation
        UIView.animate(withDuration :1.0) {
            self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
        }
    }
    
    
    fileprivate func setupSlider(){
        slider.frame = CGRect(x: view.frame.width/2, y: view.frame.height/4-slider.frame.width, width: 200 , height: 200)
        view.addSubview(slider)
        slider.addTarget(self, action: #selector(handlerSliderChange), for: .valueChanged)
    }
    
    @objc fileprivate func handlerSliderChange(){
        print(slider.value)
        animator.fractionComplete =  CGFloat(slider.value)
    }
    fileprivate func setupVisualBlurEffect(){
//        let blurEffect = UIBlurEffect(style: .regular)
        view.addSubview(visualBlurEffect)
        visualBlurEffect .frame = view.frame
        
    }
}

