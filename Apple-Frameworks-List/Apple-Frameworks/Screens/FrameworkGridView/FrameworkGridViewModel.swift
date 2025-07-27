//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//  ViewModel역할
//
//  Created by 이범석 on 7/24/25.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        // selectedFramework가 변경이되면 isShowingDetailView가 true로 변경
        didSet{
            isShowingDetailView = true
        }
    }
    @Published var isShowingDetailView = false
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
}
