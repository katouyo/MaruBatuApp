//
//  ViewController.swift
//  MaruBatuApp
//
//  Created by Yoshiaki Kato on 2018/10/27.
//  Copyright © 2018 Yoshiaki Kato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!

    //問題番号
    var currentQuestionNum: Int = 0
    
    //問題
    let questionDict: [[String:Any]] = [
        ["question":"iPhoneアプリの開発統合環境はZcodeである", "answer":false],
        ["question":"Xcode画面の右側にはユーティリティーズがある", "answer":true],
        ["question":"UILabelは文字列を表示する時に利用する", "answer":true]
    ]
    
    //正解数カウント
    //var okCount: Int = 0
    
    //問題を表示します。
    //正解であれば次の問題が、不正解であれば同じ問題が再表示されます。
    func showQuestion(){
        
        let question = questionDict[currentQuestionNum]
        
        //型判定
        if let que = question["question"] as? String {
            questionLabel.text = que
        }
    }
    
    func checkAnswer(yourAnswer:Bool){
        
        let question = questionDict[currentQuestionNum]
        
        //型判定
        if let ans = question["answer"] as? Bool {
            
            //答えが合っている
            if yourAnswer == ans {
                currentQuestionNum += 1
                //okCount += 1
                showAlert(messageH: "正解")
            }
            //不正解
            else {
                currentQuestionNum += 1
                showAlert(messageH: "不正解")
            }
        }
        
        //問題数判定
        if currentQuestionNum >= questionDict.count {
            //showAlert(messageH: "正解数は\(okCount)問です")
            currentQuestionNum = 0
        }
        
        //問題表示
        showQuestion()
    }
    
    //メッセージ表示
    func showAlert(messageH: String) {
        
        let alert = UIAlertController(title: nil, message: messageH, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }

    @IBAction func yesButton(_ sender: Any) {
        checkAnswer(yourAnswer: true)
    }
    
    @IBAction func noButton(_ sender: Any) {
        checkAnswer(yourAnswer: false)
    }
}

