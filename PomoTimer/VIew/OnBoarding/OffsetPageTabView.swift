//
//  OffsetPageTabView.swift
//  PomoTimer
//
//  Created by Bonifasius Toto Neguisa Ginting on 22/07/22.
//

import SwiftUI

// Custom VIew that will return offset for Paging Control
struct OffsetPageTabView<Content: View>: UIViewRepresentable {
    
    var content: Content
    @Binding var offset: CGFloat
    
    func makeCoordinator() -> Coordinator {
        return OffsetPageTabView.Coordinator(parent: self)
    }
    
    init(offset: Binding<CGFloat>, @ViewBuilder content: @escaping ()->Content){
        
        self.content = content()
        self._offset = offset
    }
    
    func makeUIView(context: Context) ->  UIScrollView {
        
        let scrollview = UIScrollView()
        
        // Extrating SwiftUI View and embedding into UIKit ScrollVIew
        let hostview = UIHostingController(rootView: content)
        hostview.view.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
           
            hostview.view.topAnchor.constraint(equalTo: scrollview.topAnchor),
            hostview.view.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            hostview.view.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            hostview.view.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor),
            hostview.view.heightAnchor.constraint(equalTo: scrollview.heightAnchor)
        
        ]
        
        scrollview.addSubview(hostview.view)
        scrollview.addConstraints(constraints)
        
        // Enable Paging
        scrollview.isPagingEnabled = true
        scrollview.showsVerticalScrollIndicator = false
        scrollview.showsHorizontalScrollIndicator = false
        
        // Atur Delegate
        scrollview.delegate = context.coordinator
        
        hostview.view.backgroundColor = UIColor(named: "BackgroundColor")
        
        return scrollview
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        // need to update only when offset changed manually. just check the current and scrollview offsets
        let currentOffset = uiView.contentOffset.x
        
        if currentOffset != offset{
            print("updating")
            uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        }
     
    }
    
    // pager offset
    class Coordinator: NSObject, UIScrollViewDelegate {
        
        var parent: OffsetPageTabView
        
        
        init(parent: OffsetPageTabView) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView)  {
            let offset = scrollView.contentOffset.x
            
            parent.offset = offset
        }
    }
}

struct OffsetPageTabView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
