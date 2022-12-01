import 'package:flutter/material.dart';
import 'package:main/Home/home.dart';

import '../History/history.dart';
import '../android/start.dart';
import '../support/support.dart';

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
      // title: 'Flutter Demo',
      home: const Profile(title: ''),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Profile> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Profile> {

  int currentIndex = 0;

  get data => null;

  @override
  Widget build(BuildContext context) {

    Widget head = new Container(
        child: Column(
          children: [
            Container(
              height: 300,
              width: 800,
              decoration: BoxDecoration(
                  color: Color(0XFFD6D6D6),
                  borderRadius: BorderRadius.circular(50)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Column(
                      children: [
                        Text("Profile",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(200.0),
                          child: const Image(image: AssetImage('images/anh4.png'), width: 100,),
                        ),
                        SizedBox(height: 15,),
                        Text("soroushnorozyui@gmail.com", style: TextStyle(
                          fontSize: 13,
                        ),),
                        SizedBox(height: 7,),
                        Text("Soroushnrz", style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 7,),
                        FlatButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(title: "")));
                          },
                          child: Text("Edit Profile", style: TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                          ),),
                        ),

                      ],
                    ),
                  )


                ],
              ),
            ),

          ],
        )
    );

    Widget body = Container(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.group_add, size: 30, color: Colors.blue,),
            title: Text("Recommend to friend", style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17
            ),),
            trailing: IconButton(
              icon: Icon(Icons.chevron_right, size: 30,),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Support()));

              },
              splashRadius: 17,
              splashColor: Color(0xffb3e5fc),
            ),
          ),
          SizedBox(height: 7,),
          ListTile(
            leading: Icon(Icons.forum, size: 30, color: Colors.blue,),
            title: Text("Feedback comment", style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17
            ),),
            trailing: IconButton(
              icon: Icon(Icons.chevron_right, size: 30,),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Support()));

              },
              splashRadius: 17,
              splashColor: Color(0xffb3e5fc),
            ),
          ),
          SizedBox(height: 7,),
          ListTile(
            leading: Icon(Icons.how_to_reg, size: 30, color: Colors.blue,),
            title: Text("Membership registration", style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17
            ),),
            trailing: IconButton(
              icon: Icon(Icons.chevron_right, size: 30,),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Support()));

              },
              splashRadius: 17,
              splashColor: Color(0xffb3e5fc),
            ),
          ),
          SizedBox(height: 7,),
          ListTile(
            leading: Icon(Icons.recent_actors, size: 30, color: Colors.blue,),
            title: Text("Introduce us", style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17
            ),),
            trailing:
            IconButton(
              icon: Icon(Icons.chevron_right, size: 30,),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Support()));

              },
              splashRadius: 17,
              splashColor: Color(0xffb3e5fc),
          ),
          ),
          SizedBox(height: 7,),
          ListTile(
            leading: Icon(Icons.logout, size: 30, color: Colors.blue,),
            title: Text("Sign out", style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17
            ),),
            trailing: IconButton(
              icon: Icon(Icons.chevron_right, size: 30,),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Start(data)));
              },
              splashRadius: 17,
              splashColor: Color(0xffb3e5fc),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
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
          if(index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(title: "")));
          } else if (index == 1){
            Navigator.push(context, MaterialPageRoute(builder: (context) => History(title: "")));
          } else if (index == 2){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(title: "")));
          }
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              label: 'Home',
              backgroundColor: Color(0xffe0e0e0)),
          BottomNavigationBarItem(
              icon: Icon(Icons.history, ),
              label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark, ),
              label: 'Favorite',
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
