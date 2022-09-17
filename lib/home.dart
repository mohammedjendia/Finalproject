import 'dart:developer';

import 'package:final_project_flutter/utils/text.dart';
import 'package:final_project_flutter/widget/topRated.dart';
import 'package:final_project_flutter/widget/trending.dart';
import 'package:final_project_flutter/widget/tv.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    List trendingMovie = [];
    List topRatedMovie = [];
    List tvv = [];
  final String apiKey = '54112d6de814086e26729a08460f7974';

  final readAccesstojen = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NDExMmQ2ZGU4MTQwODZlMjY3MjlhMDg0NjBmNzk3NCIsInN1YiI6IjYzMTUwMzlkMWQzMTQzMDA3YTQzMjY5YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.asEvcJKo2MIbM65-XtpD01pinB6qL7EObSp76BfpIyQ';

@override
void initState() {
  loadMovies();
  super.initState();
  
}

  loadMovies()async{
    TMDB tmdbWithCustonLog =  TMDB(ApiKeys(apiKey, readAccesstojen),
    logConfig:const ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    ));
    
   Map<dynamic,dynamic> trendingResult =await tmdbWithCustonLog.v3.trending.getTrending();
   Map<dynamic,dynamic> topRatedResult =await tmdbWithCustonLog.v3.movies.getTopRated();
   Map<dynamic,dynamic> tvResult =await tmdbWithCustonLog.v3.tv.getPopular();

log(trendingResult.toString());

setState(() {
  trendingMovie = trendingResult['results'];
  topRatedMovie = topRatedResult['results'];
  tvv = tvResult['results'];
});
// ignore: avoid_print
print(trendingMovie);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Modifiedtext(text: 'Flutter Movie App ❤️',)),
        body: ListView(
          children: [
           TvWidget(tvw: tvv),
            TopRated(toprated: topRatedMovie,),
            TrendingMovies(trending: trendingMovie,)
          ],
        ),
      
      );
      
      
    
  }
}