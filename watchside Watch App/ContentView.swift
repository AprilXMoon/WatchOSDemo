//
//  ContentView.swift
//  watchside Watch App
//
//  Created by aprillee on 2023/4/21.
//

import SwiftUI

struct ContentView: View {
    
    let appConnectManager = AppConnectManager()
    
    var body: some View {
        VStack {
            Button {
                appConnectManager.sayYeahToApp()
            } label: {
                Text("Say Yeah to App")
            }
        }
        .onAppear {
            appConnectManager.checkSection()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
