

import SwiftUI
import MapKit

struct AnnotatedItem: Identifiable{
    let id=UUID()
    var name:String
    var coordinate: CLLocationCoordinate2D
}



struct MapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 32.0853, longitude: 34.7818), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    private var POI=[
        
        
        AnnotatedItem(name: "Ein Hanatziv", coordinate: .init(latitude: 32.4707, longitude: 35.5020)),
            AnnotatedItem(name: "Mini Israel", coordinate: .init(latitude: 31.8422, longitude: 34.9690)),
        AnnotatedItem(name: "Timna Park", coordinate: .init(latitude: 29.7882, longitude: 35.0032)),
        AnnotatedItem(name: "Jerusalem", coordinate: .init(latitude: 31.7683, longitude: 35.2137)),
        AnnotatedItem(name: "Ramat Gan Zoo", coordinate: .init(latitude: 32.0453, longitude: 34.8226)),
        AnnotatedItem(name: "Ein Jones", coordinate: .init(latitude: 32.682940938733054, longitude: 35.66640846930703)),
        AnnotatedItem(name: "Ramon Crater", coordinate: .init(latitude: 30.6153, longitude: 34.8845)),
        AnnotatedItem(name: "Masada National Park", coordinate: .init(latitude: 31.3114, longitude: 35.3627)),
        AnnotatedItem(name: "Tel Aviv", coordinate: .init(latitude: 32.0853, longitude: 34.7818)),
        AnnotatedItem(name: "Eilat", coordinate: .init(latitude: 29.5577, longitude: 34.9519)),
        AnnotatedItem(name: "Mount Hermon", coordinate: .init(latitude: 33.4162, longitude: 35.8570)),
        AnnotatedItem(name: "Dead Sea", coordinate: .init(latitude: 31.5590, longitude: 35.4732))
    ]
    
    var body: some View {
        VStack{
            Spacer()
            Image("photo-logo-travel").resizable().frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer()
        Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: POI){
            items in
            MapMarker(coordinate: items.coordinate, tint: .red)
        }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
