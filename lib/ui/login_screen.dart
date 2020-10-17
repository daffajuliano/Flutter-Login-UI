import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _slideAnimationBoxThree;
  Animation<double> _fadeAnimationTwo;

  bool _loginClicked = false;
  double _loginBtnWidth = double.infinity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    //initialising the animation
    _fadeAnimationTwo = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        //delay
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.easeOut,
        ),
      ),
    );

    //initialising the animation
    _slideAnimationBoxThree = Tween<Offset>(
      begin: Offset(0.0, 0.5),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        //delay
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.easeOut,
        ),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Container(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(32),
            child: ListView(
              shrinkWrap: true,
              children: [
                // Logo
                SlideTransition(
                  position: _slideAnimationBoxThree,
                  child: FadeTransition(
                    opacity: _fadeAnimationTwo,
                    child: FlutterLogo(size: 100),
                  ),
                ),

                SizedBox(height: 50),

                // Form
                SlideTransition(
                  position: _slideAnimationBoxThree,
                  child: FadeTransition(
                    opacity: _fadeAnimationTwo,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail_outline, color: Colors.white),
                        hintText: 'Email',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                SlideTransition(
                  position: _slideAnimationBoxThree,
                  child: FadeTransition(
                    opacity: _fadeAnimationTwo,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key, color: Colors.white),
                        hintText: 'Password',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                SlideTransition(
                  position: _slideAnimationBoxThree,
                  child: FadeTransition(
                    opacity: _fadeAnimationTwo,
                    child: AnimatedSize(
                      duration: Duration(seconds: 1),
                      vsync: this,
                      curve: Curves.ease,
                      child: Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: ButtonTheme(
                            minWidth: _loginBtnWidth,
                            child: FlatButton(
                              onPressed: () {
                                setState(() {
                                  if (_loginClicked) {
                                    _loginClicked = false;
                                    _loginBtnWidth = 100;
                                  } else {
                                    _loginClicked = true;
                                    _loginBtnWidth = double.infinity;
                                  }
                                });
                              },
                              padding: const EdgeInsets.all(16),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.blue[700],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
