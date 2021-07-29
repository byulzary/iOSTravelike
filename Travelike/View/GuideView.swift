

import SwiftUI

struct GuideView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment:.center,spacing:20){
               HeaderComponent()
                Spacer(minLength: 0)
                Text("Get Started").fontWeight(.black).modifier(TitleModifier())
                
                Text("Discover cool and unique placesd to visit in Israel").lineLimit(nil).multilineTextAlignment(.center)
                
                Spacer(minLength: 0)
                
                VStack(alignment:.leading, spacing:25){
                    GuideComponent(
                        title: "Save",
                        subtitle:"Swipe Right",
                        description:"If you like this place swipe right to save it",
                        icon: "heart.circle")
                    
                    GuideComponent(
                        title: "Skip",
                        subtitle:"Swipe Left",
                        description:"If you do not likethis place swipe left",
                        icon: "xmark.circle")
                    
                    GuideComponent(
                        title: "Navigate",
                        subtitle:"Press button",
                        description:"If you want to navigate to this place",
                        icon: "checkmark.square")
                    }
                
                
                Spacer(minLength: 10)
                
                Button(action:{
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Continue".uppercased()).modifier(ButtonModifier())
                }
                
                }
                
                Spacer(minLength: 10)
            }
            .frame(minWidth: 0, maxWidth: .infinity).padding(.top,15).padding(.bottom,25).padding(.horizontal,25)
            
        }
    }


struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
