import SwiftUI
import AppKit


struct GIFImageView: NSViewRepresentable {
    let gifName: String

    func makeNSView(context: Context) -> NSImageView {
        let imageView = NSImageView()
        imageView.imageScaling = .scaleProportionallyUpOrDown
        return imageView
    }

    func updateNSView(_ nsView: NSImageView, context: Context) {
        if let gifUrl = Bundle.main.url(forResource: gifName, withExtension: "gif"),
           let gifImage = NSImage(contentsOf: gifUrl) {
            nsView.image = gifImage
            // 이미지의 크기를 조절하여 화면의 1/200을 차지하도록 함
            nsView.frame = CGRect(x: 0, y: 0, width: gifImage.size.width / 200, height: gifImage.size.height / 200)
        }
    }
}

struct ContentView: View {
    @State private var currentPage = 1
    
    var body: some View {
        VStack {
            if currentPage == 1 {
                FirstPage(currentPage: $currentPage)
            } else if currentPage == 2 {
                SecondPage(currentPage: $currentPage)
            } else if currentPage == 3 {
                ThirdPage(currentPage: $currentPage)
            } else if currentPage == 4 {
                FourthPage(currentPage: $currentPage)
            } else if currentPage == 5 {
                FifthPage(currentPage: $currentPage)
            } else  {
                
                SixPage(currentPage: $currentPage)
            
            }
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




