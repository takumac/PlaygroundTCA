//
//  PlaygroundTCAApp.swift
//  PlaygroundTCA
//
//  Created by sakai on 2023/06/27.
//

import SwiftUI
import ComposableArchitecture

@main
struct PlaygroundTCAApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(
                store: Store(initialState: MainCore.State()) {
                    MainCore()
//                        ._printChanges()
                }
            )
        }
    }
}
