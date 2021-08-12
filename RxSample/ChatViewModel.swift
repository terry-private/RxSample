//
//  ChatViewModel.swift
//  RxSample
//
//  Created by 若江照仁 on 2021/08/12.
//

import RxSwift
import RxCocoa

class ChatViewModel {
    
    //Model
    let messageModel = MessageModel()
    
    //TableViewのデータソース(この内容を一覧に表示する)
    var dataMessageRx:RxCocoa.BehaviorRelay<[Message]>
    
    //ViewとバインドするObservable
    var scrollEndComing = BehaviorRelay<Bool>(value: false)
    
    init() {
        dataMessageRx = messageModel.messagesRx()
        
        //スクロール 上まで到達した時
        // driveはsubscribeと同様、イベントの購読を行う。（＝ここで受信する）
        scrollEndComing.asDriver()
            .drive(onNext: { bool in
                if (bool) {
                    print("TOPに達しました")
                    
                    //データソースでいま何件表示しているかを確認して現ページを判定
                    let page:Int = self.dataMessageRx.value.count / 20
                    self.messageModel.currentPage = page + 1   //ページを加算
                    
                    if (self.messageModel.dataMessageRx.value.count > 0) {
                        self.messageModel.data = []   //データ取得前に初期化
                        self.messageModel.messagesGet()
                    }
                }
            })
            .disposed(by: disposeBag)
    }
    //DisposeBag
    fileprivate let disposeBag = DisposeBag()
    
    //メッセージデータの追加
    func addMessage(msg:String) {
        messageModel.add(msg: msg)
    }

    //現在表示しているデータ数を取得
    func getDataCount() -> Int {
        return (messageModel.data?.count)! - 1
    }
}

