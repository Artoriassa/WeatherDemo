import Weather from '../model/Weather';
import NetWorkManager from '../NetWork/NetWorkManager'

export class WeatherDataModel {

  getRealtimeWeather(): Promise<Weather> {
    return new Promise(async (resolve: Function, reject: Function) => {
      let url = 'https://api.openweathermap.org/data/2.5/weather?units=metric&lang=zh_cn&appid=7ce48fbdedcc72653e589f93b4da7ee4&q=Chengdu,%20CN'
      NetWorkManager.httpRequestGet(url).then((data) => {
        if (data.code === 'success') {
          resolve(data.data);
        } else {
          console.error(JSON.stringify(data))
          reject('Network request failed, please try later!');
        }
      }).catch((err: Error) => {
        console.error(JSON.stringify(err))
        reject('Network request failed, please try later!');
      });
    });
  }
}

export default new WeatherDataModel();
