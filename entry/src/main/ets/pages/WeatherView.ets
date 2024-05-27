import Constants from '../common/Constants'

@Entry
@Component
struct WeatherView {
  @State currentTemperature: string = '26'
  @State highestInNext24Hours: string = '27'
  @State lowestInNext24Hours: string = '18'
  @State feelsLike: string = '26'
  @State weatherDescription: string = '多云'

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
          Text(this.currentTemperature + Constants.DEGREE)
            .fontSize($r('app.float.logo_size_m'))
            .fontColor(Color.White)
          Image($r('app.media.app_icon'))
            .height($r('app.float.image_size_m'))
        }

        Row() {
          Text($r('app.string.next_twenty_four_hours'))
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
          Text(Constants.COLON + Constants.SPACE + this.highestInNext24Hours + Constants.DEGREE + Constants.SLASH + this.lowestInNext24Hours + Constants.DEGREE)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
        }
        .opacity($r('app.float.opacity_seventy'))
      }
      .alignItems(HorizontalAlign.Start)

      Column({space: Constants.SPACING_SMALL}) {
        Blank()
        Text(this.weatherDescription)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
        Row() {
          Text($r('app.string.feels_like'))
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
          Text(Constants.COLON + Constants.SPACE + this.feelsLike + Constants.DEGREE)
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