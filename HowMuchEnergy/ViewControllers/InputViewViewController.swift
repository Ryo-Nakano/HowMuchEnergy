//
//  InputViewViewController.swift
//  HowMuchEnergy
//
//  Created by Ryohei Nanano on 2018/04/16.
//  Copyright © 2018年 GeekSalon. All rights reserved.
//

import UIKit
import RealmSwift//RealmをSwiftで使う為の準備

class InputViewViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    let storyboardID: String = "ResultViewController"
    
    let realm = try! Realm()//Realmをインスタンス化→Realmのメソッドを使う準備が整った！
    let realmData = RealmData()//RealmDataをインスタンス化→変数realmDataに格納
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.keyboardType = UIKeyboardType.numberPad
        textField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //ボタン押された時に呼ばれる関数
    @IBAction func goNextButton()
    {
        if(Int(textField.text!) != nil)//textFieldがnilでない時→なんらかの値が入力されている時
        {
            //Realmに値を保存
            try! realm.write {//Realmに値を書き込む準備
                realmData.weight = Int(textField.text!)!//weightに入力内容を代入
                realm.add(realmData)//データが無ければ追加、あったら上書
            }
            
            //画面遷移のコード
            let storyboard = UIStoryboard(name: "Result", bundle: Bundle.main)//①先ずは遷移先のStoryboardを取ってくる
            let resultViewController = storyboard.instantiateViewController(withIdentifier: storyboardID)//②画面遷移先のViewControllerを取ってくる！
            navigationController?.pushViewController(resultViewController, animated: true)//取って来たViewControllerにpushで画面遷移！
        }
    }
    
    //TextField以外の部分をタッチした時にキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

extension InputViewViewController: UITextFieldDelegate{}//TextField使う為の準備
