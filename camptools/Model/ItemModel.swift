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
    
    static func create(name: String, memo: String?) -> Self? {
        let model = self.init()
        model.name = name
        model.memo = memo
        do {
            let RealmInstance = try Realm()
            try RealmInstance.write {
                RealmInstance.add(model)
            }
        } catch {
            print("Error \(error)")
            return nil
        }
        return model
    }
    
    static func update(with id: String, name: String, memo: String?) -> ItemModel? {
        let realm = try! Realm()
        if let model = realm.object(ofType: ItemModel.self, forPrimaryKey: id) {
            do {
              try realm.write {
                model.name = name
                model.memo = memo
              }
            } catch {
                print("Error \(error)")
                return nil
            }
            return model
        } else {
            return nil
        }
    }
}
