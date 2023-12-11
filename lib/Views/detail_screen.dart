import 'package:crona_virus/Widget/custom_card_widget.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String image;
  String countryName;
  int totalcase , totalDeath , totalRecoverd , active , critical , todayRecoverd , test;

  DetailScreen({super.key,
    required this.countryName,
    required this.image,
    required this.totalcase,
    required this.totalDeath,
    required this.totalRecoverd,
    required this.active,
    required this.critical,
    required this.todayRecoverd,
    required this.test,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade700,
        appBar: AppBar(
          title: Text(widget.countryName),
          backgroundColor: Colors.grey.shade500,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Card(
                  color: Colors.grey.shade900,
                  child: Column(
                    children: [
                      CustomWidget(
                          title: "Case" ,
                          value: widget.totalcase.toString()
                      )
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.image),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
