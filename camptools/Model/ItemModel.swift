//
//  ItemModel.swift
//  camptools
//
//  Created by on 2021/09/18.
//

import Foundation
import RealmSwift

class ItemModel: Object {
    @objc dynamic var id: String = NSUUID().uuidString // アイテムID
    @objc dynamic var name: String? = nil // アイテム名
    @objc dynamic var memo: String? = nil // メモ
    @objc dynamic var createdAt = Date()
    @objc dynamic var updatedAt = Date()
    
    let itemCategories = LinkingObjects(fromType: ItemModel.self, property: "itemCategories")
    let styles = LinkingObjects(fromType: ItemModel.self, property: "styles")
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override required init() {
        super.init()
    }
}
