//
//  RealmData.swift
//  HowMuchEnergy
//
//  Created by Ryohei Nanano on 2018/04/16.
//  Copyright © 2018年 GeekSalon. All rights reserved.
//

import UIKit
import RealmSwift//RealmをSwiftで使う準備

//Realmで扱うデータを保持しておく為のクラス
class RealmData: Object {
    
    @objc dynamic var weight: Int = 0//初期値として0入れておく
//    //プライマリーキーの設定
//    override static func primaryKey() -> String? {
//        return "realmId"
//    }
}
