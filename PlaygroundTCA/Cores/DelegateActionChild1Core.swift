//
//  DelegateActionChild1Core.swift
//  PlaygroundTCA
//
//  Created by sakai on 2023/08/15.
//

import Foundation
import ComposableArchitecture

struct DelegateActionChild1Core: Reducer {
    struct State: Equatable {
        @BindingState var text: String
        
        init(text: String = "") {
            self.text = text
        }
    }
    
    enum Action: Equatable, BindableAction {
        case doneButtonTap(String)
        case binding(BindingAction<State>)
    }
    
    var body: some ReducerOf<Self> {
        
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case let .doneButtonTap(text):
                return .none
            case .binding(_):
                return .none
            }
        }
    }
}
