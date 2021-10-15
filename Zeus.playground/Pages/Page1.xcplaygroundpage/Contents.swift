import SwiftUI
import PlaygroundSupport

CTFontManagerRegisterFontsForURL(Bundle.main.url(forResource: "Merriweather-Regular", withExtension: "ttf")! as CFURL, CTFontManagerScope.process, nil)
CTFontManagerRegisterFontsForURL(Bundle.main.url(forResource: "Merriweather-Bold", withExtension: "ttf")! as CFURL, CTFontManagerScope.process, nil)

struct Page1: View {
    
    @State private var zeusOffset: CGFloat = -300
    @State private var zeusOpacity: CGFloat = 0
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                Image(uiImage: UIImage(named: "cafe")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 828/3)
                Image(uiImage: UIImage(named: "zeus_2")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 828/3)
                    .offset(y: zeusOffset)
                    .opacity(zeusOpacity)
                    .animation(.easeInOut(duration: 1), value: zeusOpacity)
                Image(uiImage: UIImage(named: "coffeecup")!)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(0.2)
                    .offset(x: 50, y: -20)
                Text("Once upon a time, Zeus was sitting in a coffee shop thinking about difficulties that have been raised in his life.")
                    .foregroundColor(.white)
                    .font(.custom("Merriweather-Bold", size: 21))
                    .offset(y: -20)
                    .padding()
                    .opacity(zeusOpacity)
                    .animation(.easeInOut(duration: 1.5), value: zeusOffset)
            }
        }
        .frame(width: 828/3, height: 1792/3)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                zeusOffset = -230
                zeusOpacity = 1
            }
        }
    }
}

PlaygroundPage.current.setLiveView(Page1())

//: [Next](@next)
