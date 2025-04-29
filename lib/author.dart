import 'package:flutter/material.dart';

class Author extends StatefulWidget {
  const Author({super.key});

  @override
  State<Author> createState() => _AuthorState();
}

class _AuthorState extends State<Author> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String? _email;
  String? _password;
  bool _showLogin = true;

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 100),
        child: Container(
          child: Align(
            child: Text(
              "NURGAZY",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }

    Widget _input(
      Icon icon,
      String hint,
      TextEditingController controller,
      bool obscure,
    ) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          style: TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white30,
            ),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white54, width: 1),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: IconTheme(
                data: IconThemeData(color: Colors.white),
                child: icon,
              ),
            ),
          ),
        ),
      );
    }

    Widget _button(String text, void Function() func) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          splashFactory: InkSplash.splashFactory,
          foregroundColor: Theme.of(context).primaryColor,
          elevation: 5,
          shadowColor: Colors.black,
        ),
        onPressed: func,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
      );
    }

    Widget _form(String label, void func()) {
      return Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child: _input(
                Icon(Icons.email),
                "Email",
                _emailController,
                false,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: _input(
                Icon(Icons.lock),
                "Password",
                _passwordController,
                true,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func),
              ),
            ),
          ],
        ),
      );
    }

    void _buttonAction() {
      _email = _emailController.text;
      _password = _passwordController.text;

      _emailController.clear();
      _passwordController.clear();
    }

    Widget _bottomWave() {
      return Expanded(
        child: Align(
          child: ClipPath(
            child: Container(color: Colors.white, height: 500),
            clipper: BottomWaveClipper(),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        children: [
          _logo(),
          SizedBox(height: 100), 
          _showLogin
              ? Column(
                children: [
                  _form('LOGIN', _buttonAction),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      child: Text(
                        'Not registered yet? Register!',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onTap: () {
                        setState(() {
                          _showLogin = false;
                        });
                      },
                    ),
                  ),
                ],
              )
              : Column(
                children: [
                  _form('REGISTER', _buttonAction),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      child: Text(
                        'Already registered? Register!',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onTap: () {
                        setState(() {
                          _showLogin = true;
                        });
                      },
                    ),
                  ),
                ],
              ),
          _bottomWave(),
        ],
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height + 5);
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
