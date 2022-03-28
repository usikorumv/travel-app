import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.05,
              ),
            ),
            SizedBox(height: 38.71),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: SizedBox(
                width: 209,
                height: 209,
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/no_profile_picture.png",
                  ),
                ),
              ),
            ),
            SizedBox(height: 39),
            Text(
              "Name Surname",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.05,
              ),
            ),
            SizedBox(height: 43),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 54),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Your region",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.location_on_outlined,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 29,
                            right: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Your cart",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.settings,
                                  color: Color(0xFFBB7438),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 54,
                            right: 24,
                            bottom: 18,
                          ),
                          child: Row(
                            children: [
                              Spacer(),
                              Text(
                                "VISA",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Visibility(
          child: Container(
            decoration: BoxDecoration(),
          ),
        ),
      ],
    );
  }
}
