//
//  Navigation1Core.swift
//  PlaygroundTCA
//
//  Created by sakai on 2023/06/27.
//

import Foundation
import ComposableArchitecture

struct Navigation1Core: Reducer {
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        case toNavigationView2Tap
        case toNavigationView3Tap
        case popToRoot
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .toNavigationView2Tap:
                return .none
            case .toNavigationView3Tap:
                return .none
            case .popToRoot:
                return .none
            }
        }
    }
}
