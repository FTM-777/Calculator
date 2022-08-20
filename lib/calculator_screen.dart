import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator_screen extends StatefulWidget {
  Calculator_screen({Key? key}) : super(key: key);

  @override
  State<Calculator_screen> createState() => _Calculator_screenState();
}

class _Calculator_screenState extends State<Calculator_screen> {
  var texttype = '';
  var result = '';

  void showtext(String text) {
    setState(() {
      texttype = texttype + text;
    });
  }

  Widget getbutton(String text1, String text2, String text3, String text4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            elevation: 5,
            shadowColor: Colors.white,
            minimumSize: Size(70, 20),
            backgroundColor: getbackgroundcolor(text1),
          ),
          onPressed: () {
            if (text1 == '00' && texttype == '') {
              return;
            }
            if (text1 == 'ac') {
              setState(() {
                texttype = '';
                result = '';
              });
            } else {
              showtext(text1);
            }
          },
          child: Text(
            '$text1',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'abo',
              color: textbackgroundcolor(text1),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            elevation: 5,
            shadowColor: Colors.white,
            minimumSize: Size(70, 20),
            backgroundColor: getbackgroundcolor(text2),
          ),
          onPressed: () {
            if (text2 == '0' && texttype == '') {
              return;
            }
            if (text2 == 'ce') {
              setState(() {
                if (texttype.length > 0) {
                  texttype = texttype.substring(0, texttype.length - 1);
                }
              });
            } else {
              showtext(text2);
            }
          },
          child: Text(
            '$text2',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'abo',
              color: textbackgroundcolor(text2),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            elevation: 5,
            shadowColor: Colors.white,
            minimumSize: Size(70, 20),
            backgroundColor: getbackgroundcolor(text3),
          ),
          onPressed: () {
            if (text3 == '%' && texttype == '') {
              return;
            } else if (text3 == '.' && texttype == '') {
              return;
            }
            showtext(text3);
          },
          child: Text(
            '$text3',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'abo',
              color: textbackgroundcolor(text3),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: text4 == '='
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  )
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
            elevation: text4 == '=' ? 7 : 5,
            shadowColor: Colors.black,
            minimumSize: text4 == '=' ? Size(80, 20) : Size(70, 20),
            backgroundColor: getbackgroundcolor(text4),
          ),
          onPressed: () {
            if (texttype == '') {
              return;
            } else if (text4 == '/' && texttype == '') {
              return;
            } else if (text4 == '*' && texttype == '') {
              return;
            } else if (text4 == '-' && texttype == '') {
              return;
            } else if (text4 == '+' && texttype == '') {
              return;
            }

            if (text4 == '=') {
              Parser parser = Parser();
              String userInputFC = texttype;
              userInputFC = userInputFC.replaceAll("x", "*");
              Expression expression = parser.parse(texttype);

              ContextModel contextModel = ContextModel();
              double eval =
                  expression.evaluate(EvaluationType.REAL, contextModel);
              setState(() {
                result = eval.toString();
              });
            } else if (text4 == '*') {
              showtext('x');
            } else {
              showtext(text4);
            }
          },
          child: Text(
            '$text4',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'abo',
              color: textbackgroundcolor(text4),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'abo',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 320,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            texttype,
                            style: TextStyle(
                              color: Color.fromARGB(255, 104, 105, 107),
                              fontSize: texttype.length > 9 ? 30 : 50,
                              fontWeight: FontWeight.w400,
                              shadows: [
                                Shadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 10,
                                  color: Color.fromARGB(255, 219, 219, 219),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            result,
                            style: TextStyle(
                              color: Color.fromARGB(255, 236, 141, 15),
                              fontSize: 70,
                              fontWeight: FontWeight.w500,
                              shadows: [
                                Shadow(
                                  offset: Offset(3, 2),
                                  blurRadius: 10,
                                  color: Color.fromARGB(255, 219, 219, 219),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //-----------------------------------------------------------------------

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        getbutton('ac', 'ce', '%', '/'),
                        getbutton('7', '8', '9', '*'),
                        getbutton('4', '5', '6', '-'),
                        getbutton('1', '2', '3', '+'),
                        getbutton('00', '0', '.', '='),
                      ],
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

  bool isOperator(String text) {
    var list = ['ac', 'ce', '%', '/', '*', '-', '+', '='];

    for (var item in list) {
      if (item == text) {
        return true;
      }
    }
    return false;
  }

  Color getbackgroundcolor(String text) {
    if (isOperator(text)) {
      return text == '='
          ? Color.fromARGB(255, 245, 136, 12)
          : Color.fromARGB(255, 97, 97, 97);
    } else {
      return Colors.white;
    }
  }

  Color textbackgroundcolor(String text) {
    if (isOperator(text)) {
      return Color.fromARGB(255, 255, 255, 255);
    } else {
      return Color.fromARGB(255, 56, 56, 56);
    }
  }
}
