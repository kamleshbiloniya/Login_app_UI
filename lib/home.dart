import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Text('You are logged in'),
          SizedBox(height:10.0),
          Container(
            height:40.0,
            padding:EdgeInsets.only(left: 10.0,right: 10.0) ,
            child:Material(
              borderRadius:BorderRadius.circular(20.0),
              shadowColor:Colors.redAccent,
              color: Colors.red,
              elevation: 7.0,
              child: GestureDetector(
                onTap:signOut,
                child:Center(
                  child:Text(
                    'Sign Out',
                    style:TextStyle(
                      color:Colors.white,
                      fontWeight:FontWeight.bold,
                      fontFamily: 'Montsarrat'
                    )
                  )
                )
              )
            )
          )
        ]
      ),
    );
  }
      Future<void> signOut() async{
    try{
      await FirebaseAuth.instance.signOut().then((user){
        Navigator.pop(context); 
      }).catchError((e){
        print(e.message);
      });
    }catch(e){
      print(e.message); 
    }
  }
}