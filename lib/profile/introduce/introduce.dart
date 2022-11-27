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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  int _counter = 0;
  int currentIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  late bool _passwordVisible;
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {

    Widget head = new Container(
        child: Column(
          children: [
            Container(
              height: 400,
              width: 800,
              decoration: BoxDecoration(
                  color: Color(0XFF68545),
                  ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Column(
                      children: [

                        SizedBox(height: 20,),
                        ClipRRect(

                          child: const Image(image: AssetImage('images/book5.png'), width: 150,),
                        ),
                        SizedBox(height: 15,),
                        Text("The Arsonist", style: TextStyle(
                          fontSize: 20,fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 10,),
                        Text("Chioe Hooper", style: TextStyle(
                          fontSize: 20,


                        ),),
                        SizedBox(height: 7,),

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
          Text('About the author',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(height: 7,),
          Text('J.D. Salinger was an American writer, best known for his 1951 novel The Catcher in the Rye. Before its publi cation, Salinger published several short stories in Story magazine',style: TextStyle(fontSize: 18,),),
          SizedBox(height: 7,),
          Text('Overview',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(height: 7,),
          Text('The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951. It was originally intended for adu lts but is often read by adolescents for its theme of angst, alienation and as a critique......',style: TextStyle(fontSize: 18,),),
          SizedBox(height: 50,),

          ElevatedButton(
            onPressed: () {},
            child: Text('Start Reading'),
            style: ElevatedButton.styleFrom(
              primary:Colors.red,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
            ),
          ),

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

    );
  }
}
