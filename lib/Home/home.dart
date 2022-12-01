import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:main/BookItems/listBook.dart';
import 'package:main/History/history.dart';
import 'package:main/profile/profile.dart';
import '../services/book.dart';
import '../support/support.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() async {
  var url = Uri.parse('https://6382330e9842ca8d3ca3bce2.mockapi.io/api/users');
  var rs = await http.get(url);
  var data = jsonDecode(utf8.decode(rs.bodyBytes));
  print(data);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, }) : super(key: key);

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
  const HomePage({Key? key, required this.title, }) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<HomePage>
    with TickerProviderStateMixin {
  late final Future<List<Books>> books;
  final TextEditingController fullnameController = TextEditingController();
  int currentIndex = 0;
  int activePage = 1;
  late TabController _tabController;
  late PageController _pageController;
  List<String> images = [
    "images/sach.png",
    "images/back1.png",
    "images/content1.png"
  ];


  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8,initialPage: 1);
    _tabController = TabController(length: 3, vsync: this);
    books = fetchBooks();
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

    Widget head = Container(
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
          Text("Keep exploring",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),),
          SizedBox(height: 15,),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.black,
                  onPressed: () async {
                    // showSearch(
                    //     context: context,
                    //     delegate: CustomSearch()
                    // );
                  },
                  splashRadius: 17,
                  splashColor: Colors.lightBlueAccent,
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
          SizedBox(height: 15,),
          CarouselSlider(
            items: [
              Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: AssetImage('images/content1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: AssetImage('images/sach.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('images/back3.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('images/back4.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              height: 250.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 500),
              viewportFraction: 0.8,
            ),
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
              FlatButton(
                onPressed: (){
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

          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Continue Reading",
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


          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Trending books",
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
                                  child: Image(image: AssetImage('images/book3.png'),),
                                ),
                                title: 'Someone Like You',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Roaild Dahl',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book4.png'),),
                                ),
                                title: 'Great Expectations',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Charies Dickens',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book5.png'),),
                                ),
                                title: 'The Arsonist',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'J.D. Salinger',
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
                                title: 'Bước Chân Chậm Lại',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Hae Min',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book8.png'),),
                                ),
                                title: 'Bắt Trẻ Đồng Xanh',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'J.D. Salinger',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book11.png'),),
                                ),
                                title: 'Sapiens Lược Sử Loài Người',
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
                                title: 'Trưởng Thành Là Khi Nổi Buồn Cũng Có Deadline',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Writinman',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book12.png'),),
                                ),
                                title: 'Đắc Nhân Tâm',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Dale Carnegie',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book13.png'),),
                                ),
                                title: 'Tâm Lý Học Giao Tiếp',
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
                                  child: Image(image: AssetImage('images/book2.png'),),
                                ),
                                title: 'Lord of the Rings',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'J.R.R Tolkein',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book4.png'),),
                                ),
                                title: 'Great Expectations',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Charies Dickens',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book1.png'),),
                                ),
                                title: 'Catcher in the Rye',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'J.D. Salinger',
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
                                  child: Image(image: AssetImage('images/book9.png'),),
                                ),
                                title: 'Đọc Vị Bất Kỳ Ai',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'J.Lieberman',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book10.png'),),
                                ),
                                title: 'Tâm Lý Học Về Tiền',
                                subtitle: 'Flutter continues to improve and expand its horizons. '
                                    'This text should max out at two lines and clip',
                                author: 'Dash',
                                publishDate: 'Dec 28',
                                readDuration: '5 mins',
                              ),
                              CustomListItemTwo(
                                thumbnail: Container(
                                  child: Image(image: AssetImage('images/book11.png'),),
                                ),
                                title: 'Sapiens Lược Sử Loài Người',
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
        ],
      ),
    );

    Widget content3 = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Coming Soon",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const Image(image: AssetImage('images/book9.png'), width: 130,),
                    ),
                    SizedBox(height: 10,),
                    Text("Đọc Vị Bất Kỳ Ai    ", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 7,),
                    Text("TS.David J.Lieberman", style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),)
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const Image(image: AssetImage('images/book10.png'), width: 130,),
                    ),
                    SizedBox(height: 10,),
                    Text("Tâm Lý Học Về Tền", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 7,),
                    Text("Morgan Housel", style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),)
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const Image(image: AssetImage('images/book11.png'), width: 130,),
                    ),
                    SizedBox(height: 10,),
                    Text("Sapiens Lược Sử  ", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 7,),
                    Text("Yuval Noah Harari", style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),)
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const Image(image: AssetImage('images/book12.png'), width: 130,),
                    ),
                    SizedBox(height: 10,),
                    Text("Đắc Nhân Tâm      ", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 7,),
                    Text("Dale Carnegie", style: TextStyle(
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
    );
    //
    // Widget content4 = Container(
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text("hhahahaha",
    //         style: TextStyle(
    //           fontWeight: FontWeight.bold,
    //           fontSize: 28,
    //         ),),
    //       SizedBox(height: 15,),
    //       FutureBuilder<List<Books>>(
    //           future: books,
    //           builder: (context, snapshot) {
    //             if(snapshot.hasError){
    //               return Text("${snapshot.error}");
    //             } else if (snapshot.hasData){
    //               return Text('${snapshot.data}');
    //             }
    //             return CircularProgressIndicator();
    //           },
    //       ),
    //     ],
    //   ),
    // );


    return Scaffold(
      // appBar: AppBar(
      //  title: Text(widget.title),
      //   actions: [],
      // ),
      body: new ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(30, 30, 30, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                head,
                SizedBox(height: 25,),
                content1,
                SizedBox(height: 30,),
                content2,
                content3,
                SizedBox(height: 30,),
                // content4,

              ],
            ),
          )
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffe0e0e0),
        selectedItemColor: Color(0xffc62828),
        unselectedItemColor: Colors.black38,
        currentIndex: this.currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
          if(index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => History(title: "")));
          } else if (index == 2){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ListBook(title: "")));
          } else if (index == 3){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(title: "")));
          }
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history, ),
              label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark, ),
              label: 'Favorite',),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, ),
              label: 'User',
          ),
        ],
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (){
            query = '';
          },
          icon: Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          close(context, null);
        },
        icon: Icon(Icons.arrow_back),
    );
  }


  @override
  Widget buildSuggestions(BuildContext context)  {
    List<String> matchQuery = [];


    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result)
          );
        });
  }


  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
}

List<Books> parseBooks (String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Books>((json) => Books.fromJson(json)).toList();
}

Future<List<Books>> fetchBooks() async{
  final url1 = Uri.parse('https://6382330e9842ca8d3ca3bce2.mockapi.io/api/books');
  final response = await http.get(url1);
  if(response.statusCode == 200){
    return parseBooks(response.body);
  } else {
    throw Exception('Unable to fetch books from the rest API');
  }
}
