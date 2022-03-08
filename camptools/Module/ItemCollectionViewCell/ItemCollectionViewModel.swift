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
    var items = BehaviorRelay<[ItemModel]>(value: [])
    
    func ViewDidLoad() {
        bindingModel()
    }
    
    private func bindingModel() {
        let connectModel = ItemModel.getAll()
        if let itemModel = connectModel {
            items.accept(Array(itemModel))
            Observable.changeset(from: itemModel)
                .subscribe(onNext: { results, changes in
                    self.items.accept(Array(results))
                }).disposed(by: disposeBag)
        }
    }
}
