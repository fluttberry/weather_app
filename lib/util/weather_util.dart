class WeatherUtil {
  static kelvinToCelsius(num kelvin) {
    return (kelvin - 273.15).toStringAsFixed(0);
  }

  static String getWeatherIcon(num kelvin) {
    if (kelvin < 300) {
      return ' ๐ง';
    } else if (kelvin < 400) {
      return 'โ๏ธ';
    } else if (kelvin < 600) {
      return 'โ๏ธ';
    } else if (kelvin < 700) {
      return 'โ๏ธ';
    } else if (kelvin < 800) {
      return '๐ซ';
    } else if (kelvin == 800) {
      return 'โ๏ธs';
    } else if (kelvin <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  static String getDescription(num temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
