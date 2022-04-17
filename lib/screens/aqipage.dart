import 'package:flutter/material.dart';
import '../widgets/slider_dot.dart';
import '../widgets/single_page/single_aqi.dart';


class AQIPage extends StatefulWidget {
  const AQIPage({Key key}) : super(key: key);

  @override
  State<AQIPage> createState() => _AQIPageState();
}

class _AQIPageState extends State<AQIPage> {

  int _currentPage = 0;
  String backgImg = '';

  _onPageChange(int i) {
    setState(() {
      _currentPage = i;
    });
  }

  String background(int _current){

    switch(_current+1) {
      case 1: backgImg = 'assets/aqi/camau.jpg'; break;
      case 2: backgImg = 'assets/aqi/calgary.jpg'; break;
      case 3: backgImg = 'assets/aqi/havana.jpg'; break;
      case 4: backgImg = 'assets/aqi/moscow.jpg'; break;
      case 5: backgImg = 'assets/aqi/paris.jpg'; break;
      case 6: backgImg = 'assets/aqi/seoul.jpg'; break;
      case 7: backgImg = 'assets/aqi/sydney.jpg'; break;
      case 8: backgImg = 'assets/aqi/shanghai.jpg'; break;
      case 9: backgImg = 'assets/aqi/taiwan.jpg'; break;
      case 10: backgImg = 'assets/aqi/tokyo.jpg'; break;
    }
    return backgImg;
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Stack(
        children: [
          //Background Image
          Image.asset(
            background(_currentPage),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          //Lop phu den
          Container(
            decoration: BoxDecoration(color: Colors.black12),
          ),
          //Silder sang trang
          Container(
            margin: EdgeInsets.only(top: 130, left: 15),
            child: Row(
              children: [
                for (int i = 0; i < 10; i++)
                  if (i == _currentPage)
                    SliderDot(true)
                  else
                    SliderDot(false)
              ],
            ),
          ),
          //Build view page
          PageView.builder(
            onPageChanged: _onPageChange,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (ctx, i) => SingleAQI(i),
          ),
          //Toan bo thong tin hien thi ben duoi Appbar, Stack = 3
        ],
      ),
    );

  }
}