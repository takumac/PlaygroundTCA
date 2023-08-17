//
//  BindingParentView.swift
//  PlaygroundTCA
//
//  Created by sakai on 2023/06/27.
//

import SwiftUI
import ComposableArchitecture

struct BindingParentView: View {
    let store: StoreOf<BindingParentCore>
    
    var body: some View {
        Text("BindingParentView")
    }
}
