//
//  ViewController.swift
//  pinch pan Image View
//
//  Created by Mac on 17/02/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        pinch()
        pan()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pan()
    }
    
    func pan()
    {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(onClickImageview))
        //panGesture.minimumNumberOfTouches = 2 for moving the image with two touchech
        image.addGestureRecognizer(panGesture)
    }
    @objc
    func onClickImageview(recogizer: UIPanGestureRecognizer)
    {
        let tranlation = recogizer.translation(in: self.view)
        if let view = recogizer.view{
            view.center = CGPoint(x: view.center.x + tranlation.x, y: view.center.y + tranlation.y)
        }
        recogizer.setTranslation(CGPoint.zero, in: self.view)
    }
    func pinch()
    {
        image.isUserInteractionEnabled = true
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGesture))
        image.addGestureRecognizer(pinchGesture)
    }
    
    @objc
    func pinchGesture(sender:UIPinchGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        sender.scale = 1.0
    }
    
}

