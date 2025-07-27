//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//  ViewModel역할
//
//  Created by 이범석 on 7/24/25.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
}
