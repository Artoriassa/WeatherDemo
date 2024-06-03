import http from '@ohos.net.http'

export class NetWorkManager {

  httpRequestGet(url: string): Promise<ResponseResult> {
    let httpRequest = http.createHttp()
    let responseResult = httpRequest.request(
      url,
      {
        method: http.RequestMethod.GET,
        header: {
          'Content-Type': 'application/json'
        }
      }
    )
    let serverData: ResponseResult = new ResponseResult();
    return responseResult.then((value: http.HttpResponse) => {
      if (value.responseCode === http.ResponseCode.OK) {
        let result = `${value.result}`
        let resultJson: ResponseResult = JSON.parse(result)
        if (resultJson.code === 'success') {
          serverData.data = resultJson.data
        }
        serverData.code = resultJson.code
        serverData.msg = resultJson.msg
      } else {
        serverData.msg = `${'Network request failed, please try later!'}&${value.responseCode}`
      }
      return serverData
    }).catch(() => {
      serverData.msg = 'Network request failed, please try later!'
      return serverData
    })
  }
}

export class ResponseResult {
  code: string
  msg: string | Resource
  data: string | Object | ArrayBuffer

  constructor() {
    this.code = ''
    this.msg = ''
    this.data = ''
  }
}

export default new NetWorkManager();
