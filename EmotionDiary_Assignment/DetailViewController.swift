//
//  DetailViewController.swift
//  EmotionDiary_Assignment
//
//  Created by Mac Pro 15 on 2022/09/09.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    
    var testValue: String? // let->var
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailLabel.text = testValue

    //프로퍼티 생성
        //프로터티 값표시
    }
    


}
