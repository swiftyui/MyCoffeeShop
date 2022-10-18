import Foundation
import SwiftUI

struct DotIndicator: View {
    let pageIndex: Int
    @Binding var isOn: Int
    let colorNotSelected: Color
    let colorSelected: Color
    
    var body: some View {
        
        VStack {
            
            Button(action: { self.isOn = self.pageIndex })
            {
                Circle()
                    .tint( isOn == pageIndex ? colorSelected : colorNotSelected)
                    .scaleEffect( isOn == pageIndex ? 2.0 : 0.9)
                    .onAppear() {
                        withAnimation(Animation.spring()){ }
                    }
            }
        }
    }
}
