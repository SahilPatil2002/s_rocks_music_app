import 'package:flutter/material.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String title;

  const ServiceDetailScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // backgroundColor: Color.fromRGBO(24, 23, 28, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(title, style: TextStyle(color: Colors.white, fontFamily: "Syne"),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromRGBO(86, 1, 33, 1),
                  Color.fromRGBO(169, 1, 63, 1),
                ],
              ),),
        child: Center(
          child: Text(
            'You tapped on: $title',
            style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Syne"),
          ),
        ),
      ),
    );
  }
}
