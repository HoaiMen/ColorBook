import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Register/register.dart';
import '../Sign In/signin.dart';
void main() async {
  var url = Uri.parse('https://6382330e9842ca8d3ca3bce2.mockapi.io/api/users');
  var rs = await http.get(url);
  var data = jsonDecode(utf8.decode(rs.bodyBytes));
  print(data);
  runApp(MyApp(data));
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  dynamic data;
  MyApp(this.data);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home:  Start(data),
    );
  }
}

class Start extends StatefulWidget {
  // const Start({Key? key, required this.title}) : super(key: key);
  dynamic data;

  // final String title;
  Start(this.data);

  @override
  State<Start> createState() => _MyHomePageState(data);
}

class _MyHomePageState extends State<Start> {

  dynamic data;
  _MyHomePageState(this.data);
  @override
  Widget build(BuildContext context) {

    Widget head = Container(
        child: Column(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("images/picture.png", width: 300,)
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(300.0),
                    child: const Image(image: AssetImage('images/logo.png')),
                  ),

                  SizedBox(height: 20,),
                  Text("Color Store ", style: TextStyle(
                      fontSize: 50,
                      fontFamily: "DancingScript",
                      color: Colors.red
                  ),),
                  SizedBox(height: 20,),
                  Text("Read your favourite books", style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 20,),
                  Container(
                    width: 400,
                    child: Column(
                      children: [
                        Text("A library of bite-sized business eBooks on soft skils and access to 30+ millions books in various languages with an easy and simple monthly subscription and read anywhere, any devices.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff263238),
                          ),
                          textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Register(this.data)));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff00C953),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36),
                            ),
                          ),
                          child: SizedBox(
                            width: 100,
                            height: 50,
                            child: Center(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),

                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn(this.data)));
                          },
                          style: ElevatedButton.styleFrom(

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36),
                            ),
                          ),
                          child: SizedBox(
                            width: 100,
                            height: 50,
                            child: Center(
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );


    return Scaffold(
        appBar: AppBar(
          // title: Text(widget.title),
        ),
        body: new ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(30, 30, 30, 60),
              child: Column(
                children: [
                  head,
                ],
              ),
            )
          ],
        )
    );
  }
}
