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
    
    @State private var rotation: CGFloat = 0
    
    var shakeAnimation: Animation {
        Animation
            .easeInOut(duration: 0.1)
            .repeatForever()
    }
    
//    @State var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        
        GeometryReader {geo in
            ZStack {
                Image(uiImage: UIImage(named: "cafe_empty.png")!)
                    .resizable()
                    .scaledToFit()
                    .offset(x: -120, y: -180)
                
                Image(uiImage: UIImage(named: "Table.png")!)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(1.1)
                    
                Image(uiImage: UIImage(named: "Phone1.png")!)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(0.4)
                    .offset(x: -95, y: -120)
                    .rotationEffect(.degrees(rotation))
                    .onAppear() {
                        withAnimation(shakeAnimation) {
                            rotation = 2
                        }
                    }
           
                Image(uiImage: UIImage(named: "Vibrazione.png")!)
                    .rotationEffect(.degrees(-210))
                    .scaleEffect(0.25)
                    .offset(x: -140, y: -100)
                
                Image(uiImage: UIImage(named: "Vibrazione.png")!)
                    .scaleEffect(0.25)
                    .rotationEffect(.degrees(-30))
                    .offset(x: -39, y: -140)
                
                Text("Suddenly his recollections are interrupted: a phone notification catches his attention...")
                    .position(x: geo.size.width / 2, y: geo.size.height / 2)
                    .offset(x: -115, y: 200)
                    .frame(width: 828/3)
                    .font(.custom("Merriweather-Bold", size: 22))
                    .foregroundColor(.white)
                    
            }
            
        }
        
        .frame(width: 828/3, height: 1792/3)
        .background(Color(red: 200 / 255, green: 200 / 255, blue: 200 / 255))
        .ignoresSafeArea(.all)
        .onAppear {
            SoundManager.instance.playSound(soundName: "Cvib")
            SoundManager.instance.playSound(soundName: "Cnot")
        }

    }
}

PlaygroundPage.current.setLiveView(ContentView())
