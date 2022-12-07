import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:main/History/history.dart';
import 'package:main/profile/profile.dart';

import '../model/post.dart';
import '../network/network_request.dart';
import '../support/support.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() async {
  var url = Uri.parse('https://6382330e9842ca8d3ca3bce2.mockapi.io/api/books');
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

      home: const ListBook(title: ''),
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
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14.0,
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
                  fontSize: 14.0,
                  color: Colors.black,
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
        height: 125,
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

class ListBook extends StatefulWidget {
  const ListBook({Key? key, required this.title, }) : super(key: key);

  final String title;

  @override
  State<ListBook> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<ListBook>
    with TickerProviderStateMixin {
  int activePage = 1;
  late TabController _tabController;
  late PageController _pageController;
  List<Post> postData = [];

  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchPosts().then((dataFromServer) {
      setState(() {
        postData = dataFromServer;
      });
    });
    _tabController = TabController(length: 3, vsync: this);
  }


  @override
  Widget build(BuildContext context) {

    Widget content4 = SizedBox(
        height: 900,
        child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: postData.length,
            itemBuilder: (context, index){
              return Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${postData[index].name}'),
                      SizedBox(height: 20,),
                      Image.asset('${postData[index].avatar}'),
                      Text('${postData[index].avatar}')
                    ],
                  ),
                ),

              );
            })
    );


    Widget content2 = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.navigate_before_rounded, ),
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
                splashRadius: 17,
                splashColor: Colors.lightBlueAccent,
              ),
              Text("Continue Reading",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),),
            ],
          ),

          SizedBox(height: 18,),
          Container(
              child:Column(
                children: [
                  Card(
                      color: Colors.green[100],
                      shadowColor: Colors.blueGrey,
                      elevation: 20,
                    child: CustomListItemTwo(
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
                  ),
                  SizedBox(height: 10,),
                  Card(
                      color: Colors.green[100],
                      shadowColor: Colors.blueGrey,
                      elevation: 20,
                      child: CustomListItemTwo(
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
                  ),
                  SizedBox(height: 10,),
                  Card(
                      color: Colors.green[100],
                      shadowColor: Colors.blueGrey,
                      elevation: 20,
                      child:CustomListItemTwo(
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
                  ),
                  SizedBox(height: 10,),

                  Card(
                      color: Colors.green[100],
                      shadowColor: Colors.blueGrey,
                      elevation: 20,
                      child:CustomListItemTwo(
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
                  ),
                  SizedBox(height: 10,),

                  Card(
                      color: Colors.green[100],
                      shadowColor: Colors.blueGrey,
                      elevation: 20,
                      child:CustomListItemTwo(
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
                  ),
                  SizedBox(height: 10,),

                  Card(
                      color: Colors.green[100],
                      shadowColor: Colors.blueGrey,
                      elevation: 20,
                      child: CustomListItemTwo(
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
                  ),
                  SizedBox(height: 10,),

                  Card(
                      color: Colors.green[100],
                      shadowColor: Colors.blueGrey,
                      elevation: 20,
                      child: CustomListItemTwo(
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
                  ),
                  SizedBox(height: 10,),

                  Card(
                      color: Colors.green[100],
                      shadowColor: Colors.blueGrey,
                      elevation: 20,
                      child: CustomListItemTwo(
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
                  ),
                ],
              )
          ),

          SizedBox(height: 15,),
        ],
      ),
    );

    return Scaffold(
      body: new ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(30, 30, 30, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                content2,
                content4,
              ],
            ),
          )
        ],
      ),
    );
  }
}

