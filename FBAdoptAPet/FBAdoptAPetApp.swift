//
//  FBAdoptAPetApp.swift
//  FBAdoptAPet
//
//  Created by Victor Tabacoff on 10/28/24.
//

import SwiftUI
import Firebase

@main
struct FBAdoptAPetApp: App {
    @StateObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(DataManager())
        }
    }
}
