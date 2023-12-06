import 'package:crona_virus/Widget/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';


class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(

      duration:const Duration( seconds: 3),
      vsync: this)..repeat();
  @override

  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  final colorList =   <Color> [
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffda5246),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SafeArea(
      child:  Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding:const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),

               PieChart(
                  dataMap: const {
                    "Total" : 100,
                    "Recoveres" : 70,
                    "Death" : 30
                  },
                 chartRadius: size.width / 0.01,
                 legendOptions:const LegendOptions(
                   legendPosition: LegendPosition.left,
                   legendTextStyle: TextStyle(
                     fontSize: 18,
                     color: Colors.white
                   )
                 ),
                chartValuesOptions:const ChartValuesOptions(
                 showChartValues: true,
                  showChartValuesInPercentage: true,
                  showChartValuesOutside:   false
                ),
                animationDuration:const Duration(
                  seconds: 3
                ),
                chartType: ChartType.ring,
                colorList: colorList,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(
                    vertical: size.height * 0.06,
                horizontal: size.width * 0.02

                ),
                child:const Card(
                  child: Column(
                    children: [
                      CustomWidget(title: "Total", value: "200"),
                      CustomWidget(title: "Total", value: "200"),
                      CustomWidget(title: "Total", value: "200"),
                      CustomWidget(title: "Total", value: "200"),
                    ],
                  ),
                ),
              ),
              Container(
                height: size.height * 0.07,
                width: size.width * 0.7,
                decoration: BoxDecoration(
                  color: Colors.orange.shade900,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text("Track Country" , style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900
                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


