import 'package:edvoy_app/themes/app_colors.dart';
import 'package:edvoy_app/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ShortListView extends StatefulWidget {
  const ShortListView({Key? key}) : super(key: key);

  @override
  _ShortListViewState createState() => _ShortListViewState();
}

class _ShortListViewState extends State<ShortListView>{



  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          title: Image.asset("assets/images/edvoy_app_logo.png",
              height: 30,
              width: double.maxFinite,
              alignment: Alignment.centerLeft,),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left : 24.0, right: 24.0,bottom: 24.0),
          child: ListView(
            children: <Widget>
            [

              Text(
                "Shortlist",
                textAlign: TextAlign.start,
                style: GoogleFonts.francoisOne(
                  fontSize: 24,
                  letterSpacing: 0.8,
                  color: Colors.black,
                  wordSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Start planning your study abroad journey by tapping the heart ♡ on your favourite courses. You'll find them right here waiting for you.",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.francoisOne(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),



              Padding(
                padding: const EdgeInsets.fromLTRB(0, 24.0, 0, 2.0),
                child: Container(
                  width: CustomAppTheme.fullWidth(context),
                  height: 48,
                  decoration: BoxDecoration(
                    gradient:  const LinearGradient(
                      stops:  [0.4, 0.6,1],
                      colors: [ buttonStart,buttonMiddle,buttonEnd],
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(
                    child: Text(
                      "Get Started",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.francoisOne(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),

              ),


            ],
          ),
        ),
      ),
    );
  }

}