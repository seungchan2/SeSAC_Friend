//
//  MessageViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/01/18.
//

import UIKit

// 타이머
// 번호 문자로 받기
final class MessageViewController: BaseViewController {
   
    var auth = Auth.shared
    
    var limitTime: Int = 60
    
    @IBOutlet var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(auth.phoneNumber)
    }

    @IBAction func resendButtonClicked(_ sender: UIButton) {
        getSetTime()
    }
    
    @objc func getSetTime() {
        secToTime(sec: limitTime)
        limitTime -= 1
    }
    
    private func secToTime(sec: Int) {
        
        let minute = (sec % 3600) / 60
        let second = (sec % 3600) % 60
        
        if second < 10 {
            timerLabel.text = String(minute) + ":" + "0" + String(second)
        } else {
            timerLabel.text = String(minute) + ":" + String(second)
        }
        
        if limitTime != 0 {
            perform(#selector(getSetTime), with: .none, afterDelay: 1.0)
        } else if limitTime == 0 {
            timerLabel.text = "11"
        }
    }
}
