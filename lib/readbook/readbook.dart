import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    Widget head = new Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        ClipRRect(
                        ),
                        SizedBox(height: 15,),
                        Text("The Arsonist", style: TextStyle(
                          fontSize: 20,fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 10,),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )
    );

    Widget body = new Container(
      child: Column(
        children: [

          Text('Lorem ipsum dolor sit amet, consectetu ryguu adipiscing elit, sed do eiusmodiuiuiuij temporuiuiuq incididunt ut labore et dolores magna aliquap Ut enim ad minim veniam, its quis nostrudjj poo exercitation ullamcomoum laboris nisi ut aliquip exea commodookolom consequat.',style: TextStyle(fontSize: 18,),),
          SizedBox(height: 7,),
          SizedBox(height: 7,),
          Text('Lorem ipsum dolor sit amet, consectetu ryguu adipiscing elit, sed do eiusmodiuiuiuij temporuiuiuq incididunt ut labore et dolores magna aliquap Ut enim ad minim veniam, its quis nostrudjj poo exercitation ullamcomoum laboris nisi ut aliquip exea commodookolom consequat..',style: TextStyle(fontSize: 18,),),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(30, 30, 30, 60),
              child: Column(
                children: [
                  head,
                  SizedBox(height: 40,),
                  body,
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xffc62828),
        unselectedItemColor: Colors.black38,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back_ios,),
              label: 'back',
              backgroundColor: Color(0xffe0e0e0)),
          BottomNavigationBarItem(
              icon: Icon(Icons.history, ),
              label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark, ),
              label: 'Bookmark',
              backgroundColor: Colors.white60),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, ),
              label: 'User',
              backgroundColor: Colors.white60),
        ],
      ),
    );
  }
}
