

import SwiftUI



struct FooterView: View {
    
    //var favorites: [Destination] = DestinationList.destinations
    
    @Binding var showNavigateAlert: Bool
    @Binding var showFavoritesView:Bool
    @Binding var showMapView:Bool
    
    var body: some View {
        HStack{
            Spacer()
            Button(action:{
                self.showMapView.toggle()
            }){
            Image(systemName: "mappin.and.ellipse")
                .font(.system(size:42,weight:.light))
        }
        .padding()
        .sheet(isPresented: $showMapView) {
            MapView()
        }
            
            Spacer()
            
            Button(action:{
                //self.showMap.toggle()
               // print("Success")
                self.showNavigateAlert.toggle()
            }){
                Text("Navigate".uppercased())
                    .font(.system(.subheadline,design:.rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal,20)
                    .padding(.vertical, 12)
                    .accentColor(Color.blue)
                    .background(Capsule().stroke(Color.blue,lineWidth: 2))
            }

            
            Spacer()
            Button(action:{
                self.showFavoritesView.toggle()
            }){
            Image(systemName: "heart.circle")
                .font(.system(size:42,weight:.light))
        }
        .padding()
        .sheet(isPresented: $showFavoritesView) {
            FavsView()
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    @State static var showAlert: Bool=false
    @State static var showFavorites: Bool=false
    @State static var showMap:Bool=false
    
    static var previews: some View {
        FooterView(showNavigateAlert: $showAlert, showFavoritesView: $showFavorites, showMapView: $showMap)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
}
