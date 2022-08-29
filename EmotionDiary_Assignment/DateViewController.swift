//
//  DateViewController.swift
//  EmotionDiary_Assignment
//
//  Created by Mac Pro 15 on 2022/08/29.
//

import UIKit

/*질문
 -. 열거형 사용해서 D+100, imageFileName 표시하는 방법 -> 해결
 -. 데이트피커 날짜값을 레이블에 표시하는 방법 -> 해결
 -. D+100 레이블너비 오토레이아웃으로 글자수에 따라 자동조정되는 방법
 -. pickerview 하단 시간 짤리는거 해결 방법
 -. pickerview 선택시간 한국시간으로 설정하는 방법
 -. 열거형 rawValue대신 반환값 사용해서 해결하는 방법
 -. 전체적으로 반복코드 줄이는 방법
 */

//Dday표시 열거형 처리
enum Dday: String {
    case dDayPlus100 = "D+100"
    case dDayPlus200 = "D+200"
    case dDayPlus300 = "D+300"
    case dDayPlus400 = "D+400"
}
    /*return 반환값인데 사용은 어떻게 하는지?
    func showDday() -> String {
        switch self {
        case .dDayPlus100: return "D+100"
        case .dDayPlus200: return "D+200"
        case .dDayPlus300: return "D+300"
        case .dDayPlus400: return "D+400"
        }
    }
     */

//이미지뷰파일이름 열거형 처리
    enum ImageFileName: String {
        case imageView1 = "디저트1"
        case imageView2 = "디저트2"
        case imageView3 = "디저트3"
        case imageView4 = "디저트4"
    }

class DateViewController: UIViewController {

    @IBOutlet weak var selectionDatePicker: UIDatePicker!
    @IBOutlet weak var dateImageView1: UIImageView!
    @IBOutlet weak var dateImageView2: UIImageView!
    @IBOutlet weak var dateImageView3: UIImageView!
    @IBOutlet weak var dateImageView4: UIImageView!
    
    @IBOutlet weak var dDayPlus100: UILabel!
    @IBOutlet weak var dDayPlus200: UILabel!
    @IBOutlet weak var dDayPlus300: UILabel!
    @IBOutlet weak var dDayPlus400: UILabel!
    
    @IBOutlet weak var dDayPlus100Date: UILabel!
    @IBOutlet weak var dDayPlus200Date: UILabel!
    @IBOutlet weak var dDayPlus300Date: UILabel!
    @IBOutlet weak var dDayPlus400Date: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelAttribute(dday: dDayPlus100, ddayDate: dDayPlus100Date)
        labelAttribute(dday: dDayPlus200, ddayDate: dDayPlus200Date)
        labelAttribute(dday: dDayPlus300, ddayDate: dDayPlus300Date)
        labelAttribute(dday: dDayPlus400, ddayDate: dDayPlus400Date)
        
        //dateImage를 dateImageViewAttribute 함수로 옮기면 왜 에러가 날까?
        let dateImage1 = ImageFileName.imageView1.rawValue
        let dateImage2 = ImageFileName.imageView2.rawValue
        let dateImage3 = ImageFileName.imageView3.rawValue
        let dateImage4 = ImageFileName.imageView4.rawValue
        
        dateImageViewAttribute(imageViewName: dateImageView1, imageFileName: dateImage1)
        dateImageViewAttribute(imageViewName: dateImageView2, imageFileName: dateImage2)
        dateImageViewAttribute(imageViewName: dateImageView3, imageFileName: dateImage3)
        dateImageViewAttribute(imageViewName: dateImageView4, imageFileName: dateImage4)
    }
    
    func dateImageViewAttribute(imageViewName: UIImageView, imageFileName: String) {
        imageViewName.image = UIImage(named: imageFileName)
        imageViewName.contentMode = .scaleToFill
        imageViewName.layer.cornerRadius = 10
    }
    
    func labelAttribute(dday: UILabel, ddayDate: UILabel) {
        let d100 = Dday.dDayPlus100.rawValue
        let d200 = Dday.dDayPlus200.rawValue
        let d300 = Dday.dDayPlus300.rawValue
        let d400 = Dday.dDayPlus400.rawValue
    
        dDayPlus100.text = d100
        dDayPlus200.text = d200
        dDayPlus300.text = d300
        dDayPlus400.text = d400
        
        dDayPlus100Date.text = "날짜를 선택하세요"
        dDayPlus200Date.text = "날짜를 선택하세요"
        dDayPlus300Date.text = "날짜를 선택하세요"
        dDayPlus400Date.text = "날짜를 선택하세요"
        
        dday.textColor = .white
        dday.backgroundColor = .black
        ddayDate.textColor = .white
        ddayDate.backgroundColor = .black
        ddayDate.font = .systemFont(ofSize: 15)
    }
    
    @IBAction func setDdayDate(_ sender: UIDatePicker) {
        let datePickerView = sender
        let selectedDate = datePickerView.date
        let plus100ToSelectedDate = Calendar.current.date(byAdding: .day, value: 100, to: selectedDate)!
        let plus200ToSelectedDate = Calendar.current.date(byAdding: .day, value: 200, to: selectedDate)!
        let plus300ToSelectedDate = Calendar.current.date(byAdding: .day, value: 300, to: selectedDate)!
        let plus400ToSelectedDate = Calendar.current.date(byAdding: .day, value: 400, to: selectedDate)!
        
        let format = DateFormatter()
        format.dateFormat = "yyyy년 MM월 dd일"
        let datePlus100 = format.string(from: plus100ToSelectedDate)
        let datePlus200 = format.string(from: plus200ToSelectedDate)
        let datePlus300 = format.string(from: plus300ToSelectedDate)
        let datePlus400 = format.string(from: plus400ToSelectedDate)
        
        dDayPlus100Date.text = datePlus100
        dDayPlus200Date.text = datePlus200
        dDayPlus300Date.text = datePlus300
        dDayPlus400Date.text = datePlus400
    }
}
