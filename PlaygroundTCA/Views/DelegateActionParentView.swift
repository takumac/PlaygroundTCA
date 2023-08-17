//
//  DelegateActionParentView.swift
//  PlaygroundTCA
//
//  Created by sakai on 2023/08/15.
//

import SwiftUI
import ComposableArchitecture

struct DelegateActionParentView: View {
    let store: StoreOf<DelegateActionParentCore>
    
    var body: some View {
        WithViewStore(self.store,
                      observe: { $0 })
        { viewStore in
            VStack {
                Text(viewStore.text)
                    .padding()
                    .border(.gray, width: 1.0)
                Button("テキスト設定") {
                    viewStore.send(.textSettingButtonTap)
                }
            }
        }
        
    }
}
