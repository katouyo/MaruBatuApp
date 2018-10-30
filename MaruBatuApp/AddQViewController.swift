//
//  AddQViewController.swift
//  MaruBatuApp
//
//  Created by Yoshiaki Kato on 2018/10/30.
//  Copyright © 2018 Yoshiaki Kato. All rights reserved.
//

import UIKit

class AddQViewController: UIViewController {
    
    //入力
    @IBOutlet var textField: UITextField!
    
    //問題
    var questionArray: [[String:Any]] = []
    var questionDict: [String:Any] = [:]
    
    //問題の答え
    var segCtlAnswer: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //読み込み
        if UserDefaults.standard.object(forKey: "hoge") != nil {
            questionArray = UserDefaults.standard.object(forKey: "hoge") as! [[String:Any]]
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //loadView()
        //viewDidLoad()
    }
    
    //SegmentedControl
    @IBAction func selectBool(_ sender: Any) {
        switch (sender as AnyObject).selectedSegmentIndex {
        case 0:
            segCtlAnswer = false
            print("×")
        case 1:
            segCtlAnswer = true
            print("○")
        default:
            print("エラー")
        }
    }
    
    /*
    //問題
    let questionArray: [[String:Any]] = [
    ["question":"iPhoneアプリの開発統合環境はZcodeである", "answer":false],
    ["question":"Xcode画面の右側にはユーティリティーズがある", "answer":true],
    ["question":"UILabelは文字列を表示する時に利用する", "answer":true]
    ]
    */
    
    //問題を保存
    @IBAction func saveQ(_ sender: Any) {
        //テキストフィールドが空
        if textField.text == "" {
            showAlert(messageH: "問題文を入力してください")
        } else {
            //格納
            questionDict.updateValue(textField.text!, forKey: "question")
            questionDict.updateValue(segCtlAnswer, forKey: "answer")
            questionArray.append(questionDict)
            
            textField.text = ""
        }
    }
    
    //問題をすべて削除
    @IBAction func allClearQ(_ sender: Any) {
        questionArray.removeAll()
        showAlert(messageH: "問題をすべて削除しました")
    }
    
    @IBAction func backToTop(_ sender: Any) {
        
        //キー値"hoge"で配列を保存
        UserDefaults.standard.set(questionArray, forKey: "hoge")
        
        //戻る遷移
        self.navigationController?.popViewController(animated: true)
        
    }
    
    //メッセージ表示
    func showAlert(messageH: String) {
        
        let alert = UIAlertController(title: nil, message: messageH, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
