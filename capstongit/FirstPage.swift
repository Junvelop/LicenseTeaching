import SwiftUI

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

