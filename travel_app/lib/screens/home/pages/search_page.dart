import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/models/models.dart';

import '../../../states/travels_state.dart';
import '../widgets/country_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _search = "";

  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 26),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(10, 3, 20, 0),
          margin: EdgeInsets.symmetric(horizontal: 27),
          height: 59,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2.5,
                  blurRadius: 6,
                  offset: Offset(0, 5),
                ),
              ]),
          child: TextField(
            textInputAction: TextInputAction.search,
            onSubmitted: (text) {
                Provider.of<TravelsState>(context).getSearchedTravelCards(_search);
            },
            onChanged: (text) {
              _isSearching = true;
              _search = text;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search_rounded,
                color: Colors.black,
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {},
              ),
              hintText: 'Search...',
              hintStyle: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
        _isSearching ? Column(
          children: [
            SizedBox(height: 29),
            SizedBox(
              height: 35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => index == 0
                    ? Container(
                  margin: const EdgeInsets.only(
                    left: 27,
                    right: 10.22,
                  ),
                  constraints: BoxConstraints(minWidth: 82.67),
                  decoration: BoxDecoration(
                    color: Color(0xFF235CA9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "All",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                )
                    : Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.22),
                  constraints: BoxConstraints(minWidth: 82.67),
                  decoration: BoxDecoration(
                    color: Color(0xFF235CA9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "All",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 44),
            FutureBuilder(
              future: Provider.of<TravelsState>(context).getTravelCards(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<TravelCard> _travelCards = snapshot.data;

                  return Expanded(
                    child: ListView.builder(
                      itemCount: _travelCards.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 27, vertical: 10),
                        child: CountryCard(
                          id: _travelCards[index].id,
                          name: _travelCards[index].title,
                          reviews: _travelCards[index].likes,
                          image: _travelCards[index].images[0],
                        ),
                      ),
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ) : SizedBox(),
      ],
    );
  }
}
