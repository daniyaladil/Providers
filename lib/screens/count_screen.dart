import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/provider/count_provider.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({super.key});

  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer){
      final countProvider=Provider.of<CountProvider>(context,listen: false);
      countProvider.dateTimeFunction();
      print("init called");
    });
  }
  @override
  Widget build(BuildContext context) {
    final countProvider=Provider.of<CountProvider>(context,listen: false);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Count Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CountProvider>(builder: (context,value,child){
              return Text(value.dateTime.toString(),style: TextStyle(
                  fontSize: 30
              ),);
            })
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        countProvider.setCount();
      },child: Icon(Icons.add),),
    );
  }
}
