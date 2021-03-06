import 'package:flutter/material.dart';
import 'package:streambuilderexamplejohannes/FutureBuilder/future_builder_example.dart';
import 'package:streambuilderexamplejohannes/StreamBuilder/stream_builder.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => firsrScreen(),
        '/FutureBuilderExample': (context) => FutureBuilderExample(),
        '/StreamBuilderExample': (context) => StreamBuilderExample(),
      },
      // home: const StreamBuilderExample(),
      // home:  firsrScreen(),
      // home:  firsrScreen()

    );
  }
}

class firsrScreen extends StatelessWidget {
  const firsrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/FutureBuilderExample');

              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => FutureBuilderExample()));
            }, child: const Text('FlutterBuilder')),
            ElevatedButton(onPressed: ()=>{
             Navigator.pushNamed(context, '/StreamBuilderExample')
            }, child: const Text('StreamBuilder'))
          ],
        ),
      ),
    );
  }
}




