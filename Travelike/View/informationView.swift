
import SwiftUI

struct infoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment:.center,spacing:20){
               HeaderComponent()
                Spacer(minLength: 10)
                Text("Application Information").fontWeight(.black).modifier(TitleModifier())
                
                AppInfoView()

                Text("Credits").fontWeight(.black).modifier(TitleModifier())
                
                HStack{
                    Text("Photos").foregroundColor(Color.gray)
                    Spacer()
                    Text("Google Images")
                }
                Spacer(minLength: 10)
                
                Button(action:{
                    self.presentationMode.wrappedValue.dismiss()
                   // print("button was tapped")
                }){
                    Text("Continue".uppercased()).modifier(ButtonModifier())
                }
            }.frame(minWidth:0, maxWidth: .infinity).padding(.top, 15).padding(.bottom, 25).padding(.horizontal, 25)
        }
        
    }
}

struct infoView_Previews: PreviewProvider {
    static var previews: some View {
        infoView()
    }
}

struct AppInfoView: View{
    var body:some View{
        VStack(alignment:.leading,spacing:10){
            RowAppInfoView(ItemOne: "Application", ItemTwo: "Travelike")
            RowAppInfoView(ItemOne: "Designed For", ItemTwo: "iPhone")
            RowAppInfoView(ItemOne: "Developed by", ItemTwo: "Barak Yulzary")
            RowAppInfoView(ItemOne: "For class", ItemTwo: "Advanced Mobile Development")
        }
    }
    
}

struct RowAppInfoView:View{
    
    var ItemOne: String
    var ItemTwo: String
    
    var body:some View{
        VStack{
            HStack{
                Text(ItemOne).foregroundColor(Color.gray)
                Spacer()
                Text(ItemTwo)
            }
            Divider()
        }
    }
}
