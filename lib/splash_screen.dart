import 'package:final_project_flutter/home.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigateFun() async{
    await Future.delayed(const Duration(seconds: 3));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));

  }

  @override
  Widget build(BuildContext context) {
    navigateFun();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(

        child:Container(
          width: 210,
          height: 210,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50)
          ),
          child: Image.network('https://pbs.twimg.com/profile_images/1243623122089041920/gVZIvphd_400x400.jpg',
          fit: BoxFit.cover,)),
      ),
    );
  }
}
