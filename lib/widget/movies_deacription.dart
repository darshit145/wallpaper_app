import 'package:flutter/material.dart';
import 'package:wallpapers_app/utility/text/text.dart';
class MoviesDeacription extends StatelessWidget {
  final Map datasForClass;
  MoviesDeacription({super.key,required this.datasForClass});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {

          },icon: Icon(Icons.arrow_back,color: Colors.white,),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 230,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500'+datasForClass['poster_path'],
                  ),fit: BoxFit.fill
                )
              ),
              // color: Colors.white,
            ),
            SizedBox(height: 16,),
            CustomTextForDescription(content:datasForClass['original_title']?? datasForClass['original_name']??"Loading..", size: 16, color: Colors.white),
            SizedBox(height: 16,),

            CustomTextForDescription(content: datasForClass['overview'], size: 13, color: Colors.white)

          ],
        ),
      ),
    );
  }
}
