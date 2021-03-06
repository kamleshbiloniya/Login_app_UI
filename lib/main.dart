import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/auth_service.dart';
import 'package:loginapp/home.dart';
import 'package:loginapp/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup':(BuildContext context) =>new SignupPage(),
        '/home' :(BuildContext context) =>new HomePage()
      },
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String email,password;
  final formKey = new GlobalKey<FormState>();
  checkFields(){
    final form = formKey.currentState;
    if(form.validate()){
      return true;
    }
    else{
      return false;
    }
  }

 @override
  Widget build(BuildContext context) {
return Scaffold(
  resizeToAvoidBottomPadding: false,
  body: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:<Widget>[
      Container(
        child:Stack(
          children: <Widget>[
            Container(
              padding:EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
              child: Text(
                'Hello',
                style:TextStyle(
                  fontSize:80.0, fontWeight: FontWeight.bold
                )
              ),
            ),
            Container(
              padding:EdgeInsets.fromLTRB(15.0, 115.0, 0.0, 0.0),
              child: Text(
                'There',
                style:TextStyle(
                  fontSize:80.0, fontWeight: FontWeight.bold
                )
              ),
            ),
            Container(
              padding:EdgeInsets.fromLTRB(220.0, 115.0, 0.0, 0.0),
              child: Text(
                '.',
                style:TextStyle(
                  fontSize:80.0, fontWeight: FontWeight.bold,color:Colors.green
                )
              ),
            )
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.only(top:35.0,left:20.0,right:20.0),
        child: Column(
          children:<Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'EMAIL',
                labelStyle: TextStyle(
                  fontFamily:'Montserrat',
                  fontWeight:FontWeight.bold,
                  color:Colors.grey
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)
                )
              ),
              onChanged: (value){
                this.email = value.toString().trim();
              },
            ),
            SizedBox(height:20.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'PASSWORD',
                labelStyle: TextStyle(
                  fontFamily:'Montserrat',
                  fontWeight:FontWeight.bold,
                  color:Colors.grey
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)
                )
              ),
              onChanged: (value){
                this.password = value.toString().trim();
              },
              obscureText: true,
            ),
            SizedBox(height:5.0),
            Container(
              alignment:Alignment(1.0,0.0),
              padding:EdgeInsets.only(top:15.0,left:20.0),
              child:InkWell(
                child: Text('Forgot Password',
                style:TextStyle(
                  color:Colors.green,
                  fontWeight:FontWeight.bold,
                  fontFamily:'Montserrat',
                  decoration: TextDecoration.underline
                )
                ),
              )
            ),
            SizedBox(height:40.0),
            Container(
              height:40.0,
              child:Material(
                borderRadius:BorderRadius.circular(20.0),
                shadowColor:Colors.greenAccent,
                color: Colors.green,
                elevation: 7.0,
                child: GestureDetector(
                  onTap:signIn,
                  child:Center(
                    child:Text(
                      'LOGIN',
                      style:TextStyle(
                        color:Colors.white,
                        fontWeight:FontWeight.bold,
                        fontFamily: 'Montsarrat'
                      )
                    )
                  )
                )
              )
            ),
            SizedBox(height:20.0),
            Container(
              height:40.0,
              color:Colors.transparent,
              child:Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color:Colors.black,
                    style:BorderStyle.solid,
                    width:1.0
                  ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child:ImageIcon(AssetImage('assets/facebook.png'))
                    ),
                    SizedBox(width:10.0),
                    Center(
                      child:Text(
                        'Log in With facebook',
                        style:TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'
                        )
                      )
                    )
                  ],
                ),
              )
            )
          ]
        ),
      ),
      SizedBox(height:15),
      Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children:<Widget>[
          Text(
            'New in IITK?',
            style:TextStyle(
              fontFamily:'Montserrat'
            )
          ),
          SizedBox(width:5.0),
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed('/signup');
            },
            child: Text('Register',
              style:TextStyle(
                color:Colors.green,
                fontWeight:FontWeight.bold,
                fontFamily:'Montserrat',
                decoration: TextDecoration.underline
              )
            ),
          )
        ]
      )
    ]
  ),
    );
  }
  Future<void> signIn() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email:this.email,password:this.password).then((user){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      }).catchError((e){
        print(e.message);
      });
    }catch(e){
      print(e.message); 
    }
  }
}
