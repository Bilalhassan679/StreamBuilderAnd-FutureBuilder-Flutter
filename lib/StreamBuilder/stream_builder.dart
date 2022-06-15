import 'package:flutter/material.dart';

class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({Key? key}) : super(key: key);

  @override
  State<StreamBuilderExample> createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  late Stream<int?> numberStream;





  Stream<int?> getNumber() async*{
   await Future.delayed(const Duration(seconds: 4));
   yield 1;

   await Future.delayed(const Duration(seconds: 4));
   yield 2;

   await Future.delayed(const Duration(seconds: 3));
     yield 3;
 }


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    numberStream=getNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('STREAM BUILDER EXAMPLE')),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              numberStream=getNumber();
            });
          }
        ),
        body: Container(
          child: Center(
            child: StreamBuilder<int?>(
                stream: numberStream,
                builder: (context, snapshot) {
                  switch(snapshot.connectionState){
                    //STREAM IS NULL
                    case ConnectionState.none:
                      return const Text('Stream is Null ');

                    //STREAM IS WAITING FOR FIRST VALUE
                    case ConnectionState.waiting:
                      return const Text('Stream is waiting');

                    //STREAM IS NOT FINISHED YET
                    case ConnectionState.active:
                      if(snapshot.hasData) {
                       int number=snapshot.data!;
                        return Text('${number}');
                      }
                      else {
                        return const Text('No DATA!!!');
                      }

                    case ConnectionState.done:
                      if(snapshot.hasData){
                        int number=snapshot.data!;
                        return Text("${number}");
                      }
                      else{
                        return Text('No DATA !!! ');
                      }
                    default:
                     return Container(child: Text('Hello Moto'),);
                  }
                }),
          ),
        ));
  }
}
