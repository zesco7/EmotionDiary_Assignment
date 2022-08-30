//
//  ViewController.swift
//  EmotionDiary_Assignment
//
//  Created by Mac Pro 15 on 2022/08/28.
//

import UIKit

/*감정다이어리 포인트
 -. 스택뷰에 오토레이아웃 적용하여 레이아웃 맞추기 -> 해결
 -. 배열 순서대로 감정이름 표시하기 -> 해결: 배열+반복문 사용하여 레이블에 표시
 : label일일이 연결하지 말고 배열-반복문으로 처리해야함
 : String배열에는 text속성 없기 때문에 emotionLabelArray 타입을 UILabel로 배열선언해야함
 
 -. 클릭횟수 표시하기 -> 해결: 배열+반복문 사용하여 레이블에 표시(func emotionInfoLabel)
 : 감정이름이랑 클릭횟수랑 별개로 처리해야함
 : 1대n으로 액션버튼 연결과 객체 연결하고 조건문 사용하여 선택한 객체에만 액션 적용될 수 있도록 해야함
 */

/*보충학습 필요한 부분
 -. 보간법
 -. 배열값을 반복문을 통해 다른 변수에 넣는 방법
 -. 내가 보여주고 싶은게 무엇인지, 지금 현재 보여주고 있는 데이터는 뭔지 확인하면서 코드 작성하기
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
    
    @IBOutlet weak var clickCountSaveButton: UIButton!
    @IBOutlet weak var clickCountResetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //*****중요*****: 화면에 표시하려면 저장된 데이터를 불러오는 과정이 필요하다!! -> 1)어떤 값을 화면에 보여줄지 2)어느 시점에 보여주어야 할지

        //데이터 로드: 화면에 표시할 데이터변수를 viewDidLoad에 선언하여 기존 countArray가 아닌 값이 업데이트된 countArray를 화면에 표시하도록 한다.
        countArray = UserDefaults.standard.array(forKey: "clickCount") as! [Int]
        
        navigationItemAttribute()
        emotionInfoLabel()
        showAlertController()
        resetButtonAttribute()

        //let literal = #imageLiteral(resourceName: "sesac_slime8")
    }
    //데이터 처리: 감정, 클릭수 표시
    func emotionInfoLabel() {
        for item in 0..<emotionLabelArray.count {
            emotionLabelArray[item].text = "\(emotionArray[item]) \(countArray[item])"
            emotionLabelArray[item].textAlignment = .center
            //print("\(item)번째 값은 \(emotionLabelArray[item])이다")
        }
    }
    
    //속성 설정: 네비게이션바
    func navigationItemAttribute() {
        navigationItem.title = "감정 다이어리"
        
        let leftBarButtonItem1 = UIBarButtonItem.init(image: UIImage(systemName: "list.bullet"), style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = leftBarButtonItem1
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    //데이터 처리: 감정버튼 클릭시 레이블 +1 증가
    @IBAction func emotionButtonClicked(_ sender: UIButton) {
        countArray[sender.tag] += 1
        emotionLabelArray[sender.tag].text = "\(emotionArray[sender.tag]) \(countArray[sender.tag])"
        print(sender.tag)
        //print(sender.currentTitle, sender.currentImage)
    }
    
    //alert 띄우기
    func showAlertController() {
        
        //1. 흰바탕 적용: UIAlertController(액션시트는 title, message를 잘 사용안함: nil값 입력하면 비어있도록 처리됨)
        let alert = UIAlertController(title: "타이틀", message: "여기는 메시지가 들어갑니다", preferredStyle: .actionSheet)
        
        //2. 버튼 만들기: 액션시트에서 cancel style적용하면 버튼이 맨밑에 따로 떨어져있음(default style은 버튼 연결되어있음)
        let ok = UIAlertAction(title: "확인", style: .destructive, handler: nil)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let web = UIAlertAction(title: "새창으로 열기", style: .default, handler: nil)
        let copy = UIAlertAction(title: "복사하기", style: .default, handler: nil)
        
        //3. 흰바탕에 버튼 합치기: 취소버튼은 코드구현순서 상관 없이 위치가 정해져있음(2개 이하: 왼쪽, 3개 이상: 맨 밑)
        alert.addAction(copy)
        alert.addAction(web)
        alert.addAction(ok)
        alert.addAction(cancel)
        
        //4. 버튼 클릭 시 화면 띄우기: present
        present(alert, animated: true, completion: nil)
    }
    
    //속성 설정: 카운트저장, 리셋버튼
    func resetButtonAttribute() {
        clickCountSaveButton.setTitle("카운트 저장", for: .normal)
        clickCountSaveButton.setTitleColor(.black, for: .normal)
        clickCountSaveButton.backgroundColor = .green
        clickCountSaveButton.layer.cornerRadius = 20
        clickCountSaveButton.layer.borderWidth = 0
        clickCountSaveButton.titleLabel?.textAlignment = .center
        
        clickCountResetButton.setTitle("카운트 리셋", for: .normal)
        clickCountResetButton.setTitleColor(.black, for: .normal)
        clickCountResetButton.backgroundColor = .red
        clickCountResetButton.layer.cornerRadius = 20
        clickCountResetButton.layer.borderWidth = 0
        clickCountResetButton.titleLabel?.textAlignment = .center
    }
    
    //데이터 처리: 감정버튼 클릭수 데이터 저장(UserDefaults 사용)
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        let currentCount = UserDefaults.standard.array(forKey: "clickCount")
        let updatedCount = countArray
        UserDefaults.standard.set(updatedCount, forKey: "clickCount")
        countArray = UserDefaults.standard.array(forKey: "clickCount") as! [Int]
        //print(UserDefaults.standard.array(forKey: "clickCount") as! [Int])
    }
    
    //데이터 처리: 감정버튼 클릭수 데이터 리셋(UserDefaults 사용) -> initClickCount사용하여 값 덮어씌우는 방식으로 해결(UserDefaults.standard.removeObject 방식으로 처리하는 건 optional문제 때문에 공부 더 필요)
    @IBAction func reestButtonClicked(_ sender: UIButton) {
        
        let initClickCount = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        UserDefaults.standard.set(initClickCount, forKey: "clickCount")
        print(UserDefaults.standard.set(initClickCount, forKey: "clickCount"))
        
        //UserDefaults.standard.removeObject(forKey: "clickCount")
        //print(UserDefaults.standard.removeObject(forKey: "clickCount"))

        /*리셋 버튼 누르면 시뮬레이터 재시작없이도 화면에서 바로 0으로 리셋되는 방식 시도 -> 미해결
        let initClickCount = [0, 0, 0, 0, 0, 0, 0, 0, 0]
            for item in 0..<initClickCount.count {
                emotionLabelArray[item].text = "\(emotionArray[item]) \(initClickCount[item])"
                emotionLabelArray[item].textAlignment = .center
                print("\(item)번째 값은 \(emotionLabelArray[item])이다")
            }
         */
        }
    }
        
