//
//  MessageViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/01/18.
//

import UIKit

import FirebaseAuth

final class MessageViewController: BaseViewController {
   
    let messageView = MessageView()
    var timer: DispatchSourceTimer?
    var remainingTime = 300
    var auth = AuthViewModel.shared
    
    override func loadView() {
        view = messageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
        messageView.confirmButton.isEnabled = true
    }
     
    override func style() {
        super.style()
        view.backgroundColor = Color.sesacWhite
    }
    
    private func setAddTarget() {
        messageView.timerButton.addTarget(self, action: #selector(touchTimerButton), for: .touchUpInside)
        messageView.confirmButton.addTarget(self, action: #selector(touchConfirmButton), for: .touchUpInside)
        messageView.backButton.addTarget(self, action: #selector(touchBackButton), for: .touchUpInside)
    }
    
    @objc func touchTimerButton() {
        sendCertification()
     }
    
    @objc func touchConfirmButton() {
        navigationController?.pushViewController(NicknameViewController.instanceFromNib(), animated: true)
     }
    
    @objc func touchBackButton() {
        navigationController?.popViewController(animated: true)
     }
    
    private func sendCertification() {
           PhoneAuthProvider.provider()
            .verifyPhoneNumber("01074138741", uiDelegate: nil) { verificationID, error in
                 if error == nil {
                    print("2")
                 } else {
                     print("error: ", error.debugDescription)
                     print("1")
                 }
             }
           self.view.endEditing(true)
           startTimer()
       }
    
    private func startTimer() {
           if self.timer == nil {
               self.timer = DispatchSource.makeTimerSource(flags: [], queue: .main)
               self.timer?.schedule(deadline: .now(), repeating: 1)
               self.timer?.setEventHandler(handler: { [weak self] in
                   guard let self = self else { return }
                   self.remainingTime -= 1
                   let min = (self.remainingTime % 3600) / 60
                   let sec = (self.remainingTime % 3600) % 60
                   self.messageView.timerLabel.text = String(format: "%02d:%02d", min,sec)
                   if self.remainingTime <= 0 {
                       self.stopTimer()
                   }
               })
               self.timer?.resume()
           } else {
               stopTimer()
               remainingTime = 300
               startTimer()
           }
       }
       
    private func stopTimer() {
           self.timer?.cancel()
           self.timer = nil
       }
    
}
