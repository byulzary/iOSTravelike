
import SwiftUI

struct CardView: View, Identifiable {
    let id=UUID()
    var travel: Destination
    var body: some View {
        Image(travel.image)
            .resizable()
            .cornerRadius(24)
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay(
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 12, content: {
                    Text(travel.place.uppercased())
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .shadow(radius: 1)
                        .overlay(Rectangle().fill(Color.white).frame(height:1), alignment: .bottom)
                    Text(travel.area.uppercased())
                        .foregroundColor(Color.black)
                        .font(.footnote)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .frame(minWidth: 120)
                        .background(Capsule().fill(Color.white))
                       
                }
                ).frame(minWidth:200)
                .padding(.bottom, 50),
                alignment: .bottom
            )
        }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(travel: travelData[0])
            .previewLayout(.fixed(width: 375, height: 600))
            
    }
}
