//
//  DelegateActionChild1View.swift
//  PlaygroundTCA
//
//  Created by sakai on 2023/08/15.
//

import SwiftUI
import ComposableArchitecture

struct DelegateActionChild1View: View {
    let store: StoreOf<DelegateActionChild1Core>
    
    struct ViewState: Equatable {
        @BindingViewState var text: String
        
        init(bindingViewStore: BindingViewStore<DelegateActionChild1Core.State>) {
            self._text = bindingViewStore.$text
        }
    }
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer().frame(width: 30)
                WithViewStore(self.store, observe: ViewState.init) { viewStore in
                    TextField("テキストを入力",text: viewStore.$text)
                        .padding()
                        .border(.gray, width: 1.0)
                }
                Spacer().frame(width: 30)
            }
            
            Spacer().frame(height: 50)
            
            HStack {
                Spacer().frame(width: 30)
                WithViewStore(self.store, observe: { $0 }) { viewStore in
                    Text(viewStore.text)
                        .padding()
                        .border(.red, width: 1.0)
                }
                Spacer().frame(width: 30)
            }
            
            Spacer().frame(height: 50)
            
            WithViewStore(self.store, observe: { $0 }) { viewStore in
                Button("設定") {
                    viewStore.send(.doneButtonTap(viewStore.text))
                }
            }
        }
    }
}

