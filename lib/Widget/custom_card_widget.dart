import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final String title , value;
  const CustomWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 10 , right: 10 , top: 10 , bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title , style: TextStyle(fontSize: 20 , color: Colors.white),),
              Text(value , style: TextStyle(color: Colors.white , fontSize: 16 , fontWeight: FontWeight.normal),)
            ],
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
         const Divider( )
        ],
      ),
    );
  }
}