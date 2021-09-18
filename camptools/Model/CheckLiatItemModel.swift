//
//  CheckLiatItem.swift
//  camptools
//  
//  Created by  on 2021/09/19
//  
//

import Foundation
import RealmSwift

class CheckListItemModel: Object {
    @objc dynamic var id: String = NSUUID().uuidString // ID
    @objc dynamic var name: String? = nil // 名前
    @objc dynamic var memo: String? = nil // メモ
    @objc dynamic var createdAt = Date()
    @objc dynamic var updatedAt = Date()
    
    @objc dynamic var item: ItemModel? // 1対1
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override required init() {
        super.init()
    }
}
