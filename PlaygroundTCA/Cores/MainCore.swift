//
//  MainCore.swift
//  PlaygroundTCA
//
//  Created by sakai on 2023/06/27.
//

import Foundation
import ComposableArchitecture

struct MainCore: Reducer {
    struct State: Equatable {
        var tab1RootState = Tab1RootCore.State()
        
        init(tab1RootState: Tab1RootCore.State = Tab1RootCore.State()) {
            self.tab1RootState = tab1RootState
        }
    }
    
    enum Action: Equatable {
        case tab1RootAction(Tab1RootCore.Action)
    }
    
    var body: some Reducer<State, Action> {
        Scope(state: \.tab1RootState, action: /Action.tab1RootAction) {
            Tab1RootCore()
        }
        Reduce { state, action in
            switch action {
            default:
                return .none
            }
        }
    }
}
