export default class Weather {
  public temp: string
  public tempMin: string
  public tempMax: string
  public feelsLike: string
  public description: string

  constructor(temp: string = '', tempMin: string = '', tempMax: string = '', feelsLike: string = '', description: string = '') {
    this.temp = temp
    this.tempMin = tempMin
    this.tempMax = tempMax
    this.feelsLike = feelsLike
    this.description = description
  }
}