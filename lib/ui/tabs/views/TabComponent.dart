import 'package:flutter/material.dart';
import 'package:flutter_login/ui/hotel/views/HotelComponent.dart';
import 'package:flutter_login/ui/captureImage/views/CaptureImageComponenent.dart';

class TabComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
//          appBar: AppBar(
//            bottom: TabBar(
//              tabs: [
//                Tab(icon: Icon(Icons.directions_car)),
//                Tab(icon: Icon(Icons.directions_transit)),
//                Tab(icon: Icon(Icons.directions_bike)),
//              ],
//            ),
//            title: Text('Tabs Demo'),
//          ),
          body: TabBarView(
            children: [
              new HotelPage(),
              new CaptureImageScreen(),
              Icon(Icons.directions_bike),
            ],
          ),
          bottomNavigationBar: new TabBar(
            tabs: [
              Tab(
                icon: new Icon(Icons.directions_car),
              ),
              Tab(
                icon: new Icon(Icons.directions_transit),
              ),
              Tab(
                icon: new Icon(Icons.directions_bike),
              ),
            ],
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.red,
          ),
        ),
      ),
    );
  }
}