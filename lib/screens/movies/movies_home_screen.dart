import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:wallpapers_app/utility/customPackage/custom_class.dart';
import 'package:wallpapers_app/utility/text/text.dart';
import 'package:wallpapers_app/widget/treanding_movies.dart';
class MoviesHomeScreen extends StatefulWidget {
  const MoviesHomeScreen({super.key});

  @override
  State<MoviesHomeScreen> createState() => _MoviesHomeScreenState();
}

class _MoviesHomeScreenState extends State<MoviesHomeScreen> {
  List treandingMoviesList=[];
  List topRatedMovies=[];
  List tvShows=[];

  final apiKey='9fc6d391a6156aa37fab8528863dbc7a';
  final resendToken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZmM2ZDM5MWE2MTU2YWEzN2ZhYjg1Mjg4NjNkYmM3YSIsInN1YiI6IjY2NWQ0NTVjMzAxNDU0NmFkNDQyMTk5NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5dLPD6yhtG3ygv6nNBVx3uMTGRfD-Z21h07dE9QjJgk';

  fatchingMoviesFromService()async{
    TMDB tmdb= TMDB(ApiKeys(apiKey,resendToken),
    logConfig: ConfigLogger(
      showErrorLogs: true,
      showLogs: true,
    )
    );
    Map treandingResult=await tmdb.v3.trending.getTrending();
    Map topRatedResult=await tmdb.v3.movies.getTopRated();
    Map tvResults=await tmdb.v3.tv.getTopRated();
    setState(() {
      treandingMoviesList=treandingResult['results'];
      topRatedMovies=topRatedResult['results'];
      tvShows=tvResults['results'];

    });
    print(tvShows);

  }
  void initState(){
    super.initState();
    fatchingMoviesFromService();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: CustomText(color: Colors.white,size: 33,content: "Movies",),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TreandingMovies(treanding: treandingMoviesList,titledMovied: " Treanding Movies",),
            TreandingMovies(treanding: topRatedMovies,titledMovied: " TopRated Movies 🎬",),
            TreandingMovies(treanding: tvShows,titledMovied: " TV Shows 📺",),
            customMaterialButtonWidget2(content: Text("dcdc",style: TextStyle(color: Colors.white),), onTap: (){fatchingMoviesFromService();}),
          ],
        ),
      ),
    );
  }
}
