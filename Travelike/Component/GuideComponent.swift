
import SwiftUI

struct GuideComponent: View {
    var title:String
    var subtitle:String
    var description: String
    var icon: String
    
    var body: some View {
        HStack(alignment:.center,spacing:20){
            Image(systemName: icon)
                .font(.largeTitle).foregroundColor(Color.blue)
            
            VStack(alignment:.leading,spacing:4){
                HStack{
                    Text(title.uppercased()).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.heavy)
                    Spacer()
                    Text(subtitle.uppercased()).font(.footnote).fontWeight(.heavy)
                        .foregroundColor(Color.blue)
                }
                Divider().padding(.bottom, 4)
                Text(description).font(.footnote).foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct GuideComponent_Previews: PreviewProvider {
    static var previews: some View {
        GuideComponent(
            title: "Title",
            subtitle: "Swipe Right",
            description: "This is a placeholder, this is a place holder, this is a placeholder", icon:"heart.circle")
            .previewLayout(.sizeThatFits)
        }
    }

