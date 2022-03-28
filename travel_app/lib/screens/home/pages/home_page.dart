import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/models/models.dart';
import 'package:travel_app/states/travels_state.dart';

import '../widgets/country_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset("assets/images/ad.png"),
          ),
        ),
        Spacer(flex: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Row(
            children: [
              Text(
                "Popular Flights",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Spacer(),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "See all ",
                      style: TextStyle(
                        color: Color(0xFF335BA4),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Show all popular flights
                        },
                    ),
                    TextSpan(
                      text: ">",
                      style: TextStyle(
                          color: Color(0xFF335BA4),
                          fontWeight: FontWeight.w700),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Show all popular flights
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // SizedBox(
        //   height: 1,
        //   child: ListView.builder(
        //     itemCount: 10,
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (context, index) =>
        //         CountryCard(name: "The Country $index", reviews: 1000),
        //   ),
        // ),
        FutureBuilder(
            future: Provider.of<TravelsState>(context).getTravelCards(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<TravelCard> _travelCards = snapshot.data;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: 200,
                    child: Row(
                      children: [
                        for (int i = 0; i < _travelCards.length; i++)
                          i == 0
                              ? Padding(
                                  padding:
                                      EdgeInsets.only(left: 27, right: 17.5),
                                  child: CountryCard(
                                    id: _travelCards[i].id,
                                    name: _travelCards[i].title,
                                    reviews: _travelCards[i].likes,
                                    image: _travelCards[i].images[0],
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 17.5),
                                  child: CountryCard(
                                    id: _travelCards[i].id,
                                    name: _travelCards[i].title,
                                    reviews: _travelCards[i].likes,
                                    image: _travelCards[i].images[0],
                                  ),
                                ),
                      ],
                    ),
                  ),
                );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            }),
        Spacer(),
      ],
    );
  }
}
