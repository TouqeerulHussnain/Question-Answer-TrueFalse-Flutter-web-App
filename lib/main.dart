import 'dart:html';

import 'package:flutter/material.dart';
import 'package:lab6/QuestionBank.dart';
import 'package:lab6/Questions.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData.light(),
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  QuizBrain obj = QuizBrain();
  List<Widget> score = [];
  
  void UpdateScore(icon){
    if(obj.TotalQuestions()==false){
      score.add(Icon(icon));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(obj.GetQuestions(),style: TextStyle(fontSize: 42,color: Colors.lightBlue,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          Container(
            height: 200,
            width: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: 200,
              child: ElevatedButton(onPressed: (){
                setState(() {
                  if(obj.TotalQuestions()==false){
                    if(obj.CorrectAnswer()==true){
                      UpdateScore(Icons.check);
                    }
                    else{
                      UpdateScore(Icons.close);
                    }
                  }
                  else{
                    score=[];
                  }
                  obj.nextQuestions();
                  
                  
                });
              }, child: Text('True',style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
                width: 200,
              child: ElevatedButton(onPressed: (){
                setState(() {
                  if(obj.TotalQuestions()==false){
                    if(obj.CorrectAnswer()==true){
                      UpdateScore(Icons.check);
                    }
                    else{
                      UpdateScore(Icons.close);
                    }
                  }
                  else{
                    score=[];
                  }
                  obj.nextQuestions();
                  
                });
              }, child: Text('False',style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
              
              ),
            ),
          ),
          Container(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
           children: score,
          )
        ],
      ),
    );
  }
}
