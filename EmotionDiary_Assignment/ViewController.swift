//
//  ViewController.swift
//  EmotionDiary_Assignment
//
//  Created by Mac Pro 15 on 2022/08/28.
//

import UIKit

/*감정다이어리 포인트
 -. 스택뷰에 오토레이아웃 적용하여 레이아웃 맞추기
 -. 배열 순서대로 감정이름 표시하기
 : label일일이 연결하지 말고 배열-반복문으로 처리해야함
 : String배열에는 text속성 없기 때문에 emotionLabelArray 타입을 UILabel로 배열선언해야함
 
 -. 클릭횟수 표시하기
 : 감정이름이랑 클릭횟수랑 별개로 처리해야함
 : 1대n으로 액션버튼 연결과 객체 연결하고 조건문 사용하여 선택한 객체에만 액션 적용될 수 있도록 해야함
 */

/*보충학습 필요한 부분
 -. 보간법
 -. 배열값을 반복문을 통해 다른 변수에 넣는 방법
 */

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
    var emotionLabelArray: [UILabel] { [emotionLabel1, emotionLabel2 ,emotionLabel3 ,emotionLabel4 ,emotionLabel5 ,emotionLabel6 ,emotionLabel7 ,emotionLabel8 ,emotionLabel9] }
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
            emotionLabelArray[item].textAlignment = .center
            print("\(item)번째 값은 \(emotionLabelArray[item])이다")
        }
    }
    
    func navigationItemAttribute() {
        navigationItem.title = "감정 다이어리"
        
        let leftBarButtonItem1 = UIBarButtonItem.init(image: UIImage(systemName: "list.bullet"), style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = leftBarButtonItem1
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @IBAction func emotionButtonClicked(_ sender: UIButton) {
        countArray[sender.tag] += 1
        emotionLabelArray[sender.tag].text = "\(emotionArray[sender.tag]) \(countArray[sender.tag])"
    }
    
}

