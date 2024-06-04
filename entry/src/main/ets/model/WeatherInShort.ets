export default class  WeatherInShort {
  public temp: string
  public time: string
  public description: string

  constructor(temp: string = '', time: string = '', description: string = '') {
    this.temp = temp
    this.time = time
    this.description = description
  }
}