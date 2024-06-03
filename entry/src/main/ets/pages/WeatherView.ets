import Constants from '../common/Constants'
import Weather from '../model/Weather'
import WeatherDataModel from '../viewModel/WeatherDataModel'

@Entry
@Component
struct WeatherView {
  @State weather: Weather = new Weather('26', '18', '27', '26', '多云')

  aboutToAppear() {
    WeatherDataModel.getRealtimeWeather().then((data) => {
      console.info('-+12+-'+JSON.stringify(data))
    })
  }
  build() {
    Column() {
      this.currentWeatherView()
      this.futureWeatherView()
    }
    .width(Constants.FULL_LENGTH)
    .backgroundColor(Color.Black)
    .height(Constants.FULL_LENGTH)
  }

  @Builder currentWeatherView() {
    Row() {
      Column({space: Constants.SPACING_EXTRA_SMALL}) {
        Row({space: Constants.SPACING_MEDIUM}) {
          Text(this.weather.temp + Constants.DEGREE)
            .fontSize($r('app.float.logo_size_m'))
            .fontColor(Color.White)
          Image($r('app.media.app_icon'))
            .height($r('app.float.image_size_m'))
        }

        Row() {
          Text($r('app.string.next_twenty_four_hours'))
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
          Text(Constants.COLON + Constants.SPACE + this.weather.tempMax + Constants.DEGREE + Constants.SLASH + this.weather.tempMin + Constants.DEGREE)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
        }
        .opacity($r('app.float.opacity_seventy'))
      }
      .alignItems(HorizontalAlign.Start)

      Column({space: Constants.SPACING_SMALL}) {
        Blank()
        Text(this.weather.description)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
        Row() {
          Text($r('app.string.feels_like'))
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
          Text(Constants.COLON + Constants.SPACE + this.weather.feelsLike + Constants.DEGREE)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
        }
      }
      .opacity($r('app.float.opacity_seventy'))
    }
    .padding({top: $r('app.float.margin_xl'), left: $r('app.float.margin_m'), right: $r('app.float.margin_m')})
    .alignItems(VerticalAlign.Top)
    .height(Constants.QUARTER_LENGTH)
    .width(Constants.FULL_LENGTH)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder futureWeatherView() {
    Column() {
      Text($r('app.string.three_hour_weather_forecast'))
        .opacity($r('app.float.opacity_seventy'))
        .fontColor(Color.White)
      List()
    }
    .width(Constants.FULL_LENGTH)
    .padding({ left: $r('app.float.margin_s'), right: $r('app.float.margin_s') })
    .alignItems(HorizontalAlign.Start)
  }
}