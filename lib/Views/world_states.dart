import 'package:crona_virus/Views/country_list.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:crona_virus/Model/world_states_model.dart';
import 'package:crona_virus/Services/states_services.dart';
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
    StatesServices statesServices = StatesServices();
    Size size = MediaQuery.of(context).size;

    return  SafeArea(
      child:  Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding:const EdgeInsets.all(15.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.04,
              ),

              FutureBuilder(
                  future:statesServices.fetchWorldStatesRecord() ,
                  builder: (context ,AsyncSnapshot<WorldStatesModel> snapshot){
                    if(!snapshot.hasData){
                      return Expanded(
                          flex: 1,
                          child: SpinKitFadingCircle(
                            color: Colors.white,
                            size: 75,
                            controller: _controller,
                          )
                      );
                    }else{
                      return Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(
                                horizontal: size.width * 0.06
                            ),
                            child: PieChart(
                              dataMap:  {
                                "Total" : double.parse(snapshot.data!.cases!.toString()),
                                "Recoveres" : double.parse(snapshot.data!.recovered.toString()),
                                "Death" : double.parse(snapshot.data!.deaths.toString(),),

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
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(
                                vertical: size.height * 0.06,
                                horizontal: size.width * 0.01

                            ),
                            child: Card(
                              color: Colors.grey.shade800,
                              child: Column(
                                children: [
                                  CustomWidget(title: "Total", value: snapshot.data!.cases.toString()),
                                  CustomWidget(title: "Active", value:snapshot.data!.active.toString() ),
                                  CustomWidget(title: "tests", value:snapshot.data!.tests.toString() ),
                                  CustomWidget(title: "critical", value:snapshot.data!.critical.toString() ),
                                  CustomWidget(title: "recovered", value:snapshot.data!.recovered.toString() ),
                                  CustomWidget(title: "Death", value:snapshot.data!.deaths.toString() ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const CountryListDetail()));
                            },
                            child: Container(
                              height: size.height * 0.07,
                              width: size.width * 0.7,
                              decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(
                                child: Text("Track Country" , style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade900
                                ),),
                              ),
                            ),
                          )
                        ],
                      );
                    }
                  }
              ),

            ],
          ),
        ),
      ),
    );
  }
}


