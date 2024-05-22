//
//  FifthPage.swift
//  capstongit
//
//  Created by 박현준 on 5/21/24.
//

import SwiftUI

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
