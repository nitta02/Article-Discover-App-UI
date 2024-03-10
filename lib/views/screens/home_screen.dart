// ignore_for_file: avoid_print

import 'package:article_app_ui/data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> countries = [
    "Bangladesh",
    "Japan",
    "Indonesia",
    "Italy",
  ];
  @override
  void initState() {
    super.initState();
  }

  int countryIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        left: false,
        right: false,
        minimum: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.05,
          0,
          MediaQuery.of(context).size.width * 0.05,
          0,
        ),
        child: topSection(context),
      ),
    );
  }

  Widget topSection(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
            Container(
              height: 40,
              width: 150,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
              )),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              bottom: MediaQuery.of(context).size.height * 0.02),
          child: countrySection(context),
        ),
        articleSection(),
      ],
    );
  }

  Widget countrySection(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(1, 5),
              blurRadius: 5,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: countries.map((e) {
          bool isSelect = countries[countryIndex] == e ? true : false;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  print('Tapped$e');
                },
                child: Text(e,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    )),
              ),
              isSelect
                  ? Container(
                      height: 5,
                      width: 25,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                      ),
                    )
                  : Container(),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget articleSection() {
    return Expanded(
        child: ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Stack(children: [
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.05),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(articles[index].image),
                    fit: BoxFit.cover,
                  )),
              child: Column(
                children: [
                  firstDetailsSection(context, index),
                  secendDetailsSection(context, index),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.28,
            left: MediaQuery.of(context).size.height * 0.02,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(1, 5),
                      blurRadius: 5,
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                      Text(articles[index].likes.toString()),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                      Text(articles[index].comments.toString()),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.share,
                        color: Colors.green,
                      ),
                      Text(articles[index].shares.toString()),
                    ],
                  ),
                ],
              ),
            ),
          )
        ]);
      },
    ));
  }

  Padding secendDetailsSection(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.05,
          left: MediaQuery.of(context).size.height * 0.06),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              print('Tapped');
            },
            icon: Icon(
              Icons.play_circle_fill,
              size: MediaQuery.of(context).size.height * 0.08,
              color: Colors.white,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(articles[index].title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ))),
              const SizedBox(
                height: 10,
              ),
              Text(
                articles[index].location,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row firstDetailsSection(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.02,
                  left: MediaQuery.of(context).size.width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/man.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        articles[index].author,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Likes:  ${articles[index].likes}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
