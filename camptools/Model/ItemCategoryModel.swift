//
//  ItemCategoryModel.swift
//  camptools
//  
//  Created by  on 2021/09/18
//  
//

import Foundation
import RealmSwift

class ItemCategoryModel: Object {
    @objc dynamic var id: String = NSUUID().uuidString // アイテムID
    @objc dynamic var name: String? = nil // アイテム名
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

extension ItemCategoryModel {
    
    static func getAll() -> Results<ItemCategoryModel>! {
        let RealmInstance = try! Realm()
        return RealmInstance.objects(ItemCategoryModel.self)
    }
    
    static func getCategory(with id: String) -> Self {
        let RealmInstance = try! Realm()
        let model = RealmInstance.object(ofType: ItemCategoryModel.self, forPrimaryKey: id)
        return model as! Self
    }
}
