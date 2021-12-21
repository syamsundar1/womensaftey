import 'package:flutter/material.dart';
import 'package:women_safety/screens/conclution.dart';
import 'package:women_safety/screens/result.dart';
int depression=1;
class GreenPage extends StatefulWidget {
  const GreenPage({ Key? key }) : super(key: key);

  @override
  _GreenPageState createState() => _GreenPageState();
}

class _GreenPageState extends State<GreenPage> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0,0.0,0.0,0.0),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Text("do you feel positive about your life?",style: TextStyle(fontSize: 22.0),),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: () {
                          setState(() {
                            depression++;
                          });
                        }, child: const Text("YES")),
                        ElevatedButton(onPressed: () {
                          setState(() {
                            depression--;
                          });
                        }, child: const Text("NO")),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text("Are you alcoholic?",style: TextStyle(fontSize: 22.0),),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: () {setState(() {
                            depression++;
                          });}, child: Text("YES")),
                        ElevatedButton(onPressed: () {
                          setState(() {
                            depression--;
                          });
                        }, child: Text("NO")),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text("Are you a heavy smoker?",style: TextStyle(fontSize: 22.0),),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: () {
                          setState(() {
                            depression++;
                          });
                        }, child: Text("YES")),
                        ElevatedButton(onPressed: () {
                          setState(() {
                            depression--;
                          });
                        }, child: Text("NO")),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text("do you get quality sleep",style: TextStyle(fontSize: 22.0),),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: () {
                          setState(() {
                            depression++;
                          });
                        }, child: Text("YES")),
                        ElevatedButton(onPressed: () {
                          setState(() {
                            depression--;
                          });
                        }, child: Text("NO")),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text("currently taking any medications?",style: TextStyle(fontSize: 22.0),),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: () {
                          setState(() {
                            depression++;
                          });
                        }, child: Text("YES")),
                        ElevatedButton(onPressed: () {
                          setState(() {
                            depression--;
                          });
                        }, child: Text("NO")),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text("Is there a history of mental disorder in your family?",style: TextStyle(fontSize: 22.0),),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: () {
                          setState(() {
                            depression++;
                          });
                        }, child: Text("YES")),
                        ElevatedButton(onPressed: () {
                          setState(() {
                            depression--;
                          });
                        }, child: Text("NO")),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text("During the past 4 weeks, have you had any problems with your work or daily life due to any emotional problems, such as feeling depressed, sad or anxious?",style: TextStyle(fontSize: 22.0),),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: () {
                          setState(() {
                            depression++;
                          });
                        }, child: Text("YES")),
                        ElevatedButton(onPressed: () {
                          setState(() {
                            depression--;
                          });
                        }, child: Text("NO")),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text("During the past 4 weeks, have you had any problems with your work or daily life due to your physical health?",style: TextStyle(fontSize: 22.0),),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: () {
                          setState(() {
                            depression++;
                          });
                        }, child: Text("YES")),
                        ElevatedButton(onPressed: () {
                          setState(() {
                            depression--;
                          });
                        }, child: Text("NO")),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0,),
              Center(
                child:  ElevatedButton(
                  onPressed: ()  {
                    print(depression);
                    if(depression<0){
                      depression = 1;
                    }
                    else {
                      depression = 0;
                    }
                   
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Conclution(depression: depression)));
                    // if(depression<0){
                      
                    // }
                  },
                  child: Text("Submit"),
                ),
              ),
              // Text("Result : $depression"),
            ],
          ),
        ),
      ),
    );
  }
}