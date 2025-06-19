//
//  HomeView.swift
//  Netflix
//
//  Created by 이범석 on 6/18/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var bigBanner: String = ""
    @State var dramas: [Drama] = []
    
    var body: some View {
        
        ScrollView {
            
            HStack {
                
                Image("logo")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                Spacer()
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding()
            }
            
            AsyncImage(url: URL(string: bigBanner)) { image in
                image
                    .resizable()
                    .cornerRadius(20)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 525)
            } placeholder: {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray)
                    .frame(width: 300, height: 525)
                    .opacity(0.4)
                    .overlay(
                        ProgressView()
                            .opacity(0.7)
                            .tint(.white)
                    )
            }
            .overlay(alignment: .bottom) {
                HStack{
                    Button(action: {
                        print("재생")
                    }) {
                        Image(systemName: "play.fill")
                    }
                    .buttonStyle(.bordered)
                    
                    Button(action: {
                        print("인포")
                    }) {
                        Image(systemName: "info.circle")
                    }
                    .buttonStyle(.bordered)
                }
            }
            
            
            if dramas.count == 0 {
                // 버퍼링 뷰
                ProgressView()
                    .tint(Color.white)
                    .padding()
                    .task {
                        let url = URL(string: "https://gvec03gvkf.execute-api.ap-northeast-2.amazonaws.com/")
                        let (data, _) = try! await URLSession.shared.data(from: url!)
                        
                        let jsonString = String(data: data, encoding: .utf8)!
                        
                        let decoder = JSONDecoder()
                        let dramaCollection = try! decoder.decode(DramaCollection.self, from: data)
                        
                        bigBanner = dramaCollection.bigBanner
                        dramas = dramaCollection.dramas
                    }
            }
            else {
                ForEach(dramas, id: \.categoryTitle) { drama in
                    
                    VStack(alignment: .leading) {
                        Text(drama.categoryTitle)
                            .font(.title)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(drama.posters, id: \.self) { poster in
                                    let url = URL(string: poster)
                                    AsyncImage(url: url) { image in
                                        image
                                            .resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 100, height: 175)
                                    .cornerRadius(10)
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                    }
                }
                
            }
        }
        .background(Color.black)
        .foregroundStyle(.white)
    }
}

#Preview {
    HomeView()
}
