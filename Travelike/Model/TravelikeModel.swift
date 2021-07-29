
import SwiftUI



struct Destination{

   // let id = UUID()
    let place: String
    let area: String
    let image: String
    let longi: Float
    let latti: Float
}

struct DestinationList{
    static let destinations=[
    
        Destination(place: "Mt. Hermon", area: "North Israel", image: "photo-mthermon", longi: 33.4162, latti: 35.8570),
        Destination(place: "Dead Sea", area: "Negev", image: "photo-deadsea", longi: 33.4162, latti: 35.8570),
        Destination(place: "Eilat", area: "South Israel", image: "photo-eilat-new", longi: 33.4162, latti: 35.8570),
        Destination(place: "Tel Aviv", area: "Central Israel", image: "photo-telaviv", longi: 33.4162, latti: 35.8570),
        Destination(place: "Massada", area: "Judea Desert", image: "photo-massada", longi: 33.4162, latti: 35.8570),
        Destination(place: "Ramon Crater", area: "Judea Desert", image: "photo-ramoncrater", longi: 33.4162, latti: 35.8570),
        Destination(place: "Ein Jones", area: "North Israel", image: "photo-einjones-new", longi: 33.4162, latti: 35.8570),
        Destination(place: "Ramat Gan Zoo", area: "Central Israel", image: "photo-ramatganZoo", longi: 33.4162, latti: 35.8570),
        Destination(place: "Jerusalem", area: "Judea Mountains", image: "photo-jerusalem", longi: 33.4162, latti: 35.8570),
        Destination(place: "Timna Park", area: "Judea Desert", image: "photo-timnaparknew", longi: 33.4162, latti: 35.8570),
        Destination(place: "Mini Israel", area: "Jerusalem", image: "photo-miniisraelnew", longi: 33.4162, latti: 35.8570),
        Destination(place: "Ein Hanatziv", area: "North Israel", image: "photo-einhanatzivnew", longi: 33.4162, latti: 35.8570)
    ]
}

//extension Destination{
//    static func all()->[Destination]{
//        return [
//            Destination(place: "Mt. Hermon", area: "North Israel", image: "photo-mthermon"),
//            Destination(place: "Dead Sea", area: "Negev", image: "photo-deadsea"),
//            Destination(place: "Eilat", area: "South Israel", image: "photo-eilat-new"),
//            Destination(place: "Tel Aviv", area: "Central Israel", image: "photo-telaviv"),
//            Destination(place: "Massada", area: "Judea Desert", image: "photo-massada"),
//            Destination(place: "Ramon Crater", area: "Judea Desert", image: "photo-ramoncrater"),
//            Destination(place: "Ein Jones", area: "North Israel", image: "photo-einjones-new"),
//            Destination(place: "Ramat Gan Zoo", area: "Central Israel", image: "photo-ramatganZoo"),
//            Destination(place: "Jerusalem", area: "Judea Mountains", image: "photo-jerusalem"),
//            Destination(place: "Timna Park", area: "Judea Desert", image: "photo-timnaparknew"),
//            Destination(place: "Mini Israel", area: "Jerusalem", image: "photo-miniisraelnew"),
//            Destination(place: "Ein Hanatziv", area: "North Israel", image: "photo-einhanatzivnew"),
//        ]
//    }

