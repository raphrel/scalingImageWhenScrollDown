//
//  ViewController.swift
//  scalingImageWhenScrollDown
//
//  Created by ankierman on 02/11/15.
//  Copyright © 2015 ankierman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        self.automaticallyAdjustsScrollViewInsets = false
   }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let imageHeight = imageView.frame.height
        
        let newOrigin = CGPoint(x: 0, y: -imageHeight)
        
        scrollView.contentOffset = newOrigin
        scrollView.contentInset = UIEdgeInsets(top: imageHeight, left: 0, bottom: 0, right: 0)
    }
 
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        
        if offsetY < 0
        {
            imageView.frame.size.height = -offsetY
        }
        else
        {
            imageView.frame.size.height = imageView.frame.height
        }
    }
}