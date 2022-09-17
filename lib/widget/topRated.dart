
// ignore_for_file: file_names

import 'package:final_project_flutter/utils/text.dart';
import 'package:flutter/material.dart';

class TopRated extends StatelessWidget {

final List? toprated ;
const TopRated({Key? key, this.toprated}):super(key: key);
 
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       const Modifiedtext(text: 'Top Rated Movie' ,size: 26,),
       const SizedBox(height: 10,),
        SizedBox(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: toprated!.length,
            itemBuilder: (context,index){
              return InkWell(
                onTap: (){},
                child: SizedBox(
                  width: 140,
                  child: Column(children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(image: DecorationImage(
                        image: NetworkImage('https://image.tmdb.org/t/p/w500'+toprated![index]['poster_path'])
                        ),
                        ),
                    ),
                    Modifiedtext(text: toprated![index]['title'] ?? 'Loading')
                  ],),

                  
                ),

              );
            }),
        ),

      ],),
    );
  }
}