//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by 이범석 on 7/17/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack{
                CityTextView(cityName: "서울시 동작구")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "sun.max.fill",
                                      temperature: 31)
                
                HStack(spacing: 20) {
                    WeatherDayView(day: "화요일", icon: "sun.max.fill", temperature: "26°C")
                    WeatherDayView(day: "수요일", icon: "cloud.bolt.fill", temperature: "26°C")
                    WeatherDayView(day: "목요일", icon: "cloud.heavyrain.fill", temperature: "26°C")
                    WeatherDayView(day: "금요일", icon: "cloud.heavyrain.fill", temperature: "26°C")
                    WeatherDayView(day: "토요일", icon: "cloud.heavyrain.fill", temperature: "26°C")
                }
                
                Spacer()
                Button {
                    withAnimation(.easeInOut(duration: 0.25)){
                        isNight.toggle()
                    }
                } label: {
                    WeatherButton(title: "Change Time of Day",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var day: String
    var icon:String
    var temperature: String
    
    var body: some View {
        VStack {
            Text(day)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundStyle(.white)
            Image(systemName: icon)
            // .symbolRenderingMode(.hierarchical)
                .symbolRenderingMode(.multicolor)
                .resizable()
            // .foregroundColor(.red)
                .aspectRatio(contentMode: .fit)
                .frame(width: 30 , height: 30)
            Text(temperature)
                .font(.system(size: 25, weight: .bold))
                .foregroundStyle(.white)
        }
    }
}

// 백그라운드
struct BackgroundView: View {
    
    var isNight: Bool
    
    // var topColor: Color
    // var bottomColor: Color
    
    var body: some View {
        //        LinearGradient(gradient: Gradient(colors:[isNight ? .black : .blue,
        //                                                  isNight ? .gray  : Color("LightBlue")]),
        //                       startPoint: .topLeading,
        //                       endPoint: .bottomTrailing)
        //        .edgesIgnoringSafeArea(.all)
        ContainerRelativeShape()
                .fill(isNight ? Color.black.gradient : Color.blue.gradient)
                .ignoresSafeArea(.all)
    }
}

//
struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            Text("\(temperature)°C")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}

