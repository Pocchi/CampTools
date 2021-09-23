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
    
    let itemCategories = LinkingObjects(fromType: ItemCategoryModel.self, property: "items")
    let styles = LinkingObjects(fromType: StyleModel.self, property: "items")
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override required init() {
        super.init()
    }
}

extension ItemModel {
    static func getAll() -> Results<ItemModel>! {
        let RealmInstance = try! Realm()
        return RealmInstance.objects(ItemModel.self)
    }
    
    static func createTaskSchedules(with categoryId: String) -> Void {
        let RealmInstance = try! Realm()
        let model = self.init()
        let category = ItemCategoryModel.getCategory(with: categoryId)
        
        try! RealmInstance.write {
            category.items.append(model)
        }
    }
}
