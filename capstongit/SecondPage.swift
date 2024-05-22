import SwiftUI

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

