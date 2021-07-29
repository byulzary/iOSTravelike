
import SwiftUI
import UIKit

struct ContentView: View {
    
    
    
    @State var showAlert: Bool=false
    
    @State var showGuide:Bool=false
    
    @State var showInfo:Bool=false
    
    @State var showFavorites:Bool=false
    
    @State var showMap:Bool=false
    
    @GestureState private var dragState=DragState.inactive
    
    private var dragAreaThreshold: CGFloat=65.0
    
    @State private var lastCardIndex: Int = 1
    
    @State private var cardRemovalTransition = AnyTransition.trailingBottom
    
    //mark card views
    
    @State var cardViews:[CardView]={
        var views=[CardView]()
        for index in 0..<2{
            views.append(CardView(travel: travelData[index]))
        }
        return views
    }()
    
    //mark move cards
    
    private func moveCards(){
        cardViews.removeFirst()
        self.lastCardIndex += 1
        let travel=travelData[lastCardIndex % travelData.count]
        let newCardView=CardView(travel: travel)
        cardViews.append(newCardView)
    }
    
    //mark top card
    private func isTopCard(cardView: CardView)->Bool{
        guard let index=cardViews.firstIndex(where:{
            $0.id==cardView.id
        }) else{
            return false
        }
        return index==0
    }
    
    //mark drag states
    
    enum DragState{
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize{
            switch self{
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool{
            switch self{
            case .dragging:
                return true
            case .pressing, .inactive:
                return false
            }
        }
        
        var isPressing: Bool{
            switch self{
            case .pressing,.dragging:
                return true
            case .inactive:
                return false
            }
        }
    }
    
    var body: some View {
        VStack{
            
            //mark header
            
            HeaderView(showguideView: $showGuide, showInfoView: $showInfo)
                .opacity(dragState.isDragging ? 0.0:1.0).animation(.default)

            Spacer()
            
            //mark cards
            ZStack{
                ForEach(cardViews){ cardView in cardView
                    .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                    .overlay(
                        ZStack{
                            Image(systemName: "x.circle")
                                .modifier(SymbolModifier())
                                .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            
                            Image(systemName: "heart.circle")                            .modifier(SymbolModifier())
                                .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)                        }
                    )
                    .offset(x: self.isTopCard(cardView: cardView) ?
                    self.dragState.translation.width: 0, y:
                    self.isTopCard(cardView: cardView) ?
                    self.dragState.translation.height : 0)
                    .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.85 : 1.0)
                    .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double(self.dragState.translation.width / 12) : 0))
                    .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                    .gesture(LongPressGesture(minimumDuration: 0.01).sequenced(before: DragGesture()).updating(self.$dragState, body:{(value, state, transaction) in
                        switch value{
                        case .first(true):
                            state = .pressing
                        case .second(true, let drag):
                            state = .dragging(translation: drag?.translation ?? .zero)
                        default:
                            break
                        }
                    })
                    .onChanged({(value) in
                        guard case .second(true, let drag?) = value else{
                            return
                        }
                        if drag.translation.width < -self.dragAreaThreshold{
                            self.cardRemovalTransition = .leadingBottom
                        }
                        if drag.translation.width > self.dragAreaThreshold{
                            self.cardRemovalTransition = .trailingBottom
                        }
                        
                    })
                    .onEnded({ (value) in
                        guard case .second(true, let drag?) = value else {
                            return
                        }
                        let swipeRight = drag.translation.width > self.dragAreaThreshold
                        let swipeLeft = drag.translation.width < -self.dragAreaThreshold
                        if swipeRight ||
                            swipeLeft {
                            if (swipeRight){
                                addToFavorites(location: cardView.travel)
                            }
                            self.moveCards()
                        }
                    })
                    ).transition(self.cardRemovalTransition)
            }
        }.padding(.horizontal)


        Spacer()
            
            
           //footer mark
            FooterView(showNavigateAlert:$showAlert, showFavoritesView: $showFavorites, showMapView: $showMap ).opacity(dragState.isDragging ? 0.0:1.0).animation(.default)
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("Success".uppercased()), message: Text("Have a safe drive!".uppercased()),dismissButton: .default(Text("Happy Holdiays".uppercased())))
        
        }
    }
    
    func addToFavorites(location: Destination){
        
        favoritesData.append(location)
        print("item added")
        for location in favoritesData{
        print(location)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().previewDevice("iPhone 12 Pro")
           
        }
    }
}
