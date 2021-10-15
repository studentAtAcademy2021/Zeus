import SwiftUI
import PlaygroundSupport

CTFontManagerRegisterFontsForURL(Bundle.main.url(forResource: "Merriweather-Regular", withExtension: "ttf")! as CFURL, CTFontManagerScope.process, nil)
CTFontManagerRegisterFontsForURL(Bundle.main.url(forResource: "Merriweather-Bold", withExtension: "ttf")! as CFURL, CTFontManagerScope.process, nil)


struct Page0: View {
    
    @State private var scale: CGFloat = 1
    @State private var opacity: CGFloat = 1
    @State private var textHeight: CGFloat = 120
    @State private var zeusOffset: CGFloat = 0
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                Image(uiImage: UIImage(named: "park")!)
                    .resizable()
                    .scaledToFit()
                Text("Zeus goes for")
                    .position(x: 828/6, y: textHeight)
                    .font(.custom("Merriweather-Regular", size: 32))
                    .animation(.easeOut(duration: 1.2), value: textHeight)
                Text("safe sex")
                    .position(x: 828/6, y: textHeight+40)
                    .font(.custom("Merriweather-Bold", size: 50))
                    .animation(.easeOut(duration: 1.2), value: textHeight)
                Image(uiImage: UIImage(named: "zeus_1")!)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(scale)
                    .opacity(opacity)
                    .offset(x: zeusOffset)
                    .animation(.easeOut(duration: 1.5), value: scale)
            }
        }
        .frame(width: 828/3, height: 1792/3)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                scale = 7
                opacity = 0
                textHeight = 280
                zeusOffset = -100
            }
        }
    }
}

PlaygroundPage.current.setLiveView(Page0())


