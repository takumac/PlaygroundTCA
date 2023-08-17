//
//  MainView.swift
//  PlaygroundTCA
//
//  Created by sakai on 2023/06/27.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
    let store: StoreOf<MainCore>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            TabView {
                Tab1RootView(store: self.store.scope(state: \.tab1RootState, action: MainCore.Action.tab1RootAction))
                    .tabItem {
                        Image(systemName: "1.circle.fill")
                    }
                Tab2RootView()
                    .tabItem {
                        Image(systemName: "2.circle.fill")
                    }
            }
        }
    }
}
