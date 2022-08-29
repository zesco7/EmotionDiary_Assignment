//
//  DateViewController.swift
//  EmotionDiary_Assignment
//
//  Created by Mac Pro 15 on 2022/08/29.
//

import UIKit

enum Dday: String {
    case dDayPlus100 = "D+100"
    case dDayPlus200 = "D+200"
    case dDayPlus300 = "D+300"
    case dDayPlus400 = "D+400"
    
    func showDday() -> String {
        switch self {
        case .dDayPlus100: return "D+100"
        case .dDayPlus200: return "D+200"
        case .dDayPlus300: return "D+300"
        case .dDayPlus400: return "D+400"
        }
    }
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
        
        let format = DateFormatter()
        format.dateFormat = "yyyy년 MM월 dd일"
        
        let result = format.string(from: selectionDatePicker.date)
        print(result)
        
        print(selectionDatePicker.date)
        
        //dDayPlus100.text = Dday.showDday(<#T##self: Dday##Dday#>)
        //dDayPlus200.text =
        //dDayPlus300.text =
        //dDayPlus400.text =
        
        dDayPlus100Date.text = result
        dDayPlus200Date.text = result
        dDayPlus300Date.text = result
        dDayPlus400Date.text = result
        
        dateImageViewAttribute(imageViewName: dateImageView1, imageFileName: "디저트1")
        dateImageViewAttribute(imageViewName: dateImageView2, imageFileName: "디저트2")
        dateImageViewAttribute(imageViewName: dateImageView3, imageFileName: "디저트3")
        dateImageViewAttribute(imageViewName: dateImageView4, imageFileName: "디저트4")
    }
    
    func dateImageViewAttribute(imageViewName: UIImageView, imageFileName: String) {
        imageViewName.image = UIImage(named: imageFileName)
        imageViewName.contentMode = .scaleToFill
        imageViewName.layer.cornerRadius = 10
        
    }
    
    func labalAttribute() {
        dDayPlus100.textColor = .white
        dDayPlus100.backgroundColor = .black
        dDayPlus100Date.textColor = .white
        dDayPlus100Date.backgroundColor = .black
        dDayPlus100Date.font = .systemFont(ofSize: 15)
    }
    
    


}
