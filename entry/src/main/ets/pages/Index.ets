import Constants from '../common/Constants'

@Entry
@Component
struct Index {
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
      Column() {
        Row() {
          Text('温度')
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
          Image($r('app.media.app_icon'))
            .height($r('app.float.image_size_m'))
        }

        Row() {
          Text($r('app.string.next_twenty_four_hours'))
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
          Text(Constants.COLON + Constants.SPACE + '最高' + Constants.SLASH + '最低')
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
        }
      }

      Column() {
        Text('气候')
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
        Row() {
          Text($r('app.string.feels_like'))
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
          Text(Constants.COLON + Constants.SPACE + '温度')
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
        }
      }
    }
    .alignItems(VerticalAlign.Top)
    .height(Constants.QUARTER_LENGTH)
    .width(Constants.FULL_LENGTH)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder futureWeatherView() {
    Column() {
      Text($r('app.string.three_hour_weather_forecast'))
        .fontColor(Color.White)
      List()
    }
    .width(Constants.FULL_LENGTH)
    .padding({ left: $r('app.float.margin_s'), right: $r('app.float.margin_s') })
    .alignItems(HorizontalAlign.Start)
  }
}