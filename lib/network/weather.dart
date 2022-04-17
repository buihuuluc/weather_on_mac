class Weather{
  dynamic name;
  dynamic region;
  dynamic country;
  dynamic zone;
  dynamic localtime;
  dynamic temp;
  dynamic textcondition;
  dynamic iconcondition;
  dynamic windkph;
  dynamic winddegree;
  dynamic humidity;
  dynamic cloud;
  dynamic feellike;
  dynamic viskm;
  dynamic uv;
  dynamic gustkph;
  dynamic co;
  dynamic no2;
  dynamic o3;
  dynamic so2;
  dynamic pm2_5;
  dynamic pm10;


  Weather({
    this.name, this.region, this.country, this.zone, this.localtime, this.temp,
    this.textcondition, this.iconcondition, this.windkph, this.winddegree,
    this.humidity, this.cloud, this.feellike, this.viskm, this.uv, this.gustkph,
    this.co, this.no2, this.o3, this.so2, this.pm2_5, this.pm10,
  });

  Weather.fromJson(Map<String, dynamic>json){
    name = json["location"]["name"];
    region = json["location"]["region"];
    country = json["location"]["country"];
    zone = json["location"]["tz_id"];
    localtime = json["location"]["localtime"];
    temp = json["current"]["temp_c"];
    textcondition = json["current"]["condition"]["text"];
    iconcondition = json["current"]["condition"]["icon"];
    windkph = json["current"]["wind_kph"];
    winddegree = json["current"]["wind_degree"];
    humidity = json["current"]["humidity"];
    cloud = json["current"]["cloud"];
    feellike = json["current"]["feelslike_c"];
    viskm = json["current"]["vis_km"];
    uv = json["current"]["uv"];
    gustkph = json["current"]["gus_kph"];
    co = json["current"]["air_quality"]["co"];
    no2 = json["current"]["air_quality"]["no2"];
    o3 = json["current"]["air_quality"]["o3"];
    so2 = json["current"]["air_quality"]["so2"];
    pm2_5 = json["current"]["air_quality"]["pm2_5"];
    pm10 = json["current"]["air_quality"]["pm10"];
  }
}