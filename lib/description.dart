
import 'package:final_project_flutter/utils/text.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
// ignore: non_constant_identifier_names
final String? name , description, bannerurl , posterurl , vote , launch_on;

  // ignore: non_constant_identifier_names
  const Description({Key? key, this.name, this.description, this.bannerurl, this.posterurl, this.vote, this.launch_on}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(children: [
        SizedBox(
          height: 250,
          child: Stack(
            children: [
              Positioned(
              
                child: SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Image.network(bannerurl!,fit: BoxFit.cover,),
              )),
              Positioned(
                  bottom: 10,
                child: Modifiedtext(text: '⭐ Average Rating -' +vote!,size: 18,)),
            ],
          ),
        ),
        const SizedBox(height: 15,),
        Container(
          padding: const EdgeInsets.all(10),
          child: Modifiedtext(text: name ?? 'Not Loaded', size: 24,),
          
        ),
        Container(padding: const EdgeInsets.only(left: 10),
        child: Modifiedtext(text: 'Releasing On - ' +launch_on! , size: 14,),),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [Container(
              margin: const EdgeInsets.all(5),
              height: 200,
              width: 100,
              child: Image.network(posterurl!),
            ),
            SizedBox(
              width: 250,
              height: 150,
              child: Modifiedtext(text: description!,size: 18,))
            ],
          ),
        ),
      ],),
    );
  }
}