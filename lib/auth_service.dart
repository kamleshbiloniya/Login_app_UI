import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/main.dart';

import 'home.dart';

class AuthService{
  handleAuth(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          print("homePage");
          return HomePage();
        }
        else{
          return MyHomePage();
        }
      },
    );
  }
  

  signOut(){
    FirebaseAuth.instance.signOut();
  }

}