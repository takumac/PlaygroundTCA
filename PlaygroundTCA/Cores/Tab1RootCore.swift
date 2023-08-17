//
//  Tab1RootCore.swift
//  PlaygroundTCA
//
//  Created by sakai on 2023/06/27.
//

import Foundation
import ComposableArchitecture

struct Tab1RootCore: Reducer {
    struct State: Equatable {
        var tab1Path = StackState<Tab1Path.State>()
    }
    
    enum Action: Equatable {
        case tutorialsCounterButtonTap
        case tutorialsContactsButtonTap
        case navigationButtonTap
        case bindingButtonTap
        case delegateActionButtonTap
        
        case tab1Path(StackAction<Tab1Path.State, Tab1Path.Action>)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .tutorialsCounterButtonTap:
                state.tab1Path.append(.tutorialsCounter())
                return .none
            case .tutorialsContactsButtonTap:
                state.tab1Path.append(.tutorialsContacts())
                return .none
            case .navigationButtonTap:
                state.tab1Path.append(.navigation1())
                return .none
            case .bindingButtonTap:
                state.tab1Path.append(.binding())
                return .none
            case .delegateActionButtonTap:
                state.tab1Path.append(.delegateActionParent())
                return .none
            case let .tab1Path(action):
                switch action {
                case .element(id: _, action: .navigation1(.toNavigationView2Tap)):
                    state.tab1Path.append(.navigation2())
                    return .none
                case .element(id: _, action: .navigation1(.toNavigationView3Tap)):
                    state.tab1Path.append(.navigation3())
                    return .none
                case .element(id: _, action: .navigation1(.popToRoot)):
                    state.tab1Path.removeAll()
                    return .none
                case .element(id: _, action: .navigation2(.toNavigationView1Tap)):
                    state.tab1Path.append(.navigation1())
                    return .none
                case .element(id: _, action: .navigation2(.toNavigationView3Tap)):
                    state.tab1Path.append(.navigation3())
                    return .none
                case .element(id: _, action: .navigation2(.popToRoot)):
                    state.tab1Path.removeAll()
                    return .none
                case .element(id: _, action: .navigation3(.toNavigationView1Tap)):
                    state.tab1Path.append(.navigation1())
                    return .none
                case .element(id: _, action: .navigation3(.toNavigationView2Tap)):
                    state.tab1Path.append(.navigation2())
                    return .none
                case .element(id: _, action: .navigation3(.popToRoot)):
                    state.tab1Path.removeAll()
                    return .none
                case .element(id: _, action: .delegateActionParent(.textSettingButtonTap)):
                    state.tab1Path.append(.delegateActionChild1())
                    return .none
                case .element(id: _, action: .delegateActionChild1(.doneButtonTap(_))):
                    state.tab1Path.removeLast()
                    return .none
                default:
                    return .none
                }
            }
        }
        .forEach(\.tab1Path, action: /Action.tab1Path) {
            Tab1Path()
        }
    }
    
    struct Tab1Path: Reducer {
        enum State: Equatable {
            case tutorialsCounter(CounterFeature.State = .init())
            case tutorialsContacts(ContactsFeature.State = .init())
            case navigation1(Navigation1Core.State = .init())
            case navigation2(Navigation2Core.State = .init())
            case navigation3(Navigation3Core.State = .init())
            case binding(BindingParentCore.State = .init())
            case delegateActionParent(DelegateActionParentCore.State = .init())
            case delegateActionChild1(DelegateActionChild1Core.State = .init())
        }
        
        enum Action: Equatable {
            case tutorialsCounter(CounterFeature.Action)
            case tutorialsContacts(ContactsFeature.Action)
            case navigation1(Navigation1Core.Action)
            case navigation2(Navigation2Core.Action)
            case navigation3(Navigation3Core.Action)
            case binding(BindingParentCore.Action)
            case delegateActionParent(DelegateActionParentCore.Action)
            case delegateActionChild1(DelegateActionChild1Core.Action)
        }
        
        var body: some Reducer<State, Action> {
            Scope(state: /State.tutorialsCounter, action: /Action.tutorialsCounter) {
                CounterFeature()
                    ._printChanges()
            }
            Scope(state: /State.tutorialsContacts, action: /Action.tutorialsContacts) {
                ContactsFeature()
                    ._printChanges()
            }
            Scope(state: /State.navigation1, action: /Action.navigation1) {
                Navigation1Core()
            }
            Scope(state: /State.navigation2, action: /Action.navigation2) {
                Navigation2Core()
            }
            Scope(state: /State.navigation3, action: /Action.navigation3) {
                Navigation3Core()
            }
            Scope(state: /State.binding, action: /Action.binding) {
                BindingParentCore()
            }
            Scope(state: /State.delegateActionParent, action: /Action.delegateActionParent) {
                DelegateActionParentCore()
            }
            Scope(state: /State.delegateActionChild1, action: /Action.delegateActionChild1) {
                DelegateActionChild1Core()
            }
        }
    }

}
