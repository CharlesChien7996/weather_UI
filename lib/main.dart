import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.lightBlue[300],
        primaryColor: Colors.blue,
      ),
      title: 'Weather App',
      home: Weather(),
    );
  }
}

class Weather extends StatelessWidget {

  Color textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50.0, bottom: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('中山區', style: TextStyle(fontSize: 30.0, color: textColor)),
                  Text('多雲時陰', style: TextStyle(fontSize: 15.0, color: textColor)),
                  Text('22°', style: TextStyle(fontSize: 60.0, color: textColor)),
                ],
              ),
            ),
            ListTile(
                leading: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('星期四', style: TextStyle(fontSize: 20.0, color: textColor)),
                    Padding(padding: EdgeInsets.only(left: 10.0)),
                    Text('今天', style: TextStyle(fontSize: 15.0, color: textColor))
                  ],
                ),
                trailing: _getTrailing(24, 18)),
            Container(color: Colors.white, height: 0.3),
            Container(
              height: 120.0,
              child: GridView.count(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                childAspectRatio: 1.5,
                scrollDirection: Axis.horizontal,
                crossAxisCount: 2,
                children: <Widget>[
                  _getGrid('現在', 'cloudy.png', '22°'),
                  _getGrid('下午12時', 'cloudy.png', '22°'),
                  _getGrid('下午1時', 'cloudy.png', '23°'),
                  _getGrid('下午2時', 'cloud.png', '23°'),
                  _getGrid('下午3時', 'cloud.png', '23°'),
                  _getGrid('下午4時', 'raining.png', '22°'),
                  _getGrid('下午5時', 'raining.png', '22°'),
                  _getGrid('下午6時', 'raining.png', '21°')
                ],
              ),
            ),
            Container(color: Colors.white, height: 0.3,),
            _getTile('星期五', 'raining.png', 19, 13),
            _getTile('星期六', 'cloud.png', 17, 14),
            _getTile('星期日', 'raining.png', 19, 17),
            _getTile('星期一', 'raining.png', 21, 17),
            _getTile('星期二', 'cloudy.png', 22, 18),
            _getTile('星期三', 'cloudy.png', 24, 18),
            _getTile('星期四', 'cloudy.png', 24, 19),
            _getTile('星期五', 'cloudy.png', 26, 20),
            _getTile('星期六', 'cloudy.png', 28, 20),
          ],
        ),
      ),
    );
  }

  Widget _getTile(String day, String imageName, int high, int low) {
    return ListTile(
      leading: _getLeading(day, 'images/$imageName', high, low),
    );
  }

  Widget _getTrailing(int high, int low) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text('$high', style: TextStyle(fontSize: 20.0, color: textColor)),
        Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
        Text('$low', style: TextStyle(fontSize: 20.0, color: textColor))
      ],
    );
  }

  Widget _getLeading(String day, String imageName, int high, int low) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 6,
            child: Text('$day', style: TextStyle(fontSize: 20.0, color: textColor))),
        Expanded(
          flex: 19,
            child: Image.asset(
          imageName,
          width: 20.0,
          height: 20.0,
        )),
        Expanded(flex: 2,child: Text('$high', style: TextStyle(fontSize: 20.0, color: textColor))),
        Expanded(flex: 1,child: Padding(padding: EdgeInsets.symmetric(horizontal: 10.0))),
        Expanded(flex: 2,child: Text('$low', style: TextStyle(fontSize: 20.0, color: textColor)))
      ],
    );
  }

  Widget _getGrid(String time, String imageName, String temperature) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('$time', style: TextStyle(fontSize: 18.0, color: textColor)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/$imageName', width: 20.0, height: 20.0,),
        ),
        Text('$temperature',
            style: TextStyle(fontSize: 18.0, color: textColor)),
      ],
    );
  }
}
