//
//  ViewController.swift
//  EmotionDiary_Assignment
//
//  Created by Mac Pro 15 on 2022/08/28.
//

import UIKit

enum Emotion: Int {
    case 행복해
    case 사랑해
    case 좋아해
    case 당황해
    case 속상해
    case 우울해
    case 심심해
    case 놀라워
    case 즐거워
}

class ViewController: UIViewController {
    
    var emotionArray = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "놀라워", "즐거워"]
    var emotionLabelArray = Array(repeating: "감정", count: 9)
    var countArray = Array(repeating: 0, count: 9)
    
    @IBOutlet var emotionButtonOutletCollection: [UIButton]!
    
    @IBOutlet weak var emotionLabel1: UILabel!
    @IBOutlet weak var emotionLabel2: UILabel!
    @IBOutlet weak var emotionLabel3: UILabel!
    @IBOutlet weak var emotionLabel4: UILabel!
    @IBOutlet weak var emotionLabel5: UILabel!
    @IBOutlet weak var emotionLabel6: UILabel!
    @IBOutlet weak var emotionLabel7: UILabel!
    @IBOutlet weak var emotionLabel8: UILabel!
    @IBOutlet weak var emotionLabel9: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItemAttribute()
        
        for item in 0..<emotionLabelArray.count {
            emotionLabelArray[item].text = emotionArray[item]
            print("\(item)번째 값은 \(emotionLabelArray[item])이다")
        }
        
        
    }
    
    func navigationItemAttribute() {
        navigationItem.title = "감정 다이어리"
        
        let leftBarButtonItem1 = UIBarButtonItem.init(image: UIImage(systemName: "list.bullet"), style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = leftBarButtonItem1
        navigationItem.leftBarButtonItem?.tintColor = .black
        
    }



}

