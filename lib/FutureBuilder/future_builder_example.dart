import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FutureBuilderExample extends StatefulWidget {
  // const FutureBuilderExample({Key? key}) : super(key: key);

  @override
  State<FutureBuilderExample> createState() => _FutureBuilderExampleState();
}

class _FutureBuilderExampleState extends State<FutureBuilderExample> {

  late Future<int?> futureVariable;

  Future<int?> getData() async {
  final result=await http.get(Uri.parse('https://elitedesign-links.com/kr-photgraphy/api/test-api'));
  final data=json.decode(result.body);

         //DATA
  // {
  //   "Number":generate random no
  // }

  int randomnumber=data['Number'];

  return randomnumber;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureVariable=getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Future BUILDER EXAMPLE')),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                futureVariable=getData();
              });
            }
        ),
        body: Container(
          child: Center(
            child: FutureBuilder<int?>(
                future: futureVariable,
                builder: (context, snapshot) {
                  switch(snapshot.connectionState){

                  //STREAM IS WAITING FOR FIRST VALUE
                    case ConnectionState.waiting:
                      return const Text('FutureBuilder is waiting');
                    case ConnectionState.done:

                    default:
                      if(snapshot.hasError){
                        return Text("${snapshot.error }");
                      }
                      else if(snapshot.hasData){
                        return Text('${snapshot.data}');
                      }
                      else {
                        return Container(child: Text('Hello Moto'),);
                      }
                  }
                }),
          ),
        ));
  }
}
