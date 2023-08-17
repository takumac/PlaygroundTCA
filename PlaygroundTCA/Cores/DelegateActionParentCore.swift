//
//  DelegateActionParentCore.swift
//  PlaygroundTCA
//
//  Created by sakai on 2023/08/15.
//

import Foundation
import ComposableArchitecture

struct DelegateActionParentCore: Reducer {
    struct State: Equatable {
        var text: String
        init(text: String = "initial text") {
            self.text = text
        }
    }
    
    enum Action: Equatable {
        case textSettingButtonTap
    }
    
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .textSettingButtonTap:
                return .none
            }
        }
    }
}
