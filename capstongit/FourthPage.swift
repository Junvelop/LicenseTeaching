//
//  FourthPage.swift
//  capstongit
//
//  Created by 박현준 on 5/21/24.
//

import SwiftUI

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
                        self.currentPage = 1 // 뉴 페이지로 전환
                    }
                
                Text("Snake")
                    .font(.largeTitle)
                    .padding()
            }
            
            
            .padding() // HStack에 패딩 추가
            
            Spacer()
            
            Button(action: {
                self.currentPage = 6
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
