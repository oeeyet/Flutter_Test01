import 'dart:js';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context2) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context2,
                MaterialPageRoute(
                    builder: (_) =>
                        SecondPage())); // context는 플루터가 원하는(기본적으로 자동 지원되는) context를 의미
          },
          child: Text('Go to the Second page'),
        ),
      ),
      // 이런 방법도 있고(buildmethod방식)
      // Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       Navigator.push(context2,
      //           MaterialPageRoute(builder: (BuildContext context) {
      //         return SecondPage();
      //       }));
      //     },
      //     child: Text('Go to the Second page'),
      //   ),
      // ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    // 1. ctx라는 자체 컨텍스트를 가지고 있다!
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(
                ctx); // 2. 그래서 pop context는 이미 위에 ctx값을 전달받아서 실행되기 때문에 빌더의 컨텍스트를 사용할 필요가 없다.
          },
          child: Text('Go to the First page'),
        ),
      ),
    );
  }
}
