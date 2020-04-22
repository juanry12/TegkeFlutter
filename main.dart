import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginBaru(),
      theme: ThemeData(
        primaryColor: Colors.black,
        buttonColor: Color.fromRGBO(255, 205, 0, 1),
        canvasColor: Colors.black,
        accentColor: Colors.black,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: Theme.of(context).textTheme.title.copyWith(
                color: Colors.white,
              ),
        ),
        textTheme: Theme.of(context).textTheme.copyWith(
              title: Theme.of(context).textTheme.title.copyWith(
                    color: Colors.white,
                  ),
            ),
      ),
    );
  }
}

class Touring extends StatefulWidget {
  @override
  _Touringstate createState() => _Touringstate();
}

class _Touringstate extends State<Touring> {
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: Container(
        height: SizeConfig.safeBlockVertical * 105,
        width: SizeConfig.safeBlockHorizontal * 125,
        child: PageView(
          children: <Widget>[
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class EnterExitRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  final Widget backPage;
  final Widget kembali;
  EnterExitRoute({this.exitPage, this.enterPage, this.backPage, this.kembali})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              enterPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: new Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(-1.0, 0.0),
                ).animate(animation),
                child: exitPage,
              ),
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: enterPage,
              ),
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(-1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: backPage,
              ),
              SlideTransition(
                position: new Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(1.0, 0.0),
                ).animate(animation),
                child: kembali,
              ),
            ],
          ),
        );
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: Image.asset(
                  'images/dummy-2.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Image.asset(
                  'images/logo-kecil.png',
                  scale: 7,
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                    child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 7,
                            width: SizeConfig.safeBlockHorizontal * 85,
                            child: TextField(
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockVertical * 2.5,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(59, 59, 59, 1),
                                hintText: 'Email',
                                contentPadding: const EdgeInsets.only(
                                    left: 20, top: 30, bottom: 0),
                                hintStyle: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: SizeConfig.safeBlockVertical * 2.5,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(59, 59, 59, 1),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(59, 59, 59, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 7,
                            width: SizeConfig.safeBlockHorizontal * 85,
                            child: TextField(
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockVertical * 2.5,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(59, 59, 59, 1),
                                hintText: 'Password',
                                contentPadding: const EdgeInsets.only(
                                    left: 20, top: 30, bottom: 0),
                                hintStyle: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: SizeConfig.safeBlockVertical * 2.5,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(59, 59, 59, 1),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(59, 59, 59, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.all(20),
                            height: SizeConfig.safeBlockVertical * 10,
                            width: double.infinity,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: SizeConfig.safeBlockVertical * 6,
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color.fromRGBO(58, 85, 159, 1),
                                    ),
                                    child: FittedBox(
                                      alignment: Alignment.center,
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            'images/fb.png',
                                            scale: 8,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Sign in with Facebook',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Raleway',
                                            ),
                                          ),
                                        ],
                                      ),
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: SizeConfig.safeBlockVertical * 6,
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color.fromRGBO(211, 72, 54, 1),
                                    ),
                                    child: FittedBox(
                                      alignment: Alignment.center,
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            'images/googleplus.png',
                                            scale: 10,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Sign in with Google',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Raleway',
                                            ),
                                          ),
                                        ],
                                      ),
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: SizeConfig.safeBlockVertical * 5.5,
                            width: SizeConfig.safeBlockHorizontal * 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color.fromRGBO(255, 205, 0, 1),
                            ),
                            child: InkWell(
                                child: FittedBox(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.input,
                                        size: 25,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Sign In',
                                        style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  3.5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  fit: BoxFit.scaleDown,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Tour1()),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                                color: Colors.white,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Don\'t have an account? ',
                                    style: TextStyle(
                                      fontFamily: 'Raleway',
                                    )),
                                TextSpan(
                                    text: 'Register.',
                                    style: TextStyle(
                                      fontFamily: 'Raleway',
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          EnterExitRoute(enterPage: Register()),
                                        );
                                      }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )))
          ],
        ),
      ),
    );
  }
}

class LoginBaru extends StatefulWidget {
  @override
  _LoginBaruState createState() => _LoginBaruState();
}

class _LoginBaruState extends State<LoginBaru> {
  bool _obscureText = true;

  String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: Container(
          child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              child: Image.asset(
                'images/dummy-2.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Image.asset(
                'images/logo-kecil.png',
                scale: 7,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Email',
                                  contentPadding: EdgeInsets.only(
                                      left: 20, top: 30, bottom: 0),
                                  fillColor: Color.fromRGBO(59, 59, 59, 1),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  hintStyle: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                validator: (val) =>
                                    val.length < 6 ? 'Email too short.' : null,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Password',
                                  contentPadding: EdgeInsets.only(
                                      left: 20, top: 30, bottom: 0),
                                  fillColor: Color.fromRGBO(59, 59, 59, 1),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  hintStyle: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                validator: (val) => val.length < 6
                                    ? 'Password too short.'
                                    : null,
                                onSaved: (val) => _password = val,
                                obscureText: _obscureText,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    height: SizeConfig.safeBlockVertical * 10,
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: SizeConfig.safeBlockVertical * 6,
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color.fromRGBO(58, 85, 159, 1),
                            ),
                            child: FittedBox(
                              alignment: Alignment.center,
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'images/fb.png',
                                    scale: 8,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Sign in with Facebook',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                ],
                              ),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: SizeConfig.safeBlockVertical * 6,
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color.fromRGBO(211, 72, 54, 1),
                            ),
                            child: FittedBox(
                              alignment: Alignment.center,
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'images/googleplus.png',
                                    scale: 10,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Sign in with Google',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                ],
                              ),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: SizeConfig.safeBlockVertical * 5.5,
                    width: SizeConfig.safeBlockHorizontal * 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromRGBO(255, 205, 0, 1),
                    ),
                    child: InkWell(
                        child: FittedBox(
                          alignment: Alignment.center,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.input,
                                size: 25,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Sign In',
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 3.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Tour1()),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                        color: Colors.white,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                            )),
                        TextSpan(
                            text: 'Register.',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  EnterExitRoute(enterPage: Register()),
                                );
                              }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      )),
    );
  }
}

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: Image.asset(
                  'images/dummy-2.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Image.asset(
                  'images/logo-kecil.png',
                  scale: 7,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                              height: SizeConfig.safeBlockVertical * 7,
                              width: SizeConfig.safeBlockHorizontal * 85,
                              child: TextField(
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockVertical * 2.5,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromRGBO(59, 59, 59, 1),
                                  hintText: 'Email',
                                  contentPadding: const EdgeInsets.only(
                                    left: 20,
                                    top: 30.0,
                                    bottom: 0,
                                  ),
                                  hintStyle: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize:
                                        SizeConfig.safeBlockVertical * 2.5,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(59, 59, 59, 1),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(59, 59, 59, 1)),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 7,
                            width: SizeConfig.safeBlockHorizontal * 85,
                            child: TextField(
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockVertical * 2.5,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(59, 59, 59, 1),
                                hintText: 'Password',
                                contentPadding: const EdgeInsets.only(
                                  left: 20,
                                  top: 30.0,
                                  bottom: 0,
                                ),
                                hintStyle: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: SizeConfig.safeBlockVertical * 2.5,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(59, 59, 59, 1),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(59, 59, 59, 1)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 7,
                            width: SizeConfig.safeBlockHorizontal * 85,
                            child: TextField(
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockVertical * 2.5,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(59, 59, 59, 1),
                                hintText: 'Confirm Password',
                                contentPadding: const EdgeInsets.only(
                                  left: 20,
                                  top: 30.0,
                                  bottom: 0,
                                ),
                                hintStyle: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: SizeConfig.safeBlockVertical * 2.5,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(59, 59, 59, 1),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(59, 59, 59, 1)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.all(20),
                            height: SizeConfig.safeBlockVertical * 10,
                            width: double.infinity,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: SizeConfig.safeBlockVertical * 6,
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color.fromRGBO(58, 85, 159, 1),
                                    ),
                                    child: FittedBox(
                                      alignment: Alignment.center,
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            'images/fb.png',
                                            scale: 8,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Sign Up with Facebook',
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: SizeConfig.safeBlockVertical * 6,
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color.fromRGBO(211, 72, 54, 1),
                                    ),
                                    child: FittedBox(
                                      alignment: Alignment.center,
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            'images/googleplus.png',
                                            scale: 10,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Sign Up with Google',
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: SizeConfig.safeBlockVertical * 5.5,
                            width: SizeConfig.safeBlockHorizontal * 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color.fromRGBO(255, 205, 0, 1),
                            ),
                            child: InkWell(
                                child: FittedBox(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.input,
                                        size: 25,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  3.5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  fit: BoxFit.scaleDown,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Formregister()),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text.rich(TextSpan(
                            style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                              color: Colors.white,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Already have an account? ',
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                ),
                              ),
                              TextSpan(
                                  text: 'Login.',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login()),
                                      );
                                    }),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tour1 extends StatelessWidget {
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: Container(
        height: SizeConfig.safeBlockVertical * 105,
        width: SizeConfig.safeBlockHorizontal * 125,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 95,
                  ),
                  Container(
                    height: SizeConfig.safeBlockVertical * 25,
                    width: SizeConfig.safeBlockHorizontal * 30,
                    color: Colors.black,
                    child: Image.asset(
                      'images/logo-kecil.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'WELCOME',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: SizeConfig.safeBlockVertical * 6,
                        color: Color.fromRGBO(255, 205, 0, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Tegke (Teknologi Dibenekke)',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: SizeConfig.safeBlockVertical * 2.5,
                        color: Color.fromRGBO(225, 225, 225, 1),
                      ),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'platform ',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: SizeConfig.safeBlockVertical * 2.5,
                            color: Color.fromRGBO(225, 225, 225, 1),
                          ),
                        ),
                        TextSpan(
                          text: 'hardware ',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: SizeConfig.safeBlockVertical * 2.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '& ',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: SizeConfig.safeBlockVertical * 2.5,
                            color: Color.fromRGBO(225, 225, 225, 1),
                          ),
                        ),
                        TextSpan(
                          text: 'software',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: SizeConfig.safeBlockVertical * 2.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 25,
                    height: SizeConfig.safeBlockHorizontal * 1,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 35),
                    color: Color.fromRGBO(255, 205, 0, 1),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text.rich(
                    TextSpan(
                      text: '"servis gak harus ribet. kalo bisa',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: SizeConfig.safeBlockVertical * 2,
                        color: Color.fromRGBO(255, 205, 0, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'dibikin gampang kenapa ribet."',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: SizeConfig.safeBlockVertical * 2,
                        color: Color.fromRGBO(255, 205, 0, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(50)),
                        color: Color.fromRGBO(255, 205, 0, 1),
                        image: DecorationImage(
                          image: AssetImage(
                            'images/bg-2.png',
                          ),
                          alignment: Alignment.centerRight,
                        ),
                      ),
                      child: Container(
                        height: SizeConfig.safeBlockVertical * 5.5,
                        width: SizeConfig.safeBlockHorizontal * 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black,
                        ),
                        child: InkWell(
                          child: FittedBox(
                            alignment: Alignment.center,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 4,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  size: SizeConfig.safeBlockVertical * 3,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            fit: BoxFit.scaleDown,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                EnterExitRoute(
                                    exitPage: this, enterPage: Tour2()));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tour2 extends StatelessWidget {
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: Container(
        height: SizeConfig.safeBlockVertical * 105,
        width: SizeConfig.safeBlockHorizontal * 125,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 120,
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 25,
              width: SizeConfig.safeBlockHorizontal * 30,
              color: Colors.black,
              child: Image.asset(
                'images/logo-kecil.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 50,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromRGBO(255, 205, 0, 1),
                        ),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        height:
                                            SizeConfig.safeBlockVertical * 12,
                                        width:
                                            SizeConfig.safeBlockHorizontal * 8,
                                        padding: EdgeInsets.only(right: 45),
                                        child: Container(
                                          height:
                                              SizeConfig.safeBlockVertical * 6,
                                          width:
                                              SizeConfig.safeBlockHorizontal *
                                                  8,
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'images/bisnistime.png',
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(right: 2),
                                        height:
                                            SizeConfig.safeBlockVertical * 12,
                                        width:
                                            SizeConfig.safeBlockHorizontal * 8,
                                        child: Image.asset(
                                          'images/bg-4.png',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 5),
                                      height: SizeConfig.safeBlockVertical * 3,
                                      width:
                                          SizeConfig.safeBlockHorizontal * 35,
                                      child: FittedBox(
                                        child: Text(
                                          'Reservation',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'Raleway',
                                            fontSize:
                                                SizeConfig.safeBlockVertical *
                                                    10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: SizeConfig.safeBlockVertical * 15,
                                    width: SizeConfig.safeBlockHorizontal * 50,
                                    padding: EdgeInsets.only(
                                      left: 2,
                                    ),
                                    child: FittedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Don\'t have luxury of waiting',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'for your turn? You don\'t need to',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'worry anymore! You can make',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'a reservation through our app',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'and decided agreed time',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'and price to your liking',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(255, 205, 0, 1),
                            ),
                            child: Icon(
                              Icons.navigate_next,
                              size: 45,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                EnterExitRoute(
                                    exitPage: this, enterPage: Tour3()));
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      top: 40,
                      bottom: 5,
                      right: 79,
                      left: 79,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 4,
                            margin: EdgeInsets.only(
                              right: 5,
                              left: 5,
                            ),
                            color: Color.fromRGBO(255, 205, 0, 1),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 4,
                            margin: EdgeInsets.only(
                              right: 5,
                              left: 5,
                            ),
                            color: Color.fromRGBO(51, 51, 51, 1),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 4,
                            margin: EdgeInsets.only(
                              right: 5,
                              left: 5,
                            ),
                            color: Color.fromRGBO(51, 51, 51, 1),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 4,
                            margin: EdgeInsets.only(
                              right: 5,
                              left: 5,
                            ),
                            color: Color.fromRGBO(51, 51, 51, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Step 1 of 4',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: SizeConfig.safeBlockVertical * 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tour3 extends StatelessWidget {
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: Container(
        height: SizeConfig.safeBlockVertical * 105,
        width: SizeConfig.safeBlockHorizontal * 125,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 120,
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 25,
              width: SizeConfig.safeBlockHorizontal * 30,
              color: Colors.black,
              child: Image.asset(
                'images/logo-kecil.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 50,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: InkWell(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(255, 205, 0, 1),
                            ),
                            child: Icon(
                              Icons.navigate_before,
                              size: 45,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                EnterExitRoute(
                                  kembali: this,
                                  backPage: Tour2(),
                                ));
                          }),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromRGBO(255, 205, 0, 1),
                        ),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        height:
                                            SizeConfig.safeBlockVertical * 12,
                                        width:
                                            SizeConfig.safeBlockHorizontal * 8,
                                        padding: EdgeInsets.only(right: 45),
                                        child: Container(
                                          height:
                                              SizeConfig.safeBlockVertical * 6,
                                          width:
                                              SizeConfig.safeBlockHorizontal *
                                                  8,
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'images/mapmarked.png',
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(right: 2),
                                        height:
                                            SizeConfig.safeBlockVertical * 12,
                                        width:
                                            SizeConfig.safeBlockHorizontal * 8,
                                        child: Image.asset(
                                          'images/bg-4.png',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 5, right: 40),
                                      height: SizeConfig.safeBlockVertical * 3,
                                      width:
                                          SizeConfig.safeBlockHorizontal * 35,
                                      child: FittedBox(
                                        child: Text(
                                          'Meetup',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'Raleway',
                                            fontSize:
                                                SizeConfig.safeBlockVertical *
                                                    10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: SizeConfig.safeBlockVertical * 15,
                                    width: SizeConfig.safeBlockHorizontal * 50,
                                    padding: EdgeInsets.only(
                                      left: 2,
                                    ),
                                    child: FittedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Need to find a service shop to',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'repair your device? You don\'t',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'need to do that anymore! Just',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'make a reservation and you can',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'meet our tech guy',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'anywhere you want to!',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(255, 205, 0, 1),
                            ),
                            child: Icon(
                              Icons.navigate_next,
                              size: 45,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                EnterExitRoute(
                                    exitPage: this, enterPage: Tour4()));
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      top: 40,
                      bottom: 5,
                      right: 79,
                      left: 79,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 4,
                            margin: EdgeInsets.only(
                              right: 5,
                              left: 5,
                            ),
                            color: Color.fromRGBO(51, 51, 51, 1),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 4,
                            margin: EdgeInsets.only(
                              right: 5,
                              left: 5,
                            ),
                            color: Color.fromRGBO(255, 205, 0, 1),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 4,
                            margin: EdgeInsets.only(
                              right: 5,
                              left: 5,
                            ),
                            color: Color.fromRGBO(51, 51, 51, 1),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 4,
                            margin: EdgeInsets.only(
                              right: 5,
                              left: 5,
                            ),
                            color: Color.fromRGBO(51, 51, 51, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Step 2 of 4',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: SizeConfig.safeBlockVertical * 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tour4 extends StatelessWidget {
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: Container(
        height: SizeConfig.safeBlockVertical * 105,
        width: SizeConfig.safeBlockHorizontal * 125,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 120,
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 25,
              width: SizeConfig.safeBlockHorizontal * 30,
              color: Colors.black,
              child: Image.asset(
                'images/logo-kecil.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 50,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: InkWell(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(255, 205, 0, 1),
                            ),
                            child: Icon(
                              Icons.navigate_before,
                              size: 45,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                EnterExitRoute(
                                  kembali: this,
                                  backPage: Tour3(),
                                ));
                          }),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromRGBO(255, 205, 0, 1),
                        ),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        height:
                                            SizeConfig.safeBlockVertical * 12,
                                        width:
                                            SizeConfig.safeBlockHorizontal * 8,
                                        padding: EdgeInsets.only(right: 45),
                                        child: Container(
                                          height:
                                              SizeConfig.safeBlockVertical * 6,
                                          width:
                                              SizeConfig.safeBlockHorizontal *
                                                  8,
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'images/tasks.png',
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(right: 2),
                                        height:
                                            SizeConfig.safeBlockVertical * 12,
                                        width:
                                            SizeConfig.safeBlockHorizontal * 8,
                                        child: Image.asset(
                                          'images/bg-4.png',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 5, right: 20),
                                      height: SizeConfig.safeBlockVertical * 3,
                                      width:
                                          SizeConfig.safeBlockHorizontal * 35,
                                      child: FittedBox(
                                        child: Text(
                                          'Checking',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'Raleway',
                                            fontSize:
                                                SizeConfig.safeBlockVertical *
                                                    10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: SizeConfig.safeBlockVertical * 15,
                                    width: SizeConfig.safeBlockHorizontal * 50,
                                    padding: EdgeInsets.only(
                                      left: 2,
                                      top: 10,
                                    ),
                                    child: FittedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Our tech guy will check and',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'figure out the best solution for',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'your device!',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(255, 205, 0, 1),
                            ),
                            child: Icon(
                              Icons.navigate_next,
                              size: 45,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                EnterExitRoute(
                                    exitPage: this, enterPage: Tour5()));
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      top: 40,
                      bottom: 5,
                      right: 79,
                      left: 79,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 4,
                            margin: EdgeInsets.only(
                              right: 5,
                              left: 5,
                            ),
                            color: Color.fromRGBO(51, 51, 51, 1),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 4,
                            margin: EdgeInsets.only(
                              right: 5,
                              left: 5,
                            ),
                            color: Color.fromRGBO(51, 51, 51, 1),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 4,
                            margin: EdgeInsets.only(
                              right: 5,
                              left: 5,
                            ),
                            color: Color.fromRGBO(255, 205, 0, 1),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 4,
                            margin: EdgeInsets.only(
                              right: 5,
                              left: 5,
                            ),
                            color: Color.fromRGBO(51, 51, 51, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Step 3 of 4',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: SizeConfig.safeBlockVertical * 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tour5 extends StatelessWidget {
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: Container(
        height: SizeConfig.safeBlockVertical * 105,
        width: SizeConfig.safeBlockHorizontal * 125,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 120,
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 25,
              width: SizeConfig.safeBlockHorizontal * 30,
              color: Colors.black,
              child: Image.asset(
                'images/logo-kecil.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 50,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: InkWell(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(255, 205, 0, 1),
                            ),
                            child: Icon(
                              Icons.navigate_before,
                              size: 45,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              EnterExitRoute(
                                kembali: this,
                                backPage: Tour4(),
                              ),
                            );
                          }),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromRGBO(255, 205, 0, 1),
                        ),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        height:
                                            SizeConfig.safeBlockVertical * 12,
                                        width:
                                            SizeConfig.safeBlockHorizontal * 8,
                                        padding: EdgeInsets.only(right: 45),
                                        child: Container(
                                          height:
                                              SizeConfig.safeBlockVertical * 6,
                                          width:
                                              SizeConfig.safeBlockHorizontal *
                                                  8,
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'images/tools.png',
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(right: 2),
                                        height:
                                            SizeConfig.safeBlockVertical * 12,
                                        width:
                                            SizeConfig.safeBlockHorizontal * 8,
                                        child: Image.asset(
                                          'images/bg-4.png',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 5, right: 40),
                                      height: SizeConfig.safeBlockVertical * 3,
                                      width:
                                          SizeConfig.safeBlockHorizontal * 35,
                                      child: FittedBox(
                                        child: Text(
                                          'Fixing',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'Raleway',
                                            fontSize:
                                                SizeConfig.safeBlockVertical *
                                                    10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: SizeConfig.safeBlockVertical * 15,
                                    width: SizeConfig.safeBlockHorizontal * 50,
                                    padding: EdgeInsets.only(left: 2, top: 10),
                                    child: FittedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'We got some techno wizards',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'to fix your issues in an instant',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'and with precision. so you',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'don\'t need to wait and worry for',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'a prolonged time',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Raleway',
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(255, 205, 0, 1),
                            ),
                            child: Icon(
                              Icons.navigate_next,
                              size: 45,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                            Navigator.pushReplacement(
                                context,
                                EnterExitRoute(
                                    exitPage: this, enterPage: Menu()));
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      top: 40,
                      bottom: 5,
                      right: 79,
                      left: 79,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 4,
                            margin: EdgeInsets.only(
                              right: 5,
                              left: 5,
                            ),
                            color: Color.fromRGBO(51, 51, 51, 1),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 4,
                            margin: EdgeInsets.only(
                              right: 5,
                              left: 5,
                            ),
                            color: Color.fromRGBO(51, 51, 51, 1),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 4,
                            margin: EdgeInsets.only(
                              right: 5,
                              left: 5,
                            ),
                            color: Color.fromRGBO(51, 51, 51, 1),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 4,
                            margin: EdgeInsets.only(
                              right: 5,
                              left: 5,
                            ),
                            color: Color.fromRGBO(255, 205, 0, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Step 4 of 4',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: SizeConfig.safeBlockVertical * 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Formregister extends StatefulWidget {
  @override
  _Formregisterstate createState() => _Formregisterstate();
}

class _Formregisterstate extends State<Formregister> {
  bool checkBoxValue = false;
  int selectedRadio;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: Container(
        height: SizeConfig.safeBlockVertical * 105,
        width: SizeConfig.safeBlockHorizontal * 125,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 90,
            ),
            Container(
              alignment: Alignment.center,
              height: SizeConfig.safeBlockVertical * 10,
              width: SizeConfig.safeBlockHorizontal * 20,
              child: Image.asset(
                'images/logo-kecil.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: SizeConfig.safeBlockVertical * 3,
              width: SizeConfig.safeBlockHorizontal * 90,
              child: Row(
                children: <Widget>[
                  Container(
                    height: SizeConfig.safeBlockVertical * 2,
                    width: SizeConfig.safeBlockHorizontal * 3,
                    margin: EdgeInsets.only(left: 10),
                    child: Image.asset(
                      'images/user.png',
                      fit: BoxFit.contain,
                      color: Color.fromRGBO(255, 205, 0, 1),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: FittedBox(
                      child: Text(
                        'Full Name',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 5,
              width: SizeConfig.safeBlockHorizontal * 85,
              child: TextField(
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockVertical * 2.5,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(59, 59, 59, 1),
                  hintText: 'Full Name',
                  contentPadding:
                      EdgeInsets.only(left: 16, top: 25, bottom: 10),
                  hintStyle: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: SizeConfig.safeBlockVertical * 2,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(59, 59, 59, 1),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(255, 205, 0, 0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: SizeConfig.safeBlockVertical * 3,
              width: SizeConfig.safeBlockHorizontal * 90,
              child: Row(
                children: <Widget>[
                  Container(
                    height: SizeConfig.safeBlockVertical * 3,
                    width: SizeConfig.safeBlockHorizontal * 4,
                    margin: EdgeInsets.only(left: 10),
                    child: FittedBox(
                      child: Icon(
                        Icons.phone,
                        color: Color.fromRGBO(255, 205, 0, 1),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Phone Number',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 5,
              width: SizeConfig.safeBlockHorizontal * 85,
              child: TextField(
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockVertical * 2.5,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(59, 59, 59, 1),
                  hintText: 'Phone Number',
                  contentPadding: EdgeInsets.only(
                    left: 16,
                    top: 25,
                    bottom: 10,
                  ),
                  hintStyle: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: SizeConfig.safeBlockVertical * 2,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(59, 59, 59, 1),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(59, 59, 59, 1),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: SizeConfig.safeBlockVertical * 3,
              width: SizeConfig.safeBlockHorizontal * 90,
              child: Row(
                children: <Widget>[
                  Container(
                    height: SizeConfig.safeBlockVertical * 3,
                    width: SizeConfig.safeBlockHorizontal * 4,
                    margin: EdgeInsets.only(left: 10),
                    child: FittedBox(
                      child: Icon(
                        Icons.location_on,
                        color: Color.fromRGBO(255, 205, 0, 1),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Address',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 5,
              width: SizeConfig.safeBlockHorizontal * 85,
              child: TextField(
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockVertical * 2.5,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(59, 59, 59, 1),
                  hintText: 'Address',
                  contentPadding:
                      EdgeInsets.only(left: 16, top: 25, bottom: 10),
                  hintStyle: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: SizeConfig.safeBlockVertical * 2,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(59, 59, 59, 1),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: SizeConfig.safeBlockVertical * 3,
              width: SizeConfig.safeBlockHorizontal * 90,
              child: Row(
                children: <Widget>[
                  Container(
                    height: SizeConfig.safeBlockVertical * 3,
                    width: SizeConfig.safeBlockHorizontal * 4,
                    margin: EdgeInsets.only(left: 10),
                    child: FittedBox(
                      child: Icon(
                        Icons.verified_user,
                        color: Color.fromRGBO(255, 205, 0, 1),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Gender',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 3,
              width: SizeConfig.safeBlockHorizontal * 85,
              child: Row(
                children: <Widget>[
                  Container(
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Color.fromRGBO(255, 205, 0, 1),
                      ),
                      child: Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: selectedRadio,
                            activeColor: Color.fromRGBO(255, 205, 0, 1),
                            onChanged: (val) {
                              print('Radio $val');
                              setSelectedRadio(val);
                            },
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Male',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    color: Color.fromRGBO(255, 205, 0, 1),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 5,
                                  ),
                                  height: SizeConfig.safeBlockVertical * 2,
                                  width: SizeConfig.safeBlockHorizontal * 3,
                                  child: Image.asset(
                                    'image/male.png',
                                    fit: BoxFit.contain,
                                    color: Color.fromRGBO(255, 205, 0, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 40),
                          child: Theme(
                            data: ThemeData(
                              unselectedWidgetColor:
                                  Color.fromRGBO(255, 205, 0, 1),
                            ),
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  value: 2,
                                  groupValue: selectedRadio,
                                  activeColor: Color.fromRGBO(255, 205, 0, 1),
                                  onChanged: (val) {
                                    print('Radio $val');
                                    setSelectedRadio(val);
                                  },
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Female',
                                        style: TextStyle(
                                          fontFamily: 'Raleway',
                                          color: Color.fromRGBO(255, 205, 0, 1),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        height:
                                            SizeConfig.safeBlockVertical * 2,
                                        width:
                                            SizeConfig.safeBlockHorizontal * 3,
                                        child: Image.asset(
                                          'images/female.png',
                                          fit: BoxFit.contain,
                                          color: Color.fromRGBO(255, 205, 0, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 3,
              width: SizeConfig.safeBlockHorizontal * 90,
              child: Row(
                children: <Widget>[
                  Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Color.fromRGBO(255, 205, 0, 1),
                    ),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: checkBoxValue,
                          activeColor: Color.fromRGBO(255, 205, 0, 1),
                          checkColor: Colors.black,
                          onChanged: (newValue) {
                            setState(() {
                              checkBoxValue = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'I agree with ',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 16,
                            color: Color.fromRGBO(255, 205, 0, 1),
                          ),
                        ),
                        TextSpan(
                          text: 'terms',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 16,
                            color: Color.fromRGBO(6, 65, 132, 1),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 5,
              width: SizeConfig.safeBlockHorizontal * 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color.fromRGBO(255, 205, 0, 1),
              ),
              child: InkWell(
                child: FittedBox(
                  alignment: Alignment.center,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: SizeConfig.safeBlockVertical * 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  fit: BoxFit.scaleDown,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServicePhone extends StatefulWidget {
  @override
  _ServicePhoneState createState() => _ServicePhoneState();
}

class _ServicePhoneState extends State<ServicePhone> {
  int _current = 0;
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          child: Row(
            children: <Widget>[
              Image.asset(
                'images/logo-kecil.png',
                fit: BoxFit.contain,
                height: SizeConfig.safeBlockVertical * 9,
                width: SizeConfig.safeBlockHorizontal * 9,
              ),
              SizedBox(
                width: 15,
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 5,
                width: SizeConfig.safeBlockHorizontal * 65,
                child: TextField(
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockVertical * 2.5,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(59, 59, 59, 1),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color.fromRGBO(165, 165, 165, 1),
                    ),
                    hintText: 'Find Services...',
                    contentPadding: EdgeInsets.only(left: 20, top: 30),
                    hintStyle: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: SizeConfig.safeBlockVertical * 2,
                      color: Color.fromRGBO(165, 165, 165, 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(59, 59, 59, 1),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(59, 59, 59, 1),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Image.asset(
                'images/voucher.png',
                fit: BoxFit.contain,
                height: SizeConfig.safeBlockVertical * 9,
                width: SizeConfig.safeBlockHorizontal * 9,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: SizeConfig.safeBlockVertical * 92.5,
        width: SizeConfig.safeBlockHorizontal * 125,
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Container(
              height: SizeConfig.safeBlockVertical * 20,
              width: SizeConfig.safeBlockHorizontal * double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(255, 205, 0, 1),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: FittedBox(
                              alignment: Alignment.bottomRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text.rich(
                                    TextSpan(
                                      text: 'Phone',
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.safeBlockVertical * 4,
                                      ),
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: 'Services',
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.safeBlockVertical * 4,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: SizeConfig.safeBlockVertical * 3,
                                width: SizeConfig.safeBlockHorizontal * 35,
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Image.asset(
                                          'images/toolsbaru.png',
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Image.asset(
                                          'images/sapu.png',
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Image.asset(
                                          'images/awan.png',
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'images/service-phonebaru.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 5,
              width: SizeConfig.safeBlockHorizontal * double.infinity,
              child: Row(
                children: <Widget>[
                  Container(
                    height: SizeConfig.safeBlockVertical * 0.5,
                    width: SizeConfig.safeBlockHorizontal * 8,
                    margin: EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                      left: 20,
                      right: 0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(255, 205, 0, 1),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Text(
                      'Services List',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: SizeConfig.safeBlockVertical * 2.5,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 15,
              width: SizeConfig.safeBlockHorizontal * double.infinity,
              margin: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 205, 0, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                Expanded(flex: 1, child: Container()),
                                Expanded(
                                  flex: 1,
                                  child: Image.asset('images/tools.png'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: FittedBox(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text.rich(
                                      TextSpan(
                                        text: 'Fixing',
                                        style: TextStyle(
                                          fontFamily: 'Raleway',
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.safeBlockVertical * 2,
                                        ),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: 'Hardware',
                                        style: TextStyle(
                                          fontFamily: 'Raleway',
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.safeBlockVertical * 2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 205, 0, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                Expanded(flex: 1, child: Container()),
                                Expanded(
                                  flex: 1,
                                  child: Image.asset('images/awan.png'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: FittedBox(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text.rich(
                                      TextSpan(
                                        text: 'Install',
                                        style: TextStyle(
                                          fontFamily: 'Raleway',
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.safeBlockVertical * 2,
                                        ),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: 'Software',
                                        style: TextStyle(
                                          fontFamily: 'Raleway',
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.safeBlockVertical * 2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 15,
              width: SizeConfig.safeBlockHorizontal * double.infinity,
              margin: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(255, 205, 0, 1),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                Expanded(flex: 1, child: Container()),
                                Expanded(
                                  flex: 1,
                                  child: Image.asset('images/sapu.png'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: FittedBox(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text.rich(
                                      TextSpan(
                                        text: 'Phone',
                                        style: TextStyle(
                                            fontFamily: 'Raleway',
                                            color: Colors.black,
                                            fontSize:
                                                SizeConfig.safeBlockVertical *
                                                    2),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: 'Care',
                                        style: TextStyle(
                                            fontFamily: 'Raleway',
                                            color: Colors.black,
                                            fontSize:
                                                SizeConfig.safeBlockVertical *
                                                    2),
                                      ),
                                    ),
                                  ],
                                ),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServicePhone2 extends StatefulWidget {
  @override
  _ServicePhoneState2 createState() => _ServicePhoneState2();
}

class _ServicePhoneState2 extends State<ServicePhone2> {
  int _current = 0;
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          child: Row(
            children: <Widget>[
              Icon(
                Icons.navigate_before,
                color: Color.fromRGBO(255, 205, 0, 1),
                size: SizeConfig.safeBlockVertical * 5,
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 5,
                width: SizeConfig.safeBlockHorizontal * 65,
                child: TextField(
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockVertical * 2.5,
                      color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(59, 59, 59, 1),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color.fromRGBO(165, 165, 165, 1),
                    ),
                    hintText: 'Find services...',
                    contentPadding: const EdgeInsets.only(
                      left: 20,
                      top: 30.0,
                      bottom: 0,
                    ),
                    hintStyle: TextStyle(
                      fontSize: SizeConfig.safeBlockVertical * 2,
                      color: Color.fromRGBO(165, 165, 165, 1),
                      fontFamily: 'Raleway',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(59, 59, 59, 1),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(59, 59, 59, 1)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Image.asset(
                'images/voucher.png',
                fit: BoxFit.contain,
                height: SizeConfig.safeBlockVertical * 9,
                width: SizeConfig.safeBlockHorizontal * 9,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: SizeConfig.safeBlockVertical * 92.5,
        width: SizeConfig.safeBlockHorizontal * 125,
        child: Column(
          children: <Widget>[
            Container(
              height: SizeConfig.safeBlockVertical * 15,
              width: SizeConfig.safeBlockHorizontal * double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(255, 205, 0, 1),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'images/tools.png',
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text.rich(
                            TextSpan(
                              text: 'Fixing',
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                color: Colors.black,
                                fontSize: SizeConfig.safeBlockVertical * 4,
                              ),
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: 'Hardware',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.safeBlockVertical * 4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              height: SizeConfig.safeBlockVertical * 10,
              width: SizeConfig.safeBlockHorizontal * double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text.rich(
                    TextSpan(
                      text: 'TEGKE Service that focus',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                      ),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'on your hardware problems',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 50,
              width: SizeConfig.safeBlockHorizontal * double.infinity,
              padding: EdgeInsets.all(40),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(255, 205, 0, 1),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.blue,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: InkWell(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text.rich(
                                        TextSpan(
                                          text: 'I don\'t know the problems,',
                                          style: TextStyle(
                                            fontFamily: 'Raleway',
                                            color: Colors.black,
                                            fontSize:
                                                SizeConfig.safeBlockHorizontal *
                                                    3.5,
                                          ),
                                        ),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          text: 'help me to check it.',
                                          style: TextStyle(
                                            fontFamily: 'Raleway',
                                            color: Colors.black,
                                            fontSize:
                                                SizeConfig.safeBlockHorizontal *
                                                    3.5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);
                                  Navigator.pushReplacement(
                                    context,
                                    EnterExitRoute(enterPage: ServicePhone3()),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(255, 205, 0, 1),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text.rich(
                                    TextSpan(
                                      text: 'I know the problems,',
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal *
                                                3.5,
                                      ),
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: 'and I want to describe it.',
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal *
                                                3.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServicePhone3 extends StatefulWidget {
  @override
  _ServicePhone3State createState() => _ServicePhone3State();
}

class _ServicePhone3State extends State<ServicePhone3> {
  int current = 0;
  String _value;
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: FittedBox(
          child: Container(
            child: Row(
              children: <Widget>[
                InkWell(
                    child: Container(
                      child: Icon(
                        Icons.navigate_before,
                        size: 50,
                        color: Color.fromRGBO(255, 205, 0, 1),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.pushReplacement(
                        context,
                        EnterExitRoute(enterPage: ServicePhone2()),
                      );
                    }),
                Text(
                  'Services Form',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Color.fromRGBO(255, 205, 0, 1)),
                ),
              ],
            ),
          ),
          fit: BoxFit.scaleDown,
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 70),
                          alignment: Alignment.centerLeft,
                          height: SizeConfig.safeBlockVertical * 3,
                          width: double.infinity,
                          child: FittedBox(
                            child: Text(
                              'Please fill this form.',
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: SizeConfig.safeBlockVertical * 5,
                      width: double.infinity,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 55,
                          ),
                          Container(
                            height: SizeConfig.safeBlockVertical * 5,
                            width: SizeConfig.safeBlockHorizontal * 5,
                            margin: EdgeInsets.only(left: 10),
                            child: FittedBox(
                              child: Icon(
                                Icons.smartphone,
                                color: Color.fromRGBO(255, 205, 0, 1),
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: FittedBox(
                              child: Text(
                                'Phone Series',
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 5,
                      width: SizeConfig.safeBlockHorizontal * 65,
                      child: TextField(
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockVertical * 2.5,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(59, 59, 59, 1),
                          hintText: 'Phone Series',
                          contentPadding:
                              EdgeInsets.only(left: 16, top: 25, bottom: 10),
                          hintStyle: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: SizeConfig.safeBlockVertical * 2,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(59, 59, 59, 1),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(255, 205, 0, 0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: SizeConfig.safeBlockVertical * 5,
                      width: double.infinity,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 55,
                          ),
                          Container(
                            height: SizeConfig.safeBlockVertical * 5,
                            width: SizeConfig.safeBlockHorizontal * 5,
                            margin: EdgeInsets.only(left: 10),
                            child: FittedBox(
                              child: Icon(
                                Icons.warning,
                                color: Color.fromRGBO(255, 205, 0, 1),
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: FittedBox(
                              child: Text(
                                'Problems',
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: SizeConfig.safeBlockVertical * 5,
                      width: SizeConfig.safeBlockHorizontal * 65,
                      padding: EdgeInsets.only(
                        left: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(59, 59, 59, 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: DropdownButton<String>(
                        items: [
                          DropdownMenuItem<String>(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Item 1',
                                  style: TextStyle(
                                    fontSize: SizeConfig.safeBlockVertical * 2,
                                    fontFamily: 'Raleway',
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            value: 'one',
                          ),
                          DropdownMenuItem<String>(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Item 2',
                                  style: TextStyle(
                                    fontSize: SizeConfig.safeBlockVertical * 2,
                                    fontFamily: 'Raleway',
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            value: 'two',
                          ),
                        ],
                        isExpanded: true,
                        onChanged: (String value) {
                          setState(() {
                            _value = value;
                          });
                        },
                        hint: Text('Select One',
                            style: TextStyle(
                              fontSize: SizeConfig.safeBlockVertical * 2,
                              color: Color.fromRGBO(150, 150, 150, 1),
                              fontFamily: 'Raleway',
                            )),
                        value: _value,
                        underline: Container(
                          height: SizeConfig.safeBlockVertical * 5,
                          width: SizeConfig.safeBlockHorizontal * 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: SizeConfig.safeBlockVertical * 5,
                      width: double.infinity,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 55,
                          ),
                          Container(
                            height: SizeConfig.safeBlockVertical * 5,
                            width: SizeConfig.safeBlockHorizontal * 5,
                            margin: EdgeInsets.only(left: 10),
                            child: FittedBox(
                              child: Icon(
                                Icons.image,
                                color: Color.fromRGBO(255, 205, 0, 1),
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: FittedBox(
                              child: Text(
                                'Photo',
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: SizeConfig.safeBlockVertical * 15,
                      width: SizeConfig.safeBlockHorizontal * 65,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color.fromRGBO(59, 59, 59, 1),
                        ),
                      ),
                      child: Container(
                        child: FittedBox(
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.file_upload,
                                size: 50,
                                color: Color.fromRGBO(59, 59, 59, 1),
                              ),
                              Text(
                                'Upload your photo here.',
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Colors.white,
                                  fontSize: SizeConfig.safeBlockVertical * 2,
                                ),
                              ),
                            ],
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: SizeConfig.safeBlockVertical * 5,
                      width: SizeConfig.safeBlockHorizontal * 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromRGBO(255, 205, 0, 1),
                      ),
                      child: FittedBox(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            color: Colors.black,
                          ),
                        ),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black,
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('Order'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text('History'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromRGBO(255, 205, 0, 1),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

List<String> imgList = [
  'images/promo-1.jpg',
  'images/promo-2.jpg',
];

Widget placehorder = Container(color: Colors.grey);

final List child = map<Widget>(imgList, (index, i) {
  return Container(
    margin: EdgeInsets.only(left: 5, right: 5, bottom: 70),
    child: ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
      child: Stack(
        children: <Widget>[
          Image.asset(i, fit: BoxFit.contain),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              child: Image.asset('$imgList'),
            ),
          ),
        ],
      ),
    ),
  );
}).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _current = 0;
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          child: Row(
            children: <Widget>[
              Image.asset(
                'images/logo-kecil.png',
                fit: BoxFit.contain,
                height: SizeConfig.safeBlockVertical * 9,
                width: SizeConfig.safeBlockHorizontal * 9,
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                height: SizeConfig.safeBlockVertical * 5,
                width: SizeConfig.safeBlockHorizontal * 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromRGBO(59, 59, 59, 1),
                ),
                child: InkWell(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.search,
                          color: Color.fromRGBO(165, 165, 165, 1),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Find Services..',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: SizeConfig.safeBlockVertical * 2,
                            color: Color.fromRGBO(165, 165, 165, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    showSearch(context: context, delegate: DataSearch());
                  },
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Image.asset(
                'images/voucher.png',
                fit: BoxFit.contain,
                height: SizeConfig.safeBlockVertical * 9,
                width: SizeConfig.safeBlockHorizontal * 9,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: SizeConfig.safeBlockVertical * 105,
        width: SizeConfig.safeBlockHorizontal * 125,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            CarouselSlider(
              items: child,
              autoPlay: true,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(
                imgList,
                (index, asset) {
                  return Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Color.fromRGBO(0, 0, 0, 0.9)
                            : Color.fromRGBO(0, 0, 0, 0.4)),
                  );
                },
              ),
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 5,
              width: SizeConfig.safeBlockHorizontal * double.infinity,
              child: Row(
                children: <Widget>[
                  Container(
                    height: SizeConfig.safeBlockVertical * 0.5,
                    width: SizeConfig.safeBlockHorizontal * 8,
                    margin: EdgeInsets.only(
                        top: 15, bottom: 15, left: 20, right: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(255, 205, 0, 1),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Text(
                      'TegVices',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: SizeConfig.safeBlockVertical * 2.5,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              height: SizeConfig.safeBlockVertical * 20,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: SizeConfig.safeBlockVertical * 20,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Phones',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: SizeConfig.safeBlockVertical * 2,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage(
                            'images/service-phone.jpg',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: SizeConfig.safeBlockVertical * 20,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'PC',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: SizeConfig.safeBlockVertical * 2,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage(
                            'images/service-pc.jpg',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: SizeConfig.safeBlockVertical * 20,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Laptop',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: SizeConfig.safeBlockVertical * 2,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage(
                            'images/service-laptop.jpg',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 5,
              width: SizeConfig.safeBlockHorizontal * double.infinity,
              child: Row(
                children: <Widget>[
                  Container(
                    height: SizeConfig.safeBlockVertical * 0.5,
                    width: SizeConfig.safeBlockHorizontal * 8,
                    margin: EdgeInsets.only(
                        top: 15, bottom: 15, left: 20, right: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(255, 205, 0, 1),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Text(
                      'TegTips',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: SizeConfig.safeBlockVertical * 2.5,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              height: SizeConfig.safeBlockVertical * 20,
              child: Column(
                children: <Widget>[
                  Container(
                    height: SizeConfig.safeBlockVertical * 10,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 20,
                            ),
                            color: Colors.pink,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black,
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('Order'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text('History'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromRGBO(255, 205, 0, 1),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final cities = [
    "Silit",
    "Mbahmue",
    "Mbahmoe",
  ];

  final recentCities = [
    "Mbahoeee",
    "Mbahmue",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      child: Card(
        color: Colors.red,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.alarm),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(
                color: Color.fromRGBO(165, 165, 165, 1),
                fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(
                  color: Color.fromRGBO(165, 165, 165, 1),
                ),
              ),
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  String get searchFieldLabel => "";
}

class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  int _current = 0;
  int _selectedIndex = 0;

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          child: Row(
            children: <Widget>[
              Image.asset(
                'images/logo-kecil.png',
                fit: BoxFit.contain,
                height: SizeConfig.safeBlockVertical * 9,
                width: SizeConfig.safeBlockHorizontal * 9,
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                height: SizeConfig.safeBlockVertical * 5,
                width: SizeConfig.safeBlockHorizontal * 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromRGBO(59, 59, 59, 1),
                ),
                child: InkWell(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.search,
                          color: Color.fromRGBO(165, 165, 165, 1),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Find Services..',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: SizeConfig.safeBlockVertical * 2,
                            color: Color.fromRGBO(165, 165, 165, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    showSearch(context: context, delegate: DataSearch());
                  },
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Image.asset(
                'images/voucher.png',
                fit: BoxFit.contain,
                height: SizeConfig.safeBlockVertical * 9,
                width: SizeConfig.safeBlockHorizontal * 9,
              ),
            ],
          ),
        ),
      ),
      body: Container(
          child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              padding: EdgeInsets.all(30),
              child: Image.asset(
                'images/logo-kecil.png',
                scale: 7,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
