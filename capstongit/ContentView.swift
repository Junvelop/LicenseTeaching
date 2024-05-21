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
        return imageView
    }

    func updateNSView(_ nsView: NSImageView, context: Context) {
        // 업데이트 로직은 여기서 처리합니다.
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

struct FirstPage: View {
    @Binding var currentPage: Int
    @State private var selectedTopic: String = ""
    
    var body: some View {
        VStack {
            Text("분야를 선택하세요. 필드에 없다면 검색하세요.")
                .font(.largeTitle)
                .padding(40)
            
            HStack {
                TextField("Enter your interest", text: $selectedTopic)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    // 검색 동작 구현
                }) {
                    Image(systemName: "magnifyingglass")
                        .padding(8)
                        .foregroundColor(.blue)
                }
                .background(Color.white)
                .clipShape(Circle())
                .padding(.trailing, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 1)
                )
            }
            .padding(.horizontal)
            
            VStack(spacing: 20) {
                Button(action: {
                    self.currentPage = 2
                }) {
                    Text("🏀 Sports")
                        .padding(10)
                        .font(.body)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    self.currentPage = 3
                }) {
                    Text("📅 Productivity")
                        .padding(10)
                        .font(.body)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    self.currentPage = 4
                }) {
                    Text("🎮 Game")
                        .padding(10)
                        .font(.body)
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(8)
                }
            }
        }
        .navigationTitle("First Page")
    }
}

struct SecondPage: View {
    @Binding var currentPage: Int
    
    var body: some View {
        VStack {
            Text("This is the Second Page")
                .font(.largeTitle)
            Spacer()
            Button(action: {
                self.currentPage = 1
            }) {
                Text("Go back to First Page")
                    .padding(10)
                    .font(.body)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.bottom, 20)
        }
        .navigationTitle("Second Page")
    }
}

struct ThirdPage: View {
    @Binding var currentPage: Int
    
    var body: some View {
        VStack {
            Text("This is the Third Page")
                .font(.largeTitle)
            Spacer()
            Button(action: {
                self.currentPage = 1
            }) {
                Text("Go back to First Page")
                    .padding(10)
                    .font(.body)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(8)
            }
            .padding(.bottom, 20)
        }
        .navigationTitle("Third Page")
    }
}

struct FourthPage: View {
    @Binding var currentPage: Int
    
    var body: some View {
        VStack {
            HStack { // 이미지와 텍스트를 수평으로 나열하는 HStack
                Image("gungame")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100) // 이미지 크기 조정
                    .onTapGesture {
                        self.currentPage = 5 // 뉴 페이지로 전환하는 코드
                    }
                
                Text("Cdog - SDL")
                    .font(.largeTitle)
                    .padding()
            }
            
            HStack { // 이미지와 텍스트를 수평으로 나열하는 HStack
                Image("snk")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 350) // 이미지 크기 조정
                    .onTapGesture {
                        self.currentPage = 6 // 뉴 페이지로 전환
                    }
                
                Text("Snake")
                    .font(.largeTitle)
                    .padding()
            }
            
            
            .padding() // HStack에 패딩 추가
            
            Spacer()
            
            Button(action: {
                self.currentPage = 1
            }) {
                Text("Go back to First Page")
                    .padding(10)
                    .font(.body)
                    .foregroundColor(.white)
                    .background(Color.orange)
                    .cornerRadius(8)
            }
            .padding(.bottom, 20)
        }
        .navigationTitle("Fourth Page")
    }
}


struct FifthPage: View {
    @Binding var currentPage: Int
    
    var body: some View {
        VStack {
            Text("Cdog - SDL")
                .font(.largeTitle)
                .padding()

            Spacer()
            
            GeometryReader { geometry in
                HStack(spacing: 20) { // 이미지와 텍스트를 수평으로 나열하는 HStack
                    GIFImageView(gifName: "automelee")
                        .frame(width: geometry.size.width / 2, height: geometry.size.height / 2) // 화면의 절반 크기로 설정
                        .padding(.leading, 10) // 왼쪽 패딩 추가

                    VStack(alignment: .leading, spacing: 10) { // 텍스트를 위로 정렬하고 간격을 조절하는 VStack
                        Text("""
                        C-Dogs SDL 프로젝트는 고전적인 탑다운 슈팅 게임으로, 최대 4명의 플레이어가 협동 및 대전 모드로 즐길 수 있습니다. 플레이어 커스터마이징, 다양한 무기, 100개 이상의 사용자 제작 캠페인을 특징으로 합니다. 이 게임은 원작 C-Dogs의 향상된 포트로, 개선된 그래픽, 멀티플레이어 지원, AI, 모드 가능성, 새로운 캠페인을 제공합니다.

                        이 프로젝트의 코드는 GPL-2.0 라이선스 및 BSD 2조항 라이선스 하에 제공되며, 에셋은 CC0, CC-BY, CC-BY-SA 등의 다양한 라이선스 조건을 따릅니다.
                        """)
                        .font(.system(size: 14)) // 텍스트 폰트 크기 설정
                        .padding()
                    }
                    .frame(maxWidth: .infinity) // 텍스트가 가능한 최대 너비를 가지도록 함
                }
            }

            Spacer()
            
            Button(action: {
                self.currentPage = 4
            }) {
                Text("Go back to Fourth Page")
                    .padding(10)
                    .font(.body)
                    .foregroundColor(.white)
                    .background(Color.purple)
                    .cornerRadius(8)
            }
            .padding(.bottom, 20)
        }
        .navigationTitle("Fifth Page")
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct SixPage: View {
    @Binding var currentPage: Int
    
    var body: some View {
        VStack {
            Text("Snake")
                .font(.largeTitle)
                .padding()
            
            Spacer()
            
            GeometryReader { geometry in
                HStack(spacing: 20) { // 이미지와 텍스트를 수평으로 나열하는 HStack
                    GIFImageView(gifName: "Gnake")
                    //  .frame(width: geometry.size.width / 200, height: geometry.size.height) // 이미지의 크기를 조절하여 화면의 1/200을 차지하도록 함
                    //   .aspectRatio(contentMode: .fit) // 이미지가 잘리지 않고 비율 유지
                    
                    VStack(alignment: .leading, spacing: 10) { // 텍스트를 위로 정렬하고 간격을 조절하는 VStack
                        Text("""
                        C-Dogs SDL 프로젝트는 고전적인 탑다운 슈팅 게임으로, 최대 4명의 플레이어가 협동 및 대전 모드로 즐길 수 있습니다. 플레이어 커스터마이징, 다양한 무기, 100개 이상의 사용자 제작 캠페인을 특징으로 합니다. 이 게임은 원작 C-Dogs의 향상된 포트로, 개선된 그래픽, 멀티플레이어 지원, AI, 모드 가능성, 새로운 캠페인을 제공합니다.
                        
                        이 프로젝트의 코드는 GPL-2.0 라이선스 및 BSD 2조항 라이선스 하에 제공되며, 에셋은 CC0, CC-BY, CC-BY-SA 등의 다양한 라이선스 조건을 따릅니다.
                        """)
                        .font(.system(size: 14)) // 텍스트 폰트 크기 설정
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading) // 텍스트가 가능한 최대 너비를 가지도록 하고, 좌측 정렬
                    }
                    .frame(maxWidth: .infinity) // 텍스트가 가능한 최대 너비를 가지도록 함
                }
            }
            
            Spacer()
            
            Button(action: {
                self.currentPage = 4
            }) {
                Text("Go back to Fourth Page")
                    .padding(10)
                    .font(.body)
                    .foregroundColor(.white)
                    .background(Color.purple)
                    .cornerRadius(8)
            }
            .padding(.bottom, 20)
        }
        .navigationTitle("Six Page")
    }
    
}


