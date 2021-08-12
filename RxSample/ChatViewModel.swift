//
//  ChatViewModel.swift
//  RxSample
//
//  Created by 若江照仁 on 2021/08/12.
//

import RxSwift
import RxCocoa

class ChatViewModel {
    
    //DisposeBag
    fileprivate let disposeBag = DisposeBag()
    
    //メッセージデータの追加
    func addMessage(msg:String) {
    }

    //現在表示しているデータ数を取得
    func getDataCount() -> Int {
        return 0
    }
}

