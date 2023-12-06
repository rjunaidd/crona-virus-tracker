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
              Text(title),
              Text(value)
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