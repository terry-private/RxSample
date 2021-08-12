//
//  ChatModel.swift
//  RxSample
//
//  Created by 若江照仁 on 2021/08/12.
//

import RxSwift
import RxCocoa

//チャット データソースとなるstruct
struct Message {
    let message: String
    init(message:String) {
        self.message = message
    }
}
