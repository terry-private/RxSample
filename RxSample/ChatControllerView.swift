//
//  ChatControllerView.swift
//  RxSample
//
//  Created by 若江照仁 on 2021/08/12.
//

import Foundation

import RxSwift
import RxCocoa
import RxKeyboard
import RxGesture

class ChatViewController: UIViewController, UITableViewDelegate, UITextViewDelegate {
    
    //UI
    var messageTableView: UITableView!
    var inputText = UITextView()
    var inputUIView = UIView()
    var chatUIView = UIView()
    var sendButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createUI() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.92, alpha: 1.0)
        
        //**チャット UIView
        let frameUIView = CGRect(x: 0, y : 0, width: self.view.frame.width, height: self.view.frame.height)
        self.chatUIView = UIView(frame: frameUIView)
        
        //TableView
        let frame = CGRect(x: 0, y : 0, width: self.view.frame.width, height: self.view.frame.height - 50)
        messageTableView = UITableView(frame: frame)
        messageTableView.backgroundColor = UIColor.clear
        messageTableView.allowsSelection = false;
        messageTableView.separatorStyle = .none
        messageTableView.estimatedRowHeight = 100
        messageTableView.rowHeight = UITableView.automaticDimension
        chatUIView.addSubview(messageTableView!)
        
        //**入力 UIView
        let frameUIViewInput = CGRect(x: 0, y : chatUIView.frame.height - 50, width: self.view.frame.width, height: 50)
        inputUIView = UIView(frame: frameUIViewInput)
        inputUIView.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.92, alpha: 1.0)
        chatUIView.addSubview(inputUIView)
        
        //テキスト
        inputText = UITextView (frame: CGRect(x: 5, y: 5 , width: self.view.frame.width - 70, height: 40))
        inputText.font = UIFont.systemFont(ofSize: 18)
        inputText.autocorrectionType = UITextAutocorrectionType.no
        inputText.keyboardType = UIKeyboardType.default
        inputText.returnKeyType = UIReturnKeyType.done
        inputUIView.addSubview(inputText)
        
        //送信ボタン
        sendButton = UIButton(frame: CGRect(x: self.view.frame.width - 60,y: 5,width: 50,height:40))
        sendButton.setTitle("送信", for: .normal)
        sendButton.setBackgroundColor(.systemRed, for: .normal)
        inputUIView.addSubview(sendButton)
        
        self.view.addSubview(chatUIView)
        
    }
}
