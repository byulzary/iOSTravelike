

import SwiftUI
var favs: [Destination] = DestinationList.destinations
var i=0


struct FavsView: View {
        
    let columns = [
        GridItem(.adaptive(minimum: 100, maximum: 100))
        ]
    var body: some View {
        
        VStack{
            Image(systemName: "heart.circle").resizable().frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Spacer()
            Text("Favorites").foregroundColor(.blue).font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Spacer()
            
            
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0...favoritesData.count-1, id: \.self) { item in
                    Spacer()
                    
                    Image(favoritesData[item].image).resizable().frame(width: 300, height: 355, alignment: .center).cornerRadius(20).shadow(radius: 3)
                        .overlay(Text(favoritesData[item].place).foregroundColor(.black).font(.largeTitle).fontWeight(.bold), alignment: .top
                        )
                        .overlay(Text(favoritesData[item].area).foregroundColor(.black).font(.title2).fontWeight(.bold), alignment: .bottomTrailing
                        )
                    Spacer()
                }
               
            }
        }
        }
        
}

struct FavsView_Previews: PreviewProvider {
    static var previews: some View {
        FavsView()
    }
}
}
