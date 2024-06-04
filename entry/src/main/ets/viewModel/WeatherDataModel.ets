import Weather from '../model/Weather';
import NetWorkManager from '../NetWork/NetWorkManager'

export class WeatherDataModel {

  getRealtimeWeather(): Promise<Weather> {
    return new Promise(async (resolve: Function, reject: Function) => {
      let url = ''
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
