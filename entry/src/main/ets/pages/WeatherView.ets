import Constants from '../common/Constants'
import Weather from '../model/Weather'
import WeatherInShort from '../model/WeatherInShort'
import WeatherDataModel from '../viewModel/WeatherDataModel'

@Entry
@Component
struct WeatherView {
  @State weather: Weather = new Weather('26', '18', '27', '26', '多云')
  @State futureWeathers: WeatherInShort[] = [
    new WeatherInShort('26', '17:00', 'cloud'),
    new WeatherInShort('25', '20:00', 'cloud'),
    new WeatherInShort('23', '23:00', 'cloud'),
    new WeatherInShort('19', '02:00', 'cloud'),
    new WeatherInShort('18', '05:00', 'cloud'),
    new WeatherInShort('20', '08:00', 'cloud'),
    new WeatherInShort('25', '11:00', 'cloud'),
    new WeatherInShort('27', '14:00', 'cloud')
  ]

  // aboutToAppear() {
  //   WeatherDataModel.getRealtimeWeather().then((data) => {
  //     console.info('-+12+-'+JSON.stringify(data))
  //   })
  // }

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
    Stack() {
      Image($r('app.media.thundering'))
      Row() {
        Column({ space: Constants.SPACING_EXTRA_SMALL }) {
          Row({ space: Constants.SPACING_MEDIUM }) {
            Text(this.weather.temp + Constants.DEGREE)
              .fontSize($r('app.float.logo_size_m'))
              .fontColor(Color.White)
            Text('🌩️')
              .fontSize($r('app.float.font_size_xl'))
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

        Column({ space: Constants.SPACING_SMALL }) {
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
      .padding({ top: $r('app.float.margin_xl'), left: $r('app.float.margin_m'), right: $r('app.float.margin_m') })
      .alignItems(VerticalAlign.Top)
      .width(Constants.FULL_LENGTH)
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .alignContent(Alignment.Top)
    .height(Constants.QUARTER_LENGTH)
  }

  @Builder futureWeatherView() {
    Column() {
      Text($r('app.string.three_hour_weather_forecast'))
        .opacity($r('app.float.opacity_seventy'))
        .fontColor(Color.White)
      List({ space: Constants.SPACING_SMALL }) {
        ForEach(this.futureWeathers, (weather: WeatherInShort) => {
          ListItem() {
            this.miniWeatherView(weather)
          }
        })
      }
      .backgroundColor(Color.Gray)
      .listDirection(Axis.Horizontal)
      .height(Constants.ONE_EIGHTH_LENGTH)
      .width(Constants.FULL_LENGTH)
      .alignListItem(ListItemAlign.Center)
      .scrollBar(BarState.Auto)
    }
    .width(Constants.FULL_LENGTH)
    .padding($r('app.float.margin_m'))
    .alignItems(HorizontalAlign.Start)
  }

  @Builder miniWeatherView(weather: WeatherInShort) {
    Column() {
      Text(weather.temp + Constants.DEGREE)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
      Text('☁️')
      Text(weather.time)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
    }
  }
}