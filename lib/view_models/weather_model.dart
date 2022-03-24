class WeatherModel {
  Map<String, String> getWeatherIcon(int condition) {
    if (condition < 300) {
      return {'icon': '⛈', 'condition': 'Thunderstorm'};
    } else if (condition < 500) {
      return {'icon': '🌧', 'condition': 'Light Rain'};
    } else if (condition < 600) {
      return {'icon': '☔', 'condition': 'Rainy'};
    } else if (condition < 700) {
      return {'icon': '❄', 'condition': 'Snowy'};
    } else if (condition < 800) {
      return {'icon': '🌪', 'condition': 'Foggy'};
    } else if (condition == 800) {
      return {'icon': '☀', 'condition': 'Clear Skies'};
    } else if (condition <= 804) {
      return {'icon': '☁', 'condition': 'Cloudy'};
    } else {
      return {'icon': '🤷', 'condition': 'Atmosphere'};
    }
  }
}
