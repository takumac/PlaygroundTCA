//
//  Navigation2Core.swift
//  PlaygroundTCA
//
//  Created by sakai on 2023/06/27.
//

import Foundation
import ComposableArchitecture

struct Navigation2Core: Reducer {
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        case toNavigationView1Tap
        case toNavigationView3Tap
        case popToRoot
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .toNavigationView1Tap:
                return .none
            case .toNavigationView3Tap:
                return .none
            case .popToRoot:
                return .none
            }
        }
    }
}
