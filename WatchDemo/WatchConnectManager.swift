//
//  WatchConnectManager.swift
//  WatchDemo
//
//  Created by aprillee on 2023/4/21.
//

import Foundation
import WatchConnectivity

class WatchConnectManager: NSObject {
    
    var section: WCSession?
    
    func checkWCSection() {
        if WCSession.isSupported() {
            section = WCSession.default
            section?.delegate = self
            section?.activate()
        }
    }
    
    func sendHiToWatch() {
        
        guard let wcSection = section, wcSection.isReachable else {
            return
        }
    
        let hiDic = ["Say": "Hi, Watch"]
        wcSection.sendMessage(hiDic) { result in
            print("Result : \(result)")
        }
    }
}


extension WatchConnectManager: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        
        let yeahMessage = message["Say"]
        
        print("form watch: \(yeahMessage)")
    }
    
    
}
