import SwiftUI

struct WeatherView: View {
    var weather: WeatherResponse

    var body: some View {
        VStack(spacing: 20) {
            Text("\(weather.weather.first?.description ?? "No description")")
                .font(.title)
                .fontWeight(.medium)

            HStack(spacing: 10) {
                Image(systemName: "thermometer")
                    .font(.title2)
                Text("\(weather.main.temp, specifier: "%.1f")°C")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
            }

            HStack(spacing: 10) {
                Image(systemName: "wind")
                    .font(.title2)
                Text("Humidity: \(String(format: "%.2f", weather.main.humidity)) %")
                    .font(.title3)
            }

            HStack(spacing: 10) {
                Image(systemName: "drop.fill")
                    .font(.title2)
                Text("Pressure: \(String(format: "%.2f", weather.main.pressure)) hPa")
                    .font(.title3)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(UIColor.systemBackground))
                .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 10)
        )
        .padding()
    }
}
