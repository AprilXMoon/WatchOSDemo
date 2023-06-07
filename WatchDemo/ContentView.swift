//
//  ContentView.swift
//  WatchDemo
//
//  Created by aprillee on 2023/4/21.
//

import SwiftUI

struct ContentView: View {
    
    let watchConnectManager = WatchConnectManager()
    
    var body: some View {
        VStack {
            Button {
                watchConnectManager.sendHiToWatch()
            } label: {
                Text("Say Hi to Watch")
            }
        }
        .onAppear {
            watchConnectManager.checkWCSection()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
