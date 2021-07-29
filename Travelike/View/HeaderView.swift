
import SwiftUI

struct HeaderView: View {
    
    @Binding var showguideView: Bool
    @Binding var showInfoView:Bool
    
    var body: some View {
        HStack{
            Button(action:{
                //print("Information")
                self.showInfoView.toggle()
            }){
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(Color.primary)
            .sheet(isPresented: $showInfoView) {
                infoView()
            }
            
            Spacer()
            
            Image("photo-logo-travel")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            
            Spacer()
            
            Button(action:{
                //print("Guide")
                self.showguideView.toggle()
            }){
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight:.regular))
            }
            .accentColor(Color.primary)
            .sheet(isPresented: $showguideView) {
                GuideView()
            }
        }
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    @State static var showGuide: Bool=false
    @State static var showInfo: Bool=false
    static var previews: some View {
        HeaderView(showguideView: $showGuide, showInfoView: $showInfo)
            .previewLayout(.fixed(width: 375, height: 88))
    }
}
