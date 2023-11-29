extension WeatherCode on int {
  String  toCondition() {
    switch (this) {
      case 0:
        return 'Clear';
      case 1:
      case 2:
      case 3:
      case 45:
      case 48:
        return 'Cloudy';
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
      case 95:
      case 96:
      case 99:
        return 'Rainy';
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return 'Snowy';
      default:
        return 'Unknown';
    }
  }
}

extension WeatherIcon on String{
  String toEmoji() {
    switch (this) {
      case 'Clear':
        return '☀️';
      case 'Rainy':
        return '🌧️';
      case 'Cloudy':
        return '☁️';
      case 'Snowy':
        return '🌨️';
      case 'Unknown':
        return '❓';
      default : return '❓';
    }
  }
}
