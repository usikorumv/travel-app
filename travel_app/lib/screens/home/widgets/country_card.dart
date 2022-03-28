import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/states/travels_state.dart';

class CountryCard extends StatelessWidget {
  CountryCard(
      {Key? key,
        required this.id,
      required this.image,
      required this.name,
      required this.reviews,
      this.isBig})
      : super(key: key);

  final int id;
  final String name, image;
  final int reviews;
  final bool? isBig;


  @override
  Widget build(BuildContext context) {
    bool _isBig = isBig ?? false;

    return Container(
      height: !_isBig ? 160 : 224,
      constraints: BoxConstraints(
        maxHeight: !_isBig ? 237 : 330,
        maxWidth: !_isBig ? 138 : 330,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2.5,
            blurRadius: 6,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.fitWidth,
                  height: 120,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Image.asset("assets/images/cannot_be_loaded.png", fit: BoxFit.fitWidth,),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  name,
                  style: !_isBig
                      ? TextStyle(
                          color: Colors.black,
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          wordSpacing: 1.1,
                          overflow: TextOverflow.ellipsis,
                        )
                      : TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          wordSpacing: 1.1,
                          overflow: TextOverflow.ellipsis,
                        ),
                ),
              ),
              SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.only(
                  right: 12,
                  left: 8,
                ),
                child: Row(
                  children: [
                    for (int star = 1; star <= 5; star++)
                      Icon(
                        Icons.star,
                        color: Color(0xFFFF5F04),
                        size: !_isBig ? 12 : 15.5,
                      ),
                    Spacer(),
                    Text(
                      "$reviews reviews",
                      style: TextStyle(
                        color: Color(0xFF676767),
                        fontSize: 8,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: !_isBig ? 10 : 15),
            ],
          ),
          Positioned(
            top: 12,
            right: 6,
            child: LikeButton(
              onTap: (value) async {
                if (!value) {
                  Provider.of<TravelsState>(context, listen: false).like(id);
                }
                else {
                  Provider.of<TravelsState>(context, listen: false).unlike(id);
                }

                return !value;
              },
              likeBuilder: (isLiked) {
                return Icon(
                  Icons.favorite,
                  color: isLiked ? Color(0xFFFF5F04) : Colors.white,
                  size: 26,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
