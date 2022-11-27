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
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ''),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage>
    with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController fullnameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final List<String> items = List<String>.generate( 5, (i) => i == 0 ?("Hot"):'$i');


  int currentIndex = 0;
  int _counter = 0;
  late TabController _tabController;
  late bool _passwordVisible;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _tabController = TabController(length: 3, vsync: this);
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


  @override
  Widget build(BuildContext context) {



    Widget tabbar = Scaffold(
      appBar:  AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.cloud_outlined),
            ),
            Tab(
              icon: Icon(Icons.beach_access_sharp),
            ),
            Tab(
              icon: Icon(Icons.brightness_5_sharp),
            ),
          ],
        ),
        title: Text("tabbar example"),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: Text("It's cloudy here"),
          ),
          Center(
            child: Text("It's rainy here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    );



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
                        Text("Soroushnrz",
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
          Text("History",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),),
          SizedBox(height: 15,),
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
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Most Recently Read",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Most Recently Read",
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
                    child: const Image(image: AssetImage('images/book6.png'), width: 140,),
                  ),
                  SizedBox(height: 10,),
                  Text("Bước Chân...", style: TextStyle(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(image: AssetImage('images/book7.png'), width: 140,),
                  ),
                  SizedBox(height: 10,),
                  Text("Trưởng Thành", style: TextStyle(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(image: AssetImage('images/book8.png'), width: 140,),
                  ),
                  SizedBox(height: 10,),
                  Text("Trưởng Thành", style: TextStyle(
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

            ],
          ),


          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recommended",
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
                    child: const Image(image: AssetImage('images/book1.png'), width: 140,),
                  ),
                  SizedBox(height: 10,),
                  Text("Catcher in the ...", style: TextStyle(
                    fontSize: 18,
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
                  Text("Someone Like...", style: TextStyle(
                    fontSize: 18,
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
                    fontSize: 18,
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
