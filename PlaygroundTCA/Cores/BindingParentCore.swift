//
//  BindingParentCore.swift
//  PlaygroundTCA
//
//  Created by sakai on 2023/06/27.
//

import Foundation
import ComposableArchitecture

struct BindingParentCore: Reducer {
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            return .none
        }
    }
}
