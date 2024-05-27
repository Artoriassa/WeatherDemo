@Entry
@Component
struct Index {
  build() {
    Column() {
      this.currentWeatherView()
      this.futureWeatherView()
    }
    .width('100%')
    .backgroundColor(Color.Black)
    .height('100%')
  }

  @Builder currentWeatherView() {
    Row() {
      Column() {
        Row() {
          Text('温度')
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
          Image($r('app.media.app_icon'))
            .height(40)
        }
        Text('未来24小时: ' + '最高' + '/' + '最低')
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
      }
      Column() {
        Text('气候')
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
        Text('体感温度: ' + '温度')
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
      }
    }
    .alignItems(VerticalAlign.Top)
    .height('25%')
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder futureWeatherView() {
    Column() {
      Text('3小时天气预报')
        .fontColor(Color.White)
      List()
    }
    .width('100%')
    .margin({ left: 8, right: 8 })
    .alignItems(HorizontalAlign.Start)
  }
}