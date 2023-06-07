//
//  AppConnectManager.swift
//  watchside Watch App
//
//  Created by aprillee on 2023/4/21.
//

import Foundation
import WatchConnectivity

class AppConnectManager: NSObject {
    
    let wcSection = WCSession.default
    
    func checkSection() {
        if WCSession.isSupported() {
            wcSection.delegate = self
            wcSection.activate()
        }
    }
    
    func sayYeahToApp() {
        
        guard WCSession.isSupported() else {
            return
        }
        
        let sendData = ["Say": "Yeah~"]
        
        wcSection.sendMessage(sendData) { result in
            print("Watch Result: \(result)")
        }
    }
}

extension AppConnectManager: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        
        let hiMessage = message["Say"]
        
        print("Receive message: \(hiMessage)")
        
        let reply = ["Get": "Good"]
        replyHandler(reply)
    }
    
}
