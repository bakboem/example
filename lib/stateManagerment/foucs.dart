import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: MyTextField()),
    );
  }
}

class MyTextField extends StatefulWidget {
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  FocusNode textField_Focus = FocusNode();
  FocusNode focusWidget_Focus = FocusNode();
  FocusNode children_Focus = FocusNode();
  bool trigger = false;
  @override
  void initState() {
    children_Focus.addListener(() {
      print('state :::: ${children_Focus.hasFocus}');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {
                //포크스 해지.
                textField_Focus.unfocus();
                children_Focus.unfocus();
              },
              child: Text('unfocus'),
            ),
            TextButton(
              onPressed: () {
                //포크스 전환.
                setState(() {
                  trigger = !trigger;
                  if (trigger)
                    children_Focus = focusWidget_Focus.children.last;
                  else
                    children_Focus = focusWidget_Focus.children.first;
                });

                children_Focus.requestFocus();
              },
              child: Text('change focus'),
            ),
            TextButton(
              onPressed: () {
                // 포크스 상태 출력.
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  debugDumpFocusTree();
                });
              },
              child: Text('print tree'),
            ),
          ],
        ),
        Focus(
          focusNode: focusWidget_Focus,
          child: Container(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  fit: StackFit.loose,
                  children: [
                    CupertinoTextField(
                      textInputAction: TextInputAction.go,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Text(
                        ' block focus',
                        style: TextStyle(fontSize: 50),
                      ),
                    )
                  ],
                ),
                CupertinoTextField(
                  textInputAction: TextInputAction.go,
                ),
              ],
            ),
          ),
        ),
        TextField(
          focusNode: textField_Focus,
        )
      ],
    );
  }
}
