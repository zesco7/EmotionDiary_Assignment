//
//  ViewController.swift
//  EmotionDiary_Assignment
//
//  Created by Mac Pro 15 on 2022/08/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var emotionButtonOutletCollection: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "감정 다이어리"
        
        let leftBarButtonItem1 = UIBarButtonItem.init(image: UIImage(systemName: "list.bullet"), style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = leftBarButtonItem1
        navigationItem.leftBarButtonItem?.tintColor = .black
    }


}

