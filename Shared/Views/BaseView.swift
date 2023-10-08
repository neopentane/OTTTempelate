//
//  BaseView.swift
//  OTTTemplateApp
//
//  Created by Shreeram Kelkar on 05/10/23.
//

import SwiftUI

struct BaseView: View {
    
    @StateObject private var viewModel = baseViewModel()
    
    var body: some View {
        Text("Welcome To Home Screen")
    }
}

#Preview {
    BaseView()
}
