// import 'package:flutter/material.dart';

// class ResultPage extends StatefulWidget {
//   final depression;
//   // const ResultPage({Key? key}) : super(key: key);
//   ResultPage({this.depression});

//   @override
//   State<ResultPage> createState() => _ResultPageState();
// }

// class _ResultPageState extends State<ResultPage> {
//   @override
//   Widget build(BuildContext context) {
//     bool conclution = false;

//     checkresult(){
//       if(depression==1){
//       return true;
//     }
//     else{
//       return false;
//     }
//     }
    
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(children: const [
//           Text('Women',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black),),
//           SizedBox(width: 8.0,),
//           Text('Safety',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.white),),
//         ],),
//         centerTitle: true,
//         elevation: 0.0,
//       ),
//       body: SafeArea(
//         child: Center(
//           child: checkresult() ? Container(
//             child: Text('Happy'),
//           ) : Container(
//             child: Text('sad'),
//           ),
//         ),
//       ),
//     );
//   }
// }

