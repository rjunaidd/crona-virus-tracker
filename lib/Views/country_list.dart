import 'package:crona_virus/Services/states_services.dart';
import 'package:crona_virus/Views/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountryListDetail extends StatefulWidget {
  const CountryListDetail({super.key});

  @override
  State<CountryListDetail> createState() => _CountryListDetailState();
}

class _CountryListDetailState extends State<CountryListDetail> {

  TextEditingController serachController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    StatesServices statesServices = StatesServices();
    return  SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value){
                  setState(() {

                  });
                },
                controller: serachController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.07
                    ),
                    hintText: "Search with country name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                    )
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder(
                    future:statesServices.countriesListApi() ,
                    builder: (context , AsyncSnapshot<List<dynamic>> snapshot){
                      if(!snapshot.hasData){
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index){
                              return Shimmer.fromColors(

                                baseColor: Colors.grey.shade600,
                                highlightColor: Colors.grey.shade50,
                                child:Column(
                                  children: [
                                    ListTile(
                                      title: Container(height: size.height * 0.01, width: size.width * 0.1, color: Colors.white,),
                                      leading: Container(
                                        height: size.height * 0.15,
                                        width: size.width * 0.15,
                                        color: Colors.white,
                                      ),
                                      subtitle: Container(height: size.height * 0.01, width: size.width * 0.1, color: Colors.white,),
                                    )
                                  ],
                                ) ,
                              );
                            }
                        );
                      }else{
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index){
                              String name = snapshot.data![index]['country'];
                              if(serachController.text.isEmpty){
                                return InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetailScreen(
                                      countryName: snapshot.data![index]["country"] ?? "",
                                      image:  snapshot.data![index]["flag"] ?? "",
                                      totalcase:  snapshot.data![index]["totalcase"] ?? 0,
                                      totalRecoverd:  snapshot.data![index]["recoverd"] ?? 0,
                                      totalDeath:  snapshot.data![index]["death"] ?? 0,
                                      active:  snapshot.data![index]["active"] ?? 0,
                                      test:  snapshot.data![index]["test"]?? 0,
                                      todayRecoverd:  snapshot.data![index]["flag"]?? 0,
                                      critical:  snapshot.data![index]["critical"] ?? 0,

                                    )));
                                  },
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(snapshot.data![index]['country']),
                                        leading: Image(
                                          image: NetworkImage(
                                              snapshot.data![index]["countryInfo"]["flag"]
                                          ),
                                          height: size.height * 0.15,
                                          width: size.width * 0.15,
                                        ),
                                        subtitle: Text(snapshot.data![index]['cases'].toString()),
                                      )
                                    ],
                                  ),
                                );
                              }else if(name.toLowerCase().contains(serachController.text.toLowerCase())){
                                return InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetailScreen(
                                      countryName: snapshot.data![index]["country"] ?? "",
                                      image:  snapshot.data![index]["flag"] ?? '',
                                      totalcase:  snapshot.data![index]["totalcase"] ?? 0,
                                      totalRecoverd:  snapshot.data![index]["recoverd"] ?? 0,
                                      totalDeath:  snapshot.data![index]["death"] ?? 0,
                                      active:  snapshot.data![index]["active"] ?? 0,
                                      test:  snapshot.data![index]["test"] ?? 0,
                                      todayRecoverd:  snapshot.data![index]["flag"] ?? 0,
                                      critical:  snapshot.data![index]["critical"] ?? 0,
                                    )));
                                  },
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(snapshot.data![index]['country']),
                                        leading: Image(
                                          image: NetworkImage(
                                              snapshot.data![index]["countryInfo"]["flag"]
                                          ),
                                          height: size.height * 0.15,
                                          width: size.width * 0.15,
                                        ),
                                        subtitle: Text(snapshot.data![index]['cases'].toString()),
                                      )
                                    ],
                                  ),
                                );
                              }else{
                                return Container();
                              }
                            }
                        );
                      }
                    }
                )
            ),
          ],
        ),
      ),
    );
  }
}
