//
//  Message.swift
//  DeepDish
//
//  Created by Eyimofe Oladipo on 3/5/22.
//

import SwiftUI

// Message Model and Sample Data....

struct Message: Identifiable{
    var id = UUID().uuidString
    var message: String
    var userName: String
    var tintColor: Color
}


var allMessages : [Message] = [
    Message(message: "Can we go to the park.", userName: "iJustine", tintColor: .pink),
    Message(message: "Can we go to the park.", userName: "iJustine", tintColor: .pink),
    Message(message: "Can we go to the park.", userName: "iJustine", tintColor: .pink),
    Message(message: "Can we go to the park.", userName: "iJustine", tintColor: .pink),
    Message(message: "Can we go to the park.", userName: "iJustine", tintColor: .pink),
    Message(message: "Can we go to the park.", userName: "iJustine", tintColor: .pink),
    Message(message: "Can we go to the park.", userName: "iJustine", tintColor: .pink),
    Message(message: "Can we go to the park.", userName: "iJustine", tintColor: .pink),
    Message(message: "Can we go to the park.", userName: "iJustine", tintColor: .pink),
    Message(message: "Can we go to the park.", userName: "iJustine", tintColor: .pink),
    Message(message: "Can we go to the park.", userName: "iJustine", tintColor: .pink),
    Message(message: "Can we go to the park.", userName: "iJustine", tintColor: .pink),
    Message(message: "Can we go to the park.", userName: "iJustine", tintColor: .pink),
    Message(message: "Can we go to the park.", userName: "iJustine", tintColor: .pink),
    Message(message: "Can we go to the park.", userName: "iJustine", tintColor: .pink),
    Message(message: "Can we go to the park.", userName: "iJustine", tintColor: .pink),
]
