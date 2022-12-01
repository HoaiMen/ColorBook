import 'package:flutter/material.dart';
import 'package:main/android/start.dart';

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Support(),
    );
  }
}

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: Text(widget.title),
        ),
        body: new ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(30, 30, 30, 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Image.asset("images/back1.png"),
                      Container(
                        width: 600,
                        margin: EdgeInsets.only(right: 15, top: 55, left: 100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("READING APPS", style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),),
                            SizedBox(height: 8,),
                            Text("Ứng dụng đọc sách online được nhiều người đón nhận. Với hơn 4 triệu cuốn sách cùng với tạp chí trong kho thư viện, thuận tiện cho người dùng trong việc tìm những cuốn sách hay và ý nghĩa.",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xffd6d6d6)
                            ),)
                          ],
                        )
                      )
                    ],
                  ),

                  SizedBox(height: 50,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.orangeAccent,
                                  Color(0xffffe0b2)
                                ])
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("LIBRARY", style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold
                            ),),
                            SizedBox(width: 20,),
                            Icon(Icons.library_books, size: 40,)
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        width: 200,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.blueAccent,
                                  Color(0xffbbdefb)
                                ])
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("PROPAGATE", style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold
                            ),),
                            SizedBox(width: 20,),
                            Icon(Icons.group_add, size: 40,)
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.purpleAccent,
                                  Color(0xffe1bee7)
                                ])
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("SUPPORT", style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold
                            ),),
                            SizedBox(width: 20,),
                            Icon(Icons.security_outlined, size: 40,)
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        width: 200,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.green,
                                  Color(0xffa5d6a7)
                                ])
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("UPDATE", style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold
                            ),),
                            SizedBox(width: 20,),
                            Icon(Icons.arrow_circle_down, size: 40,)
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 50,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("COOPERATION", style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: 20,),
                        Container(
                          width: 280,
                          child: Column(
                            children: [
                              Text("Easily find, share and rate in real time with apps. Super library with thousands of different titles, hundreds of genres of long stories, short stories, poems, novels...", style: TextStyle(
                                fontSize: 16,
                              ),),
                              FlatButton(onPressed: (){},
                                  child: Row(
                                    children: [
                                      Text("More information", style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                      Icon(Icons.navigate_next)
                                    ],
                                  )
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(height: 2,color: Colors.black38,),
                  SizedBox(height: 20,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 280,
                          child: Column(
                            children: [
                              Text("Easily find, share and rate in real time with apps. Super library with thousands of different titles, hundreds of genres of long stories, short stories, poems, novels...", style: TextStyle(
                                fontSize: 16,
                              ),),
                              FlatButton(onPressed: (){},
                                  child: Row(
                                    children: [
                                      Text("More information",textAlign: TextAlign.right, style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                      Icon(Icons.navigate_next)
                                    ],
                                  )
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text("DEVELOPER", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),

                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(height: 2,color: Colors.black38,),
                  SizedBox(height: 20,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("NEW CONTENT", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: 20,),
                        Container(
                          width: 280,
                          child: Column(
                            children: [
                              Text("Easily find, share and rate in real time with apps. Super library with thousands of different titles, hundreds of genres of long stories, short stories, poems, novels...", style: TextStyle(
                                fontSize: 16,
                              ),),
                              FlatButton(onPressed: (){},
                                  child: Row(
                                    children: [
                                      Text("More information", style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                      Icon(Icons.navigate_next)
                                    ],
                                  )
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }

}
