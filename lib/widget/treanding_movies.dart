import 'package:flutter/material.dart';
import 'package:wallpapers_app/utility/text/text.dart';
import 'package:wallpapers_app/widget/movies_deacription.dart';
class TreandingMovies extends StatelessWidget {
  final List treanding;
  final String titledMovied;
  TreandingMovies({required this.treanding,required this.titledMovied});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(content: "$titledMovied", size: 20, color: Colors.white),
          Container(
            height: 235,

            child: ListView.builder(
              itemCount: treanding.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 135,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MoviesDeacription(datasForClass: treanding[index],),));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,bottom: 10),
                          child: Container(
                            height: 175,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                image: NetworkImage(
                                  //https://image.tmdb.org/t/p/w500/ww1eIoywghjoMzRLRIcbJLuKnJH.jpg
                                    'https://image.tmdb.org/t/p/w500'+treanding[index]['poster_path']
                                ),fit: BoxFit.fill
                              )
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10),
                          child: CustomText(color: Colors.white,size: 15,content: treanding[index]['original_title']??treanding[index]['original_name']??"Movies" ,),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
        
      ),

    );
  }
}
