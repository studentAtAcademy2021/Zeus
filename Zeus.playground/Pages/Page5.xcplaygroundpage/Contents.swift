//: [Previous](@previous)

import PlaygroundSupport
import SwiftUI
import AVKit
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
CTFontManagerRegisterFontsForURL(Bundle.main.url(forResource: "Merriweather-Bold", withExtension: "ttf")! as CFURL, CTFontManagerScope.process, nil)
CTFontManagerRegisterFontsForURL(Bundle.main.url(forResource: "Merriweather-Regular", withExtension: "ttf")! as CFURL, CTFontManagerScope.process, nil)

struct OlympusView:View  {
    @State private var girlImage: String = "Girl5No.png";
    @State private var ZeusImage: String = "ZeusWithoutCondoms.png";
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack() {
                Image(uiImage: UIImage(named: "Olympus.png")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width:828/3)
                
                Text ("FLASHFORWARD")
                    .offset(x: 5, y: 240)
                    .font(Font.custom("Merriweather-Bold", size: 18, relativeTo: .body))
                
                Text ("Zeus approaches a girl, showing her he has condoms, and she happily smiles.")
                    .offset(x: 5, y: -200)
                    .font(.custom("Merriweather-Regular", size: 18, relativeTo: .body))
                
                Image(uiImage: UIImage(named: girlImage)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 125, height: 125, alignment: .bottom)
                    .offset(x: -70, y: 0)
                    
                Image(uiImage: UIImage(named: ZeusImage)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 125, height: 125, alignment: .bottom)
                    .offset(x: 70, y: 0)

            }
            
        }
        
        .frame(width: 828/3, height: 1792/3)
        .onTapGesture {
            girlImage = "girlSaysYes.png"
            ZeusImage = "ZeusAndCondoms.png"
            SoundManager.instance.playSound(soundName: "Cartoon-woohoo")
        }
    }
}


PlaygroundPage.current.setLiveView(OlympusView())

//: [Next](@next)
