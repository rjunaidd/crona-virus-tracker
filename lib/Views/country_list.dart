import 'package:crona_virus/Services/states_services.dart';
import 'package:flutter/material.dart';

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
                       return Text("Loading");
                      }else{
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                            itemBuilder: (context, index){
                              return Column(
                                children: [
                                  ListTile(
                                    leading: Image(
                                        image: NetworkImage(
                                          snapshot.data![index]["countryInfo"]["flag"]
                                        )
                                    ),
                                  )
                                ],
                              );
                            }
                        );
                      }

                    })
            ),
          ],
        ),
      ),
    );
  }
}
