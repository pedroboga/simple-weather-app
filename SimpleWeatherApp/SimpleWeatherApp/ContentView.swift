//
//  ContentView.swift
//  SimpleWeatherApp
//
//  Created by Pedro Boga on 21/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            VStack {
                CityTextView(cityName: "Curitiba, BR")
                WeatherMainInfoView(imageName: "cloud.sun.fill", temperature: 14)
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.rain.fill", temperature: 12)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 14)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 19)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "tornado", temperature: 22)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sunset.fill", temperature: 19)
                }
                Spacer()
                Button {
                    print("tapped")
                } label: {
                    WeatherButton(title: "ChangeDayTime", textColor: .blue, backgroundColor: .white)
                }
                Spacer()

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .top,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherMainInfoView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
