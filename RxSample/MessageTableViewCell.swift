//
//  MessageTableViewCell.swift
//  RxSample
//
//  Created by 若江照仁 on 2021/08/12.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    var messageLabel:UILabel!
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let screenRect = UIScreen.main.bounds
        
        //******** メッセージ
        messageLabel = UILabel()
        messageLabel.frame = CGRect(x:0 ,y:0, width:screenRect.width, height: 20)
        messageLabel.numberOfLines = 0
        messageLabel.lineBreakMode = .byWordWrapping
        contentView.addSubview(messageLabel)
        
        //constraint (ラベルのheightを可変にする為に必要)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: messageLabel!, attribute:.top, relatedBy:.equal, toItem:contentView, attribute:.top , multiplier:1, constant:20).isActive = true
        NSLayoutConstraint(item: messageLabel!, attribute:.bottomMargin, relatedBy:.equal, toItem:contentView, attribute:.bottomMargin, multiplier:1, constant:0).isActive = true
    }
}
