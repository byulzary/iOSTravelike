

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        VStack(alignment:.center, spacing:20){
            Capsule().frame(width:100, height:6).foregroundColor(Color.secondary)
                .opacity(0.2)
            Image("photo-logo-travel").resizable().scaledToFit().frame(height:100)
        }
        
    }
}

struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponent()
            .previewLayout(.fixed(width: 375, height: 128))
    }
}
