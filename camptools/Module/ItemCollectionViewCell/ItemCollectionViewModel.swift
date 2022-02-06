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

final class ItemCollectionViewModel {
    var id: String = ""
    var name: String = ""
    var memo: String?
    
    func ViewDidLoad() {
        bindingModel()
    }
    
    private func bindingModel() -> Observable<Results<ItemModel>> {
        let connectionModel = ItemModel.getAll()
        return Observable<Results<ItemModel>>.create { observer in
            let token = connectionModel?.observe { result in
                print(result)
                let value: Results<ItemModel>
                switch result {
                case .initial(let latestValue):
                    value = latestValue
                case .update(let latestValue, deletions: _, insertions: _, modifications: _):
                    value = latestValue
                case .error(let error):
                    print(error)
                    observer.onError(error)
                    return
                }
                print(value)
                observer.onNext(value)
                observer.onCompleted()
            }
            return Disposables.create {
                token?.invalidate()
            }
        }
    }
}
