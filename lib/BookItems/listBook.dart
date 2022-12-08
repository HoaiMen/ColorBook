import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:main/History/history.dart';
import 'package:main/profile/profile.dart';
import 'package:main/readbook/readbook.dart';

import '../model/post.dart';
import '../network/network_request.dart';

void main() {

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
  static List<Post> postData = [];
  List<Post> display = List.from(postData);

  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchPosts().then((dataFromServer) {
      setState(() {
        postData = dataFromServer;
      });
    });
  }

  void updateList(String value){
    setState(() {
      display = postData.where((item) => item.name!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget content1 = Container(
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
          SizedBox(height: 15,),
        ],
      ),
    );

    Widget content2 = SizedBox(
        height: 900,
        child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: display.length,
            itemBuilder: (context, index) =>
              Card(
                color: Colors.green[100],
                shadowColor: Colors.blueGrey,
                elevation: 20,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ReadBook(title: "")));
                  },
                  child: CustomListItemTwo(
                    thumbnail: Container(
                      child: Image.asset(display[index].avatar!),
                    ),
                    title: '${display[index].name}',
                    subtitle: '${display[index].review}',
                    author: '${display[index].author}',
                    publishDate: 'Dec 28',
                    readDuration: '5 mins',
                  ),
                )
              )

            )
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
                content1,
                TextFormField(
                  onChanged: (value) => updateList(value),
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        color: Colors.black,
                        onPressed: ()  {   },
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
                SizedBox(height: 10,),
                content2,
              ],
            ),
          )
        ],
      ),
    );
  }
}


