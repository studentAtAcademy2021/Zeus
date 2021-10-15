//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

CTFontManagerRegisterFontsForURL(Bundle.main.url(forResource: "Merriweather-Bold", withExtension: "ttf")! as CFURL, CTFontManagerScope.process, nil)

struct ContentView: View {
    
    var body: some View {
        
        GeometryReader {geo in
            ZStack {
                Image(uiImage: UIImage(named: "Sleexp.png")!)
                    .resizable()
                    .scaledToFill()
                    .offset(x: -230, y: 0)
                
                Text("The End ?")
                    .position(x: geo.size.width / 2, y: geo.size.height / 2.5)
                    .font(.custom("Merriweather-Bold", size: 50))
                    .foregroundColor(.white)
 
            }
            
            
        }
        
        .frame(width: 828/3, height: 1792/3)
        .background(Color(red: 200 / 255, green: 200 / 255, blue: 200 / 255))
        .ignoresSafeArea(.all)
    }
}

PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
