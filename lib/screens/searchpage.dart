import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/network/getdata.dart';
import 'package:weather/network/weather.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String bg = 'assets/search/searchbg.jpg';
  String name = 'London';

  _onTextFieldSubmitted(String input) {
    setState(() {
      name = input;
    });
  }

  Weather weathersDisplay = new Weather();
  GetData client = GetData();

  Future<void> getWeather() async {
    weathersDisplay = await client.getCurrentWeather(name);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onTextFieldSubmitted(name);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWeather(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            child: Stack(
              children: [
                //Background
                Image.asset(
                  bg,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                //Thanh tim kiem
                Container(
                  margin: EdgeInsets.only(top: 130, left: 10, right: 10),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(38, 38, 38, 0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: GoogleFonts.robotoSlab(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Nh???p th??nh ph??? t??m ki???m ...',
                        hintStyle: GoogleFonts.robotoSlab(
                            fontSize: 18, color: Colors.white),
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onSubmitted: (String nhap) {
                        _onTextFieldSubmitted(nhap);
                      },
                    ),
                  ),
                ),
                //Noi dung
                Container(
                  margin: EdgeInsets.only(top: 116),
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  //Hien thi Ten thanh pho, Thoi gian, Nhiet do, Daylight, Day phan cach, Rain, Wind...
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      //Ten thanh pho, thoi gian, nhiet do, Thoitiet
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Ten thanh pho, thoi gian va Nhiet Do, Thoi Tiet
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //Ten Thanh Pho
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 80,
                                    ),
                                    //Ten Thanh Pho
                                    Text(
                                      formatTenTP(weathersDisplay.name),
                                      style: GoogleFonts.beVietnam(
                                          fontSize: 34,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    //Thoi gian
                                    Text(
                                      formatTenNuoc(weathersDisplay.country),
                                      style: GoogleFonts.roboto(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                //Nhiet do va Kieu thoi tiet
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 80,
                                    ),
                                    //Nhiet do
                                    Text(
                                      weathersDisplay.temp.toString() +
                                          '\u2103',
                                      style: GoogleFonts.beVietnam(
                                          fontSize: 34,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    //Kieu thoi tiet
                                    Row(
                                      children: [
                                        Text(
                                          weathersDisplay.localtime.toString(),
                                          style: GoogleFonts.roboto(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            //3 Row show info
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  //Ki???u th???i ti???t v?? Cloud
                                  Container(
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      height: 200,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        color: Colors.black38,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Ki???u th???i ti???t',
                                                style: GoogleFonts.lato(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Container(
                                                width: 220,
                                                child: Text(
                                                  formatTiengViet(
                                                      weathersDisplay
                                                          .textcondition),
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.satisfy(
                                                      fontSize: 24,
                                                      color: Colors.white54,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                              )
                                            ],
                                          ),
                                          // SizedBox(height: 5,),
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Cloud',
                                                style: GoogleFonts.satisfy(
                                                  fontSize: 28,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                weathersDisplay.cloud
                                                    .toString(),
                                                style: GoogleFonts.satisfy(
                                                  fontSize: 40,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.fromLTRB(
                                                    0, 0, 0, 14),
                                                child: Image.network(
                                                  'https:' +
                                                      weathersDisplay
                                                          .iconcondition
                                                          .toString(),
                                                  height: 80,
                                                  width: 80,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                  //UV
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    height: 50,
                                    width: 400,
                                    decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              40, 0, 0, 0),
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Ultra Violet',
                                                  style: GoogleFonts.satisfy(
                                                      fontSize: 22,
                                                      color: Colors.white,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          weathersDisplay.uv.toString(),
                                          style: GoogleFonts.satisfy(
                                            fontSize: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 40, 0),
                                          child: Image.asset(
                                            'assets/icon/uv.png',
                                            height: 64,
                                            width: 64,
                                            color: Colors.yellowAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //Feel like
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    height: 60,
                                    width: 400,
                                    decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              40, 0, 0, 0),
                                          child: Container(
                                            child: Text(
                                              'Feels like',
                                              style: GoogleFonts.satisfy(
                                                  fontSize: 24,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          weathersDisplay.feellike.toString() +
                                              '\u2103',
                                          style: GoogleFonts.satisfy(
                                            fontSize: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 40, 0),
                                          child: Image.asset(
                                            'assets/icon/feelslike.png',
                                            height: 46,
                                            width: 46,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Day phan cach va Wind, W-Degree, Dum
                      Column(
                        children: [
                          //Lan phan cach
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white54),
                            ),
                          ),
                          //Wind, W-Degree, Humidity
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //Wind
                                  Column(
                                    children: [
                                      Text('Wind',
                                          style: GoogleFonts.beVietnam(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white)),
                                      Text(weathersDisplay.windkph.toString(),
                                          style: GoogleFonts.beVietnam(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text('km/h',
                                          style: GoogleFonts.beVietnam(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white)),
                                      Stack(
                                        children: [
                                          Container(
                                            width: 60,
                                            height: 5,
                                            color: Colors.grey,
                                          ),
                                          Container(
                                            width: weathersDisplay.windkph.toDouble(),
                                            height: 5,
                                            color: Colors.blueAccent,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  //W-Degree
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('W-Degree',
                                          style: GoogleFonts.beVietnam(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white)),
                                      Text(weathersDisplay.winddegree.toString() + '??',
                                          style: GoogleFonts.beVietnam(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(height: 20,),
                                      Stack(
                                        children: [
                                          Container(width: 60,height: 5,color: Colors.transparent,)
                                        ],
                                      )

                                    ],
                                  ),
                                  //Humidity
                                  Column(
                                    children: [
                                      Text('Humidity',
                                          style: GoogleFonts.beVietnam(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white)),
                                      Text(weathersDisplay.humidity.toString(),
                                          style: GoogleFonts.lato(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text('%',
                                          style: GoogleFonts.beVietnam(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white)),
                                      Stack(
                                        children: [
                                          Container(
                                            width: 60,
                                            height: 5,
                                            color: Colors.grey,
                                          ),
                                          Container(
                                            width:
                                            weathersDisplay.humidity.toDouble() /
                                                2,
                                            height: 5,
                                            color: Colors.yellowAccent,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              //Khoang cach voi bottom
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        } else
          return CircularProgressIndicator.adaptive();
      },
    );
  }

  String formatTiengViet(String txt) {
    if (txt == 'Sunny') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Sunny', 'N???ng ?????p');
    } else if (txt == 'Partly cloudy') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Partly cloudy', 'Tr???i nhi???u m??y');
    } else if (txt == 'Patchy rain possible') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Patchy rain possible', 'C?? th??? m??a');
    } else if (txt == 'Light rain') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Light rain', 'M??a nh???');
    } else if (txt == 'Mist') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Mist', 'S????ng m?? nh???');
    } else if (txt == 'Fog') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Fog', 'C?? S????ng m??');
    } else if (txt == 'Light rain shower') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Light rain shower', 'M??a r??o nh???');
    } else if (txt == 'Clear') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Clear', 'Tr???i quang');
    } else if (txt == 'Overcast') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Overcast', 'Tr???i U ??m');
    } else if (txt == 'Moderate or heavy rain shower') {
      return weathersDisplay.textcondition
          .toString()
          .replaceAll('Moderate or heavy rain shower', 'M??a v???a ho???c m??a to');
    }
    return weathersDisplay.textcondition.toString();
  }

  String formatTenTP(String txt) {
    if (txt == 'Ca Mau') {
      return weathersDisplay.name.toString().replaceAll('Ca Mau', 'C?? Mau');
    } else if (txt == 'Shanghai') {
      return weathersDisplay.name
          .toString()
          .replaceAll('Shanghai', 'Th?????ng H???i');
    } else if (txt == 'Taiwan') {
      return weathersDisplay.name.toString().replaceAll('Taiwan', '????i Loan');
    } else if (txt == 'Pyongyang') {
      return weathersDisplay.name.toString().replaceAll('Pyongyang', 'B??nh Nh?????ng');
    } else if (txt == 'Chengdu') {
      return weathersDisplay.name.toString().replaceAll('Chengdu', 'Th??nh ????');
    } else if (txt == 'Da Nang') {
      return weathersDisplay.name.toString().replaceAll('Da Nang', '???? N???ng');
    } else if (txt == 'Da Lat') {
      return weathersDisplay.name.toString().replaceAll('Da Lat', '???? L???t');
    } else if (txt == 'Ha Noi') {
      return weathersDisplay.name.toString().replaceAll('Ha Noi', 'H?? N???i');
    } else if (txt == 'Vung Tau') {
      return weathersDisplay.name.toString().replaceAll('Vung Tau', 'V??ng T??u');
    } else if (txt == 'Ap Binh Thuan') {
      return weathersDisplay.name.toString().replaceAll('Ap Binh Thuan', 'B??nh Thu???n');
    } else if (txt == 'Can Tho') {
      return weathersDisplay.name.toString().replaceAll('Can Tho', 'C???n Th??');
    } else if (txt == 'Bac Lieu') {
      return weathersDisplay.name.toString().replaceAll('Bac Lieu', 'B???c Li??u');
    } else if (txt == 'Soc Trang') {
      return weathersDisplay.name.toString().replaceAll('Soc Trang', 'S??c Tr??ng');
    } else if (txt == 'Ho Chi Minh City') {
      return weathersDisplay.name.toString().replaceAll('Ho Chi Minh City', 'TP.H??? Ch?? Minh');
    } else if (txt == 'Sai Gon') {
      return weathersDisplay.name.toString().replaceAll('Sai Gon', 'TP.H??? Ch?? Minh');
    } else if (txt == 'Song Ong Doc') {
      return weathersDisplay.name.toString().replaceAll('Song Ong Doc', 'TT.S??ng ?????c');
    } else if (txt == 'Nam Can') {
      return weathersDisplay.name.toString().replaceAll('Nam Can', 'TT.N??m C??n');
    } else if (txt == 'Gia Rai') {
      return weathersDisplay.name.toString().replaceAll('Gia Rai', 'TX.Gi?? Rai');
    } else if (txt == 'Hoi An') {
      return weathersDisplay.name.toString().replaceAll('Hoi An', 'H???i An');
    } else if (txt == 'Quang Nam') {
      return weathersDisplay.name.toString().replaceAll('Quang Nam', 'Qu???ng Nam');
    } else if (txt == 'Thu Dau Mot') {
      return weathersDisplay.name.toString().replaceAll('Thu Dau Mot', 'Th??? D???u M???t');
    } else if (txt == 'Binh Duong') {
      return weathersDisplay.name.toString().replaceAll('Binh Duong', 'B??nh D????ng');
    } else if (txt == 'Bien Hoa') {
      return weathersDisplay.name.toString().replaceAll('Bien Hoa', 'Bi??n H??a');
    } else if (txt == 'Buon Bubo Dak Nong') {
      return weathersDisplay.name.toString().replaceAll('Buon Bubo Dak Nong', '?????k N??ng');
    } else if (txt == 'Nguyen') {
      return weathersDisplay.name.toString().replaceAll('Nguyen', 'T??y Nguy??n');
    } else if (txt == 'Dien Bien Phu') {
      return weathersDisplay.name.toString().replaceAll('Dien Bien Phu', '??i???n Bi??n Ph???');
    } else if (txt == 'Lao Cai') {
      return weathersDisplay.name.toString().replaceAll('Lao Cai', 'L??o Cai');
    } else if (txt == 'Yen Bai') {
      return weathersDisplay.name.toString().replaceAll('Yen Bai', 'Y??n B??i');
    } else if (txt == 'Cao Bang') {
      return weathersDisplay.name.toString().replaceAll('Cao Bang', 'Cao B???ng');
    } else if (txt == 'Lang Son') {
      return weathersDisplay.name.toString().replaceAll('Lang Son', 'L???ng S??n');
    } else if (txt == 'Bac Kan') {
      return weathersDisplay.name.toString().replaceAll('Bac Kan', 'B???c K???n');
    } else if (txt == 'Hoa Binh') {
      return weathersDisplay.name.toString().replaceAll('Hoa Binh', 'H??a B??nh');
    } else if (txt == 'Ba Ria') {
      return weathersDisplay.name.toString().replaceAll('Ba Ria', 'T???nh B?? R???a');
    } else if (txt == 'Phu Yen') {
      return weathersDisplay.name.toString().replaceAll('Phu Yen', 'Ph?? Y??n');
    } else if (txt == 'Hoa Khanh') {
      return weathersDisplay.name.toString().replaceAll('Hoa Khanh', 'Kh??nh H??a');
    } else if (txt == 'Chau Doc') {
      return weathersDisplay.name.toString().replaceAll('Chau Doc', 'Ch??u ?????c');
    } else if (txt == 'Dong Lam') {
      return weathersDisplay.name.toString().replaceAll('Dong Lam', 'L??m ?????ng');
    } else if (txt == 'Thai Binh') {
      return weathersDisplay.name.toString().replaceAll('Thai Binh', 'Th??i B??nh');
    } else if (txt == 'Hai Phong') {
      return weathersDisplay.name.toString().replaceAll('Hai Phong', 'H???i Ph??ng');
    } else if (txt == 'Yen Hung') {
      return weathersDisplay.name.toString().replaceAll('Yen Hung', 'H??ng Y??n');
    } else if (txt == 'Bac Ninh') {
      return weathersDisplay.name.toString().replaceAll('Bac Ninh', 'B???c Ninh');
    } else if (txt == 'Tuyen Quang') {
      return weathersDisplay.name.toString().replaceAll('Tuyen Quang', 'Tuy??n Quang');
    } else if (txt == 'Son La') {
      return weathersDisplay.name.toString().replaceAll('Son La', 'S??n La');
    } else if (txt == 'Thanh Hoa') {
      return weathersDisplay.name.toString().replaceAll('Thanh Hoa', 'Thanh H??a');
    } else if (txt == 'Ben Tre') {
      return weathersDisplay.name.toString().replaceAll('Ben Tre', 'B???n Tre');
    } else if (txt == 'Dong Thap') {
      return weathersDisplay.name.toString().replaceAll('Dong Thap', '?????ng Th??p');
    } else if (txt == 'Tra Vinh') {
      return weathersDisplay.name.toString().replaceAll('Tra Vinh', 'Tr?? Vinh');
    } else if (txt == 'Ha Giang') {
      return weathersDisplay.name.toString().replaceAll('Ha Giang', 'H?? Giang');
    } else if (txt == 'Tay Ninh') {
      return weathersDisplay.name.toString().replaceAll('Tay Ninh', 'T??y Ninh');
    }
    return weathersDisplay.name.toString();
  }

  String formatTenNuoc(String txt) {
    if (txt == 'Vietnam') {
      return weathersDisplay.country
          .toString()
          .replaceAll('Vietnam', 'Vi???t Nam');
    } else if (txt == 'France') {
      return weathersDisplay.country.toString().replaceAll('France', 'Ph??p');
    } else if (txt == 'Russia') {
      return weathersDisplay.country
          .toString()
          .replaceAll('Russia', 'Li??n Bang Nga');
    } else if (txt == 'South Korea') {
      return weathersDisplay.country
          .toString()
          .replaceAll('South Korea', 'H??n Qu???c');
    } else if (txt == 'Australia') {
      return weathersDisplay.country.toString().replaceAll('Australia', '??c');
    } else if (txt == 'China') {
      return weathersDisplay.country
          .toString()
          .replaceAll('China', 'Trung Qu???c');
    } else if (txt == 'Taiwan') {
      return weathersDisplay.country
          .toString()
          .replaceAll('Taiwan', '????i Loan');
    } else if (txt == 'Japan') {
      return weathersDisplay.country.toString().replaceAll('Japan', 'Nh???t B???n');
    } else if (txt == 'United States of America') {
      return weathersDisplay.country
          .toString()
          .replaceAll('United States of America', 'M??? ?????');
    } else if (txt == 'North Korea') {
      return weathersDisplay.country
          .toString()
          .replaceAll('North Korea', 'B???c Tri???u Ti??n');
    } else if (txt == 'Spain') {
      return weathersDisplay.country
          .toString()
          .replaceAll('Spain', 'T??y Ban Nha');
    } else if (txt == 'Portugal') {
      return weathersDisplay.country
          .toString()
          .replaceAll('Portugal', 'B??? ????o Nha');
    } else if (txt == 'Poland') {
      return weathersDisplay.country
          .toString()
          .replaceAll('Poland', 'Ph???n Lan');
    } else if (txt == 'Germany') {
      return weathersDisplay.country
          .toString()
          .replaceAll('Germany', '?????c');
    } else if (txt == 'Mongolia') {
      return weathersDisplay.country
          .toString()
          .replaceAll('Mongolia', 'M??ng C???');
    } else if (txt == 'Slovakia') {
      return weathersDisplay.country
          .toString()
          .replaceAll('Slovakia', 'Ti???p Kh???c');
    } else if (txt == 'United Kingdom') {
      return weathersDisplay.country
          .toString()
          .replaceAll('United Kingdom', 'V????ng Qu???c Anh');
    }
    return weathersDisplay.country.toString();
  }
  String doiten(String txt){
    return txt.toString().replaceAll(" ", "").toLowerCase();
  }
}