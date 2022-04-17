import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2000,
      width: double.infinity,
      child: WebView(
        initialUrl: "https://www.windy.com/vi/-Hi%E1%BB%87n-th%C3%AAm-c%C3%A1c-l%E1%BB%9Bp/overlays?rain,6.636,93.076,5,m:d6Naigy",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
//Cà mau
}