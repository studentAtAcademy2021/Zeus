//: [Previous](@previous)

import PlaygroundSupport
import SwiftUI
import AVKit

CTFontManagerRegisterFontsForURL(Bundle.main.url(forResource: "Merriweather-Bold", withExtension: "ttf")! as CFURL, CTFontManagerScope.process, nil)

struct CloudView:View  {
    @State private var taps = 0
    @State private var scale: CGFloat = 1
    
    @State private var backgroundOpacity: CGFloat = 0
    
    var body: some View {
        GeometryReader { geo in
            ZStack() {
                Image(uiImage: UIImage(named: "Flashback.png")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width:828/3)
                
                Text ("Finally Zeus stops a girl intending to ask her:")
                    .offset(x: 0, y: -200)
                    .font(.custom("Merriweather-Bold", size: 18, relativeTo: .body))
                
                Image(uiImage: UIImage(named: "girlCloudNoBG.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 140, alignment: .bottom)
                    .offset(x: -55, y: -90)
                    .opacity(backgroundOpacity)
                    .animation(.easeIn(duration: 2), value: backgroundOpacity)
                
                Image(uiImage: UIImage(named: "zeusCloudNoBG.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 140, alignment: .bottom)
                    .offset(x: 60, y: -90)
                    .opacity(backgroundOpacity)
                    .animation(.easeIn(duration: 2), value: backgroundOpacity)
                
                
                Image(uiImage: UIImage(named:"girlAnswering.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 125, height: 125, alignment: .bottom)
                        .offset(x: -95, y: 30)
                    
                Image(uiImage: UIImage(named: "zeusAskingWhy.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 125, height: 125, alignment: .bottom)
                    .offset(x: 95, y: 30)
                    
            }
        }
        
        .frame(width: 828/3, height: 1792/3)
        .onTapGesture {
           
        }
        .onAppear {
            backgroundOpacity = 1
        }
                 }
                 }
PlaygroundPage.current.setLiveView(CloudView())

//: [Next](@next)
