//
//  ChatViewModel.swift
//  MessengerClone
//
//  Created by Gytis Ptašinskas on 2023-08-04.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messageText = ""
    @Published var messages = [Message]()
    let user: User
    
    init(user: User) {
        self.user = user
        observeMessages()
    }
    
    func observeMessages() {
        print("Observing messages for user: \(user.id)")
        MessageService.observeMessage(chatPartner: user) { [weak self] newMessages in
            DispatchQueue.main.async {
                print("Received messages: \(newMessages.count)")
                self?.messages.append(contentsOf: newMessages)
            }
        }
    }
    
    func sendMessage() {
        MessageService.sendMessage(messageText, toUser: user)
        messageText = "" // Clear the message text
    }
}


