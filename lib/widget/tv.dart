import 'package:final_project_flutter/utils/text.dart';
import 'package:flutter/material.dart';

class TvWidget extends StatelessWidget {

final List? tvw ;
const TvWidget({Key? key, this.tvw}):super(key: key);
 
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       const Modifiedtext(text: 'Popular Tv Shows ' ,size: 26,),
       const SizedBox(height: 10,),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tvw!.length,
            itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  
                },
                child:
                
                 Container(
                   padding: const EdgeInsets.all(5),
                  width: 250,
                  child: Column(children: [
                    Container(
                     
                      width: 250,
                      height: 140,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                        image: NetworkImage('https://image.tmdb.org/t/p/w500'+tvw![index]['backdrop_path'])
                       ,fit: BoxFit.cover ),
                        ),
                    ),
                    const SizedBox(height: 10,),
                    Modifiedtext(text: tvw![index]['original_name'] ?? 'Loading')
                  ],),

                  
                ),

              );
            }),
        ),

      ],),
    );
  }
}