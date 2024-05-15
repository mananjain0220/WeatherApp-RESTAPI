import SwiftUI

struct ContentView: View {
    @State private var cityName: String = ""
    @State private var weather: WeatherResponse?
    @State private var showingAlert = false
    @State private var alertMessage = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("Search Weather")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)

                TextField("Enter City Name", text: $cityName)
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .shadow(radius: 2)

                Button(action: getWeather) {
                    Text("Get Weather")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(10)
                        .shadow(radius: 3)
                }
                .padding(.horizontal)
                .padding(.top, 20)

                Spacer()

                if let weather = weather {
                    WeatherView(weather: weather)
                        .transition(.slide)
                        .animation(.easeInOut)
                }

                Spacer()
            }
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
            )
            .navigationTitle("APP WITH REST USE")
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    func getWeather() {
        let weatherManager = WeatherManager()
        weatherManager.fetchWeather(cityName: cityName) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weatherResponse):
                    self.weather = weatherResponse
                case .failure(let error):
                    self.alertMessage = error.localizedDescription
                    self.showingAlert = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

