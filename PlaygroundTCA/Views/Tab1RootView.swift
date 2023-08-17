//
//  Tab1RootView.swift
//  PlaygroundTCA
//
//  Created by sakai on 2023/06/27.
//

import SwiftUI
import ComposableArchitecture

struct Tab1RootView: View {
    let store: StoreOf<Tab1RootCore>
    
    var body: some View {
        NavigationStackStore(self.store.scope(state: \.tab1Path, action: Tab1RootCore.Action.tab1Path)) {
            VStack {
                Button("Tutorials Counter") {
                    self.store.send(.tutorialsCounterButtonTap)
                }
                .padding(.bottom, 20)
                Button("Tutorials Contacts") {
                    self.store.send(.tutorialsContactsButtonTap)
                }
                .padding(.bottom, 20)

                Button("Navigation Stack") {
                    self.store.send(.navigationButtonTap)
                }
                .padding(.bottom, 20)
                
                Button("Binding") {
                    self.store.send(.bindingButtonTap)
                }
                .padding(.bottom, 20)
                
                Button("Delegate Action") {
                    self.store.send(.delegateActionButtonTap)
                }
                .padding(.bottom, 20)
            }
        } destination: {
            switch $0 {
            case .tutorialsCounter:
                CaseLet(
                    /Tab1RootCore.Tab1Path.State.tutorialsCounter,
                    action: Tab1RootCore.Tab1Path.Action.tutorialsCounter,
                    then: CounterView.init(store:)
                )
            case .tutorialsContacts:
                CaseLet(
                    /Tab1RootCore.Tab1Path.State.tutorialsContacts,
                    action: Tab1RootCore.Tab1Path.Action.tutorialsContacts,
                    then: ContactsView.init(store:)
                )
            case .navigation1:
                CaseLet(
                    /Tab1RootCore.Tab1Path.State.navigation1,
                    action: Tab1RootCore.Tab1Path.Action.navigation1,
                    then: Navigation1View.init(store:)
                )
            case .navigation2:
                CaseLet(
                    /Tab1RootCore.Tab1Path.State.navigation2,
                    action: Tab1RootCore.Tab1Path.Action.navigation2,
                    then: Navigation2View.init(store:)
                )
            case .navigation3:
                CaseLet(
                    /Tab1RootCore.Tab1Path.State.navigation3,
                    action: Tab1RootCore.Tab1Path.Action.navigation3,
                    then: Navigation3View.init(store:)
                )
            case .binding:
                CaseLet(
                    /Tab1RootCore.Tab1Path.State.binding,
                    action: Tab1RootCore.Tab1Path.Action.binding,
                    then: BindingParentView.init(store: )
                )
            case .delegateActionParent:
                CaseLet(
                    /Tab1RootCore.Tab1Path.State.delegateActionParent,
                    action: Tab1RootCore.Tab1Path.Action.delegateActionParent,
                    then: DelegateActionParentView.init(store: )
                )
            case .delegateActionChild1:
                CaseLet(
                    /Tab1RootCore.Tab1Path.State.delegateActionChild1,
                    action: Tab1RootCore.Tab1Path.Action.delegateActionChild1,
                    then: DelegateActionChild1View.init(store: )
                )
            }
        }
    }
}
