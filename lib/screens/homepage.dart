import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:women_safety/screens/green.dart';
import 'package:women_safety/screens/red.dart';
import 'package:telephony/telephony.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _numberCtrl = TextEditingController();

  final telephony = Telephony.instance;
  String _message = "";

  onBackgroundMessage(SmsMessage message) {
  debugPrint("onBackgroundMessage called");
}

  onMessage(SmsMessage message) async {
    setState(() {
      _message = message.body ?? "Error reading message body.";
    });
  }

  onSendStatus(SendStatus status) {
    setState(() {
      _message = status == SendStatus.SENT ? "sent" : "delivered";
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

    final bool? result = await telephony.requestPhoneAndSmsPermissions;

    if (result != null && result) {
      telephony.listenIncomingSms(
          onNewMessage: onMessage, onBackgroundMessage: onBackgroundMessage);
    }

    if (!mounted) return;
  }

  double longitude = 0;
  double latitude = 0;

  Future<void> getlocation () async {
    final postion = await  Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      longitude = postion.longitude;
      latitude = postion.latitude;
    });
  }

  @override
  void initState() {
    _numberCtrl.text = "09398680128";
    getlocation();
    // initPlatformState();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: const [
          Text('Women',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black),),
          SizedBox(width: 8.0,),
          Text('Safety',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.white),),
        ],),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(60.0,0,0,0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(onPressed: () async => {
                  getlocation(),
                  FlutterPhoneDirectCaller.callNumber(_numberCtrl.text),
                  launch('sms:+919398680128?body=I am in danger please help me. My location is $longitude and $latitude'),
                  // await telephony.openDialer("9398680128"),
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const Red()))
                }, 
                 style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red),),
                child: const Text("DANGER",style: TextStyle(backgroundColor: Colors.red,fontSize: 35.0),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(onPressed: () => {
                  launch('sms:+919398680128?body=I am in trouble please help me'),
                }, 
                 style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellow),),
                child: const Text("PANIC",style: TextStyle(backgroundColor: Colors.yellow,fontSize: 35.0),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(onPressed: () => {
                  FlutterPhoneDirectCaller.callNumber('6362529110'),
                }, 
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey),),
                child: const Text("MEDICAL",style: TextStyle(fontSize: 35.0),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const GreenPage())),
                }, 
                 style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green),),
                child: const Text("MY HEALTH",style: TextStyle(backgroundColor: Colors.green,fontSize: 35.0),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}