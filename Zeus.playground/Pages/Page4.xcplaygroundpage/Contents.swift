//: [Previous](@previous)
import PlaygroundSupport
import SwiftUI

CTFontManagerRegisterFontsForURL(Bundle.main.url(forResource: "Merriweather-Regular", withExtension: "ttf")! as CFURL, CTFontManagerScope.process, nil)

struct ContentView: View {
    @State var zoomMode = 1.0
    
    var body: some View {
        VStack {
            
           Spacer()
            Text("Feeling tremendously excited, he sprints to the nearest supermarket and buys every condom he can find there.")
                .padding()
                .multilineTextAlignment(.center)
                .offset(y: -60)
                .font(Font.custom("Merriweather-Regular", size: 18, relativeTo: .body))
            
            Image(uiImage: UIImage(imageLiteralResourceName: "Zeus"))
            .resizable()
            .aspectRatio(contentMode: .fit)
            //.padding(.leading, 100.0)
            //.frame(height: 300.0)
            .offset(y: 15)
            .scaleEffect(zoomMode)
            .onTapGesture {
                withAnimation {
                zoomMode = 10.0
            }
            }
        }
    
        .background(Image(uiImage: UIImage(imageLiteralResourceName: "SupermarketBg"))
                        .resizable()
                        .aspectRatio(contentMode: .fill))
        .opacity(zoomMode == 10 ? 0: 1.0/zoomMode)
    }
}

PlaygroundPage.current
    .setLiveView(ContentView().frame(width: 828/3, height: 1792/3))

//: [Next](@next)
