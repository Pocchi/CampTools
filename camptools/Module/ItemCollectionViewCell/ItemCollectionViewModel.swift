//
//  ItemCollectionViewModel.swift
//  camptools
//  
//  Created by  on 2022/02/06
//  
//
import RealmSwift
import RxSwift
import RxCocoa
import RxRealm

final class ItemCollectionViewModel {
    var id: String = ""
    var name: String = ""
    var memo: String?
    let disposeBag = DisposeBag()
    var items = [ItemModel]()
    
    func ViewDidLoad() {
        bindingModel()
    }
    
    private func bindingModel() {
        let connectModel = ItemModel.getAll()
        if let itemModel = connectModel {
            Observable.changeset(from: itemModel)
                .subscribe(onNext: { results, changes in
                    if let changes = changes {
                        // it's an update
                        print(results)
                        print("deleted: \(changes.deleted)")
                        print("inserted: \(changes.inserted)")
                        print("updated: \(changes.updated)")
                    } else {
                        // it's the initial data
                        print(results)
                    }
                }).disposed(by: disposeBag)
        }
    }
}
