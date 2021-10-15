//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport
import AVKit

CTFontManagerRegisterFontsForURL(Bundle.main.url(forResource: "Merriweather-Bold", withExtension: "ttf")! as CFURL, CTFontManagerScope.process, nil)

class SoundManager {
    
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    func playSound(soundName:String) {
        guard let path = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: path)
            player?.play()
        } catch let error {
            print("Error is\(error)")
        }
        
    }
}

struct ContentView: View {
    
    @State private var phoneOffset: CGFloat = 200
    
//    @State var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        
        GeometryReader {geo in
            ZStack {
                Image(uiImage: UIImage(named: "cafe_empty.png")!)
                    .resizable()
                    .scaledToFit()
                Image(uiImage: UIImage(named: "PhoneBan.png")!)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(1)
                    .offset(x: phoneOffset, y: -113)
                    .animation(.easeInOut(duration: 1))
                
                VStack {
                    Text("Coincidentally, it is an advertisement saying:")
                        .padding()
                        .font(.custom("Merriweather-Bold", size: 24))
                        .foregroundColor(.white)
                    Text("\"Gods' Condoms for sale!\"")
                        .padding()
                        .font(.custom("Merriweather-Bold", size: 24))
                        .foregroundColor(.white)
                }
                .offset(y: 140)
            }
            
            
        }
        
        .frame(width: 828/3, height: 1792/3)
        .background(Color(red: 200 / 255, green: 200 / 255, blue: 200 / 255))
        .ignoresSafeArea(.all)
        .onAppear {
            phoneOffset = 0
//            SoundManager.instance.playSound(soundName: "male_yes")
        }

    }
}

PlaygroundPage.current.setLiveView(ContentView())


//: [Next](@next)
