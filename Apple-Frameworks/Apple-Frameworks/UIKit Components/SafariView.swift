//
//  SafariView.swift
//  Apple-Frameworks
//
//  Created by 이범석 on 7/26/25.
//

import SwiftUI
import SafariServices

// SwiftUI -> UIKit를 사용하기 위한 View.
struct SafariView: UIViewControllerRepresentable {
    
    let url : URL
    
    // 처음 호출될 때 실행되는 컨트롤러
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        // UIKit에서 사용되는 컨트롤러
        SFSafariViewController(url: url)
    }
    
    // 업데이트 될 때 실행되는 컨트롤러
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
            
    }
}
