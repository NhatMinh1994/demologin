import 'package:flutter_login/data/FetchDataException.dart';
import 'package:flutter_login/model/hotel/HotelData.dart';
import 'package:flutter_login/ui/hotel/presenter/HotelPresenter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HotelPage extends StatefulWidget {
  @override
  _HotelPageState createState() => new _HotelPageState();
}

class _HotelPageState extends State<HotelPage> implements HotelListViewContract {
  HotelPresenter _presenter;
  List<Hotel> _hotels;
  bool _isLoading;

  _HotelPageState() {
    _presenter = new HotelPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.loadHotels();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 5.0,
//      ),
      body: _isLoading
          ? new Center(
        child: new CircularProgressIndicator(),
      )
          : _hotelWidget(),
    );
  }

  Widget _hotelWidget() {
    return new Container(
      child: new Padding(
        padding: EdgeInsets.all(8.0),
        child: new Column(
          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                itemCount: _hotels.length,
                itemBuilder: (BuildContext context, int index) {
                  final Hotel hotel = _hotels[index];
                  return _getCardItemUi(context, hotel);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getCardItemUi(BuildContext context, Hotel hotel) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
            subtitle: new Padding(padding: EdgeInsets.all(10.0),child: Row(
              children: <Widget>[
                Container(width: 80,height: 80,
                  margin: EdgeInsets.fromLTRB(0.0,0.0,10.0,0.0),
                  child: CachedNetworkImage(
                    imageUrl: hotel.background,
                    fit: BoxFit.fill,
                    fadeInCurve: Curves.easeIn ,
                    fadeInDuration: Duration(seconds: 2),
                    fadeOutCurve: Curves.easeOut,
                    fadeOutDuration: Duration(seconds: 2),
                    placeholder: (context, url) => new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Center(child: new Icon(Icons.error)),
                  ),),
                new Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                    child: new Text(
                      hotel.name,
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    )),
              ],
            ) ,),
            isThreeLine: true,
            onTap: () {
              final snackBar =
              new SnackBar(content: new Text("Tap : ${hotel.name}", style: new TextStyle(fontSize: 15.0),));
              Scaffold.of(context).showSnackBar(snackBar);
            },
          )
        ],
      ),
    );
  }

  @override
  void onError(FetchDataException e) {
    print(e.toString());
  }

  @override
  void onSuccess(List<Hotel> items) {
    setState(() {
      _hotels = items;
      _isLoading = false;
    });
  }
}
