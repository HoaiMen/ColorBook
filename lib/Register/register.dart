import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      home: const Register(title: ''),
    );
  }
}

class Register extends StatefulWidget {
  const Register({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Register> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController fullnameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  late bool _passwordVisible;
  @override
  void initState() {
    _passwordVisible = false;
  }
  void showFaileMessage(){
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Register"),
          content: Text("Successful account registration"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context, "OK");
            }, child: Text("Ok"))
          ],
        )
    );
  }

  void showPopupMenu() async {
    await showMenu(
      context: context,
      elevation: 8.0,
      position: RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),  //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            child: const Text('Báo cáo'), value: '1'),
        PopupMenuItem<String>(
            child: const Text('Phản hồi'), value: '2'),
      ],
    ).then<void>((itemSelected) async {
      if (itemSelected == null) return;
      if(itemSelected == "1"){
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
                  ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffB7B7B7),
                      shape: CircleBorder(
                          side: BorderSide(
                            width: 10,
                            color: Color(0xffb7b7b7),
                          )
                      ),
                    ),
                    child: SizedBox(
                        child: Column(
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
                          ],
                        )
                    ),
                  ),

                  Text("Register",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  IconButton(
                    icon: Icon(Icons.more_vert, ),
                    color: Colors.black,
                    onPressed: () async {
                      showPopupMenu();
                    },
                    splashRadius: 17,
                    splashColor: Colors.lightBlueAccent,
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [

                  Container(
                    height: 20,
                  ),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(200.0),
                    child: const Image(image: AssetImage('images/logo.png'), width: 100,),
                  ),

                  SizedBox(height: 10,),
                  Text("Color Store ", style: TextStyle(
                      fontSize: 50,
                      fontFamily: "DancingScript",
                      color: Colors.red
                  ),),
                  SizedBox(height: 10,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("If You Need Any Support ", style: TextStyle(
                          fontSize: 15,
                        ),),
                        Text(" Click Here", style: TextStyle(
                            fontSize: 15,
                            color: Colors.green
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );

    Widget form = Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 30),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'FullName',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )
                        )
                    ),
                    controller: fullnameController,
                    validator: (value) {
                      RegExp regex = RegExp(r'^.{2,20}$');
                      if (value!.isEmpty) {
                        return ("Vui lòng nhập đầy đủ họ tên");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Họ Tên không quá 20 kí tự");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      emailController.text = value!;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Enter Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )
                        )
                    ),
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Vui lòng nhập email");
                      }
                      if (!RegExp(
                          '^[a-zA-Z0-9+_.-]+@[a-z0-9A-Z.-]+[a-z]')
                          .hasMatch(value)) {
                        return ("Vui lòng nhập Email hợp lệ");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      emailController.text = value!;
                    },
                  ),
                  SizedBox(height: 20,),

                  TextFormField(
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black45,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )
                        )
                    ),

                    controller: passwordController,
                    validator: (value) {
                      RegExp regex = RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return ("Nhập mật khẩu của bạn");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Mật khẩu phải trên 6 kí tự");
                      }
                    },
                    onSaved: (value) {
                      passwordController.text = value!;
                    },
                    // Ẩn mật khẩu
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        print("aaaaaaaaa");
                        var fullname = fullnameController.text.trim();
                        var email = emailController.text.trim();
                        var password = passwordController.text.trim();

                        var url = Uri.parse(
                            'https://6382330e9842ca8d3ca3bce2.mockapi.io/api/users');
                        await http.post(url, body: {
                          "fullname": fullname,
                          "email": email,
                          "password": password
                          // "password": _password.text.trim()
                        });
                        showFaileMessage();
                      }

                      // if (_formKey.currentState!.validate()) {
                      //   var fullname = fullnameController.text.trim();
                      //   var email = emailController.text.trim();
                      //   var password = passwordController.text.trim();
                      //   var url = Uri.parse(
                      //       'https://6382330e9842ca8d3ca3bce2.mockapi.io/api/users');
                      //   await http.post(url, body: {
                      //     "fullname": fullname,
                      //     "email": email,
                      //     "password": password
                      //     // "password": _password.text.trim()
                      //   });
                      //   showFaileMessage();
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff00c853),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                        )
                    ),
                    child: SizedBox(
                      height: 50,
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Do You Have An Account? ", style: TextStyle(
                        color: Colors.black,
                      ),),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      )
                    ],
                  ),
                ],
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
        body: new ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(30, 30, 30, 60),
              child: Column(
                children: [
                  head,
                  form,
                ],
              ),
            )
          ],
        )
    );
  }
}