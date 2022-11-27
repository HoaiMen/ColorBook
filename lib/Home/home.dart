import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  var url = Uri.parse('https://6382330e9842ca8d3ca3bce2.mockapi.io/api/users');
  var rs = await http.get(url);
  var data = jsonDecode(utf8.decode(rs.bodyBytes));
  print(data);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: ''),
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  });

  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                author,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black87,
                ),
              ),
              Text(
                '$publishDate - $readDuration',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class CustomListItemTwo extends StatelessWidget {
  const CustomListItemTwo({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  });

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: title,
                  subtitle: subtitle,
                  author: author,
                  publishDate: publishDate,
                  readDuration: readDuration,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<HomePage>
    with TickerProviderStateMixin {

  final List<String> items = List<String>.generate( 5, (i) => i == 0 ?("Hot"):'$i');


  int currentIndex = 0;
  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
        //code here
      }else if(itemSelected == "2"){
        //code here
      }else{
        //code here
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
                        Text("men",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
          Text("Keep exploring",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),),
          SizedBox(height: 15,),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey,),
                filled: true,
                fillColor: Colors.black12,
                hintText: 'Search by Titel, Author, Genre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                )
            ),
          ),
          SizedBox(height: 15,),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const Image(image: AssetImage('images/content1.png'), ),
          ),
        ],
      ),
    );

    Widget content2 = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Popular Authors",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),),
              Text("View all",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: const Image(image: AssetImage('images/author1.png'), width: 70,),
                  ),
                  SizedBox(height: 10,),
                  Text("J.K. Rowling", style: TextStyle(
                    fontSize: 14,
                    fontFamily: "UMT1",
                    color: Color(0xfff44336),
                  ),)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: const Image(image: AssetImage('images/author2.png'), width: 70,),
                  ),
                  SizedBox(height: 10,),
                  Text("Virginia", style: TextStyle(
                    fontSize: 14,
                    fontFamily: "UMT1",
                    color: Color(0xfff44336),
                  ),)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: const Image(image: AssetImage('images/author3.png'), width: 70,),
                  ),
                  SizedBox(height: 10,),
                  Text("Charles", style: TextStyle(
                    fontSize: 14,
                    fontFamily: "UMT1",
                    color: Color(0xfff44336),
                  ),)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: const Image(image: AssetImage('images/author4.png'), width: 70,),
                  ),
                  SizedBox(height: 10,),
                  Text("James", style: TextStyle(
                    fontSize: 14,
                    fontFamily: "UMT1",
                    color: Color(0xfff44336),
                  ),)
                ],
              ),
            ],
          ),

          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Continue Reading",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),),
              Text("View all",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),),
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
                    child: const Image(image: AssetImage('images/book1.png'), width: 170,),
                  ),
                  SizedBox(height: 10,),
                  Text("Catcher In The Rye", style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 7,),
                  Text("J.K. Rowling", style: TextStyle(
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
                    child: const Image(image: AssetImage('images/book2.png'), width: 170,),
                  ),
                  SizedBox(height: 10,),
                  Text("Lord Of The Rings", style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 7,),
                  Text("J.R.R Tolkein", style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),)
                ],
              ),

            ],
          ),


          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Trending books",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),),
              Text("View all",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),),
            ],
          ),
          SizedBox(height: 18,),
          DefaultTabController(
            length: 5,
            child: Column(
              children: [
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      indicator: ShapeDecoration (
                          shape: UnderlineInputBorder (
                            borderRadius: BorderRadius.circular(60),
                            borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 70,
                                style: BorderStyle.solid
                            ),
                          ),
                          gradient: LinearGradient(colors: [Color(0xff0081ff), Color(0xff01ff80)])
                      ),
                      unselectedLabelStyle: TextStyle(color: Colors.grey[500], fontSize: 17,),
                      unselectedLabelColor: Colors.grey[500],
                      labelColor: Colors.black,
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      isScrollable: true,
                      labelPadding: EdgeInsets.only(left: 20, right: 20),
                      tabs: [
                        Row(children: [Text("Fantasy")],),
                        Row(children: [Text("Comedy")],),
                        Row(children: [Text("Horror")],),
                        Row(children: [Text("Fiction")],),
                        Row(children: [Text("Action")],),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 17,),
                SizedBox(
                  height: 400.0,
                  child: TabBarView(

                    children:  <Widget>[
                      Container(
                          child:Column(
                            children: [
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book5.png'),),
                                ),
                                title: 'Flutter 1.0 Launch',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Dash',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book5.png'),),
                                ),
                                title: 'Flutter 1.0 Launch',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Dash',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book5.png'),),
                                ),
                                title: 'Flutter 1.0 Launch',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Dash',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                            ],
                          )
                      ),
                      Container(
                          child:Column(
                            children: [
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book6.png'),),
                                ),
                                title: 'Flutter 1.0 Launch',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Dash',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book6.png'),),
                                ),
                                title: 'Flutter 1.0 Launch',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Dash',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book6.png'),),
                                ),
                                title: 'Flutter 1.0 Launch',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Dash',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                            ],
                          )
                      ),
                      Container(
                          child:Column(
                            children: [
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book7.png'),),
                                ),
                                title: 'Flutter 1.0 Launch',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Dash',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book7.png'),),
                                ),
                                title: 'Flutter 1.0 Launch',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Dash',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book7.png'),),
                                ),
                                title: 'Flutter 1.0 Launch',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Dash',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                            ],
                          )
                      ),
                      Container(
                          child:Column(
                            children: [
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book8.png'),),
                                ),
                                title: 'Flutter 1.0 Launch',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Dash',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book8.png'),),
                                ),
                                title: 'Flutter 1.0 Launch',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Dash',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book8.png'),),
                                ),
                                title: 'Flutter 1.0 Launch',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Dash',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                            ],
                          )
                      ),
                      Container(
                          child:Column(
                            children: [
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book4.png'),),
                                ),
                                title: 'Flutter 1.0 Launch',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Dash',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book4.png'),),
                                ),
                                title: 'Flutter 1.0 Launch',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Dash',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book4.png'),),
                                ),
                                title: 'Flutter 1.0 Launch',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Dash',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                            ],
                          )
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 15,),


          SizedBox(height: 15,),

        ],
      ),
    );



    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
        onTap: (index) => setState(() {
          currentIndex = index;
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
              icon: Icon(Icons.favorite, ),
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
