//
//  Navigation3View.swift
//  PlaygroundTCA
//
//  Created by sakai on 2023/06/27.
//

import SwiftUI
import ComposableArchitecture

struct Navigation3View: View {
    let store: StoreOf<Navigation3Core>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                Text("Navigation3View")
                    .padding(.bottom, 50)
                
                Button("To Navigation1View") {
                    viewStore.send(.toNavigationView1Tap)
                }
                .padding(.bottom, 30)
                
                Button("To Navigation2View") {
                    viewStore.send(.toNavigationView2Tap)
                }
                .padding(.bottom, 30)
                
                Button("popToRoot") {
                    viewStore.send(.popToRoot)
                }.padding(.bottom, 30)
            }
        }
    }
}
