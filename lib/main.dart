import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/models/movie.dart';
import 'package:movieflix/screens/movie_details.dart';

void main() {
  runApp(MovieApp());
}

// colors
final primaryColor = Colors.red;

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20.0),
          ),
        ),
        title: Text(
          'Movieflix',
          style: TextStyle(
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 180, // main height
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: movies
                    .map(
                      (movie) => Container(
                        margin: EdgeInsets.all(10.0),
                        width: 300,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: AssetImage(movie.image),
                            repeat: ImageRepeat.noRepeat,
                            fit: BoxFit.cover,
                            colorFilter:
                                ColorFilter.mode(Colors.grey, BlendMode.darken),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MovieDetails(movie)));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(
                                      movie.name,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    ),
                                  ),
                                  Text(
                                    movie.category,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                  ),
                                  Text(
                                    movie.releaseYear.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                  alignment: Alignment.bottomRight,
                                  icon: Icon(
                                    movie.favourite == true
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.orange,
                                    size: 24.0,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      movie.toggleFavourite();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Text(
                      'POPULAR LIST',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: movies
                  .map(
                    (movie) => Container(
                      margin: EdgeInsets.all(10.0),
                      width: 350,
                      height: 250,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: AssetImage(movie.image),
                          repeat: ImageRepeat.noRepeat,
                          fit: BoxFit.cover,
                          colorFilter:
                              ColorFilter.mode(Colors.grey, BlendMode.darken),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetails(movie)));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    movie.name,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                Text(
                                  movie.category,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                                Text(
                                  movie.releaseYear.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                alignment: Alignment.bottomRight,
                                icon: Icon(
                                  movie.favourite == true
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.orange,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    movie.toggleFavourite();
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
