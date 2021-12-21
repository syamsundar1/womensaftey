import 'package:flutter/material.dart';


class Conclution extends StatelessWidget {
  final depression;
  // const Conclution({ Key? key }) : super(key: key);
  // ignore: use_key_in_widget_constructors
  const Conclution({this.depression});

  checkresult(){
      if(depression==1){
      return false;
    }
    else{
      return true;
    }
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
        child: Center(
          child: checkresult() ? Container(
            child: Column(
              children: [
                Center(
                  child: Text('Your are a happy person Keep it UP!', style: TextStyle(fontSize: 30.0),),
                )
              ],
            ),
          ) : Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text('You must take these steps to overcome the mental illness!',style: TextStyle(fontSize: 30.0),),
                  ),
                ),
                Text("Steps to follow : ", style: TextStyle(fontSize: 20.0),),
                Text("1.Keep small goals and try to acomplish", style: TextStyle(fontSize: 20.0),),
                Text("2.Do jogging atleast 10 minutes", style: TextStyle(fontSize: 20.0),),
                Text("3.Do yoga everyday atleast 30 minutes ", style: TextStyle(fontSize: 20.0),),
                Text("4.Attend pleasent events and activites", style: TextStyle(fontSize: 20.0),),
                Text("5.Stay in the present and donot overthink ", style: TextStyle(fontSize: 20.0),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}