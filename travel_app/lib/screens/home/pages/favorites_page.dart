import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/models.dart';
import '../../../states/travels_state.dart';
import '../widgets/country_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 49),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            "Favorites",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 36),
        FutureBuilder(
            future: Provider.of<TravelsState>(context).getLikedTravelCards(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<TravelCard> _travelCards = snapshot.data;
                if (_travelCards.length == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 27),
                    child: Text("You did`t liked any country yet..."),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: _travelCards.length,
                    itemBuilder: (context, i) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 27, vertical: 10),
                      child: CountryCard(
                        id: _travelCards[i].id,
                        image: _travelCards[i].images[0],
                        name: _travelCards[i].title,
                        reviews: _travelCards[i].likes,
                        isBig: true,
                      ),
                    ),
                  ),
                );
              }
              return CircularProgressIndicator();
            }),
      ],
    );
  }
}
