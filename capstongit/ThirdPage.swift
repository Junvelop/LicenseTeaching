//
//  ThirdPage.swift
//  capstongit
//
//  Created by 박현준 on 5/21/24.
//

import SwiftUI

struct ThirdPage: View {
    @Binding var currentPage: Int
    
    var body: some View {
        VStack {
            Text("This is the Third Page")
                .font(.largeTitle)
            
            Spacer()
            
            Image("superproductivity") // 이미지 삽입
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200) // 원하는 크기로 조정
            
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

