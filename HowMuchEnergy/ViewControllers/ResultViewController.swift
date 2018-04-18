//
//  ResultViewController.swift
//  HowMuchEnergy
//
//  Created by Ryohei Nanano on 2018/04/16.
//  Copyright © 2018年 GeekSalon. All rights reserved.
//

import UIKit
import RealmSwift//RealmをSwiftで使う為の準備

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var hogeLabel: UILabel!
    var m: Int!//Realmに保存した最新の情報だけを格納(results配列のケツにあるやつ)
    let c = 3 * 100000000//光速
    
    let realm = try! Realm()//Realmをインスタンス化→変数realmに格納
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let results = realm.objects(RealmData.self)//Realm上に保存してある値を取って来て、取り敢えず全部resultsにぶち込む
        print("resultsresultsresultsresults")
        print(results)//ここにちゃんと値は保持されている
        print("resultsresultsresultsresults")

        m = results.last?.weight
        print(m)
        
        print(m * c * c)//普通にここまでは計算できてる。なんでlabelに反映できない？
        resultLabel.text = String(m * c * c)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //Backボタン押した時に呼ばれる関数
//    @IBAction func goBack()
//    {
//        self.dismiss(animated: true, completion: nil)//これはまた別かな。presentで行って戻るやつや。
//        self.navigationController?.popViewController(animated: true)//popで画面戻る
//    }
    //別にこれすらいらない。NavigationControllerで画面遷移した段階でBackボタン勝手にできるから

}
