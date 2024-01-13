abstract class WeatherState{}
class WeatherInitialState extends WeatherState{}
class WeatherLoadingState extends WeatherState{}
class WeatherSuccessState extends WeatherState{

}
class WeatherErrorState extends WeatherState{
  final String error;
  WeatherErrorState(this.error);
}
