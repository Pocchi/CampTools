//
//  CheckListModel.swift
//  camptools
//  
//  Created by  on 2021/09/19
//  
//

import Foundation
import RealmSwift

class CheckListModel: Object {
    @objc dynamic var id: String = NSUUID().uuidString // ID
    @objc dynamic var name: String? = nil // 名前
    @objc dynamic var memo: String? = nil // メモ
    @objc dynamic var createdAt = Date()
    @objc dynamic var updatedAt = Date()
    
    let items = List<ItemModel>() // 1:多の関係
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override required init() {
        super.init()
    }
}
