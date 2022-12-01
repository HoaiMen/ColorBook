import 'package:flutter/material.dart';
import 'package:main/BookItems/listBook.dart';

import '../Home/home.dart';
import '../profile/profile.dart';
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
      // theme: ThemeData(
      //
      //   primarySwatch: Colors.blue,
      // ),
      home: const History(title: ''),
    );
  }
}
class History extends StatefulWidget {
  const History({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<History> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<History>
    with TickerProviderStateMixin {

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
}

  void showPopupMenu() async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),  //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            child: const Text('menu option 1'), value: '1'),
        PopupMenuItem<String>(
            child: const Text('menu option 2'), value: '2'),
        PopupMenuItem<String>(
            child: const Text('menu option 3'), value: '3'),
      ],
      elevation: 8.0,
    )
        .then<void>((itemSelected) async {

      if (itemSelected == null) return;

      if(itemSelected == "1"){
        //code here
      }else if(itemSelected == "2"){
        //code here
      }else{
        //code here
      }
    });
  }

  void showPopupMenu1() async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(40, 160, 70, 100),  //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            child: const Text('Language Settings'), value: '1'),
        PopupMenuItem<String>(
            child: const Text('Application Management'), value: '2'),
        PopupMenuItem<String>(
            child: const Text('Application Information'), value: '3'),
      ],
      elevation: 8.0,
    )
        .then<void>((itemSelected) async {

      if (itemSelected == null) return;

      if(itemSelected == "1"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Support()));
      }else if(itemSelected == "2"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Support()));
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context) => Support()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {

   Widget head = new Container(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.menu, size: 40,),
                    color: Colors.black,
                    onPressed: () async {
                      showPopupMenu1();
                    },
                    splashRadius: 17,
                    splashColor: Colors.lightBlueAccent,
                  ),

                  Container(
                    child: Row(
                      children: [
                        FlatButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(title: "")));
                          },
                          child: Text('Soroushnrz',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(200.0),
                          child: const Image(image: AssetImage('images/anh4.png'), width: 50,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );

    Widget content1 = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("History",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),),
          SizedBox(height: 20,),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.black12,
                hintText: 'Search by Titel, Author, Genre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                )
            ),
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Most Recently Read",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListBook(title: "")));
                },
                child: Text("View All", style: TextStyle(
                    fontSize: 18,
                    color: Colors.green
                ),),
              ),
            ],
          ),
          SizedBox(height: 15,),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const Image(image: AssetImage('images/sach.png'), ),
          ),
        ],
      ),
    );

    Widget content2 = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const Image(image: AssetImage('images/book6.png'), width: 100,),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('''Bước Chân Chậm lại''', style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 7,),
                        Text("Hae Min", style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),)
                      ],
                    ),
                  )

                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const Image(image: AssetImage('images/book8.png'), width: 100,),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bắt Trẻ Đồng Xanh", style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 7,),
                        Text("Writinman", style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),)
                      ],
                    ),
                  )

                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const Image(image: AssetImage('images/book9.png'), width: 100,),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Đọc Vị Bất Kỳ Ai", style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 7,),
                        Text("J.Lieberman", style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),)
                      ],
                    ),
                  )
                ],
              ),

            ],
          ),


          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recommended",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),),
              FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListBook(title: '',)));
                },
                child: Text("View All", style: TextStyle(
                    fontSize: 18,
                    color: Colors.green
                ),),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(image: AssetImage('images/book1.png'), width: 140,),
                  ),
                  SizedBox(height: 10,),
                  Text("Catcher in the Rye", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 7,),
                  Text("J.D. Salinger", style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(image: AssetImage('images/book3.png'), width: 140,),
                  ),
                  SizedBox(height: 10,),
                  Text("Someone Like You", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 7,),
                  Text("Roald Dahl", style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),)

                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(image: AssetImage('images/book5.png'), width: 140,),
                  ),
                  SizedBox(height: 10,),
                  Text("The Arsonist", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 7,),
                  Text("Chioe Hooper", style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),)

                ],
              ),

            ],
          ),

        ],
      ),
    );

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: new ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(30, 30, 30, 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                head,
                SizedBox(height: 25,),
                content1,
                SizedBox(height: 20,),
                content2,

              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xffc62828),
        unselectedItemColor: Colors.black38,
        currentIndex: currentIndex,
        onTap: (index) {
          if(index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(title: "")));
          } else if (index == 2){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(title: "")));
          } else if (index == 3){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(title: "")));
          }
          setState(() {
            currentIndex = index;
          });
        },
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
