//: [Previous](@previous)

import PlaygroundSupport
import SwiftUI
import AVKit


CTFontManagerRegisterFontsForURL(Bundle.main.url(forResource: "Merriweather-Bold", withExtension: "ttf")! as CFURL, CTFontManagerScope.process, nil)

CTFontManagerRegisterFontsForURL(Bundle.main.url(forResource: "Merriweather-Regular", withExtension: "ttf")! as CFURL, CTFontManagerScope.process, nil)

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


struct CloudView:View  {
    
    @State private var taps = 0
    @State private var changeGirl: String = "girlNo1.png"
    @State private var ZeusAskingSexImage: String = "zeusAskingSex.png"
    
    var body: some View {
        GeometryReader { geo in
            ZStack() {
                
                Image(uiImage: UIImage(named: "Flashback.png")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width:828/3)
                Text ("FLASHBACK")
                    .offset(x: 5, y: -260)
                    .font(Font.custom("Merriweather-Bold", size: 18, relativeTo: .body))
                
                Text ("Zeus approaches a girl, she rejects him, he comes to another one, and the circle repeats itself again, and again, and again. Could you believe this was happening for a month already!")
                    .offset(x: 5, y: -150)
                    .font(Font.custom("Merriweather-Regular", size: 18, relativeTo: .body))
                
                Image(uiImage: UIImage(named:changeGirl)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 125, height: 125, alignment: .bottom)
                    .offset(x: -70, y: 30)
                
                Image(uiImage: UIImage(named: ZeusAskingSexImage)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 125, height: 125, alignment: .bottom)
                    .offset(x: 70, y: 30)
                
            }
            
        }
        
        .frame(width: 828/3, height: 1792/3)
        .background(Color.cyan)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                changeGirl = "girlNo2.png"
                SoundManager.instance.playSound(soundName: "error")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                changeGirl = "girlNo3.png"
                SoundManager.instance.playSound(soundName: "error")
            }
        }
        
        
    }
    
}

PlaygroundPage.current.setLiveView(CloudView())

