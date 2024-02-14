class WeekEntity {
  int temperatureAvg;
  int temperatureMax;
  int temperatureMin;
  int weatherCodeMax;
  int weatherCodeMin;
  double rainIntensityAvg;

  WeekEntity({
    this.temperatureAvg = 0,
    this.temperatureMax = 0,
    this.temperatureMin = 0,
    this.weatherCodeMax = 1000,
    this.weatherCodeMin = 1000,
    this.rainIntensityAvg = 0.0,
  });
}
