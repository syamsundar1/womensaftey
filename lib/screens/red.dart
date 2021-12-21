import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Red extends StatefulWidget {
  const Red({ Key? key }) : super(key: key);

  @override
  _RedState createState() => _RedState();
}

class _RedState extends State<Red> {
  
  Future<void> getlocation () async {
    final postion = await  Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(postion.longitude);
    print(postion.latitude);
  }

  @override
  void initState() {
    getlocation();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ElevatedButton(onPressed: () => {
          // _geolocatorPlatform();
          getlocation(),
        },
          child: Text('locate me'),
        ),
      ),
    );
  }
}