import 'package:edvoy_app/themes/app_colors.dart';
import 'package:edvoy_app/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class EdvoyDrawer extends StatefulWidget
{
  const EdvoyDrawer({Key? key}) : super(key: key);

  @override
  _EdvoyDrawerDrawerState createState() => _EdvoyDrawerDrawerState();
}

class _EdvoyDrawerDrawerState extends State<EdvoyDrawer> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(

        child: Container(
          color: Theme.of(context).backgroundColor,
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: <Widget>
            [
              DrawerHeader(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                  ),
                  child: InkWell(
                    onTap: ()
                    {
                      Navigator.of(context).pop();

                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                      [

                        Container(
                          width: CustomAppTheme.fullWidth(context) * 0.70,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              stops: [0.2, 0.6,1],
                              colors: [ buttonStart,buttonMiddle,buttonEnd],
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
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

                        Container(
                          width: CustomAppTheme.fullWidth(context) * 0.70,
                          decoration: BoxDecoration(
                            color:  Colors.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Log in",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.francoisOne(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.elasticInOut),

              ListTile(
                title: Text("Explore",style: GoogleFonts.francoisOne(
                    color: Colors.black87.withOpacity(0.6), fontSize: 17, height: 1.2)),
                onTap: (){},
              ),

              drawerItemView('', 'Courses', context,"image",const Icon(Icons.local_library_outlined,color: buttonStart,size: 24,),  onTap: () { }),
              drawerItemView('', 'Institutions', context,"image",const Icon(Icons.account_balance_outlined,color: buttonStart,size: 24,),  onTap: () { }),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Container(
                  height: 1,
                  color: Colors.grey.withOpacity(0.35),
                ),
              ),


              ListTile(
                title: Text("Company",style: GoogleFonts.francoisOne(
                    color: Colors.black87.withOpacity(0.6), fontSize: 17, height: 1.2)),
                onTap: (){},
              ),
              drawerItemView('', 'About Edvoy', context,"image",const Icon(Icons.error_outline_sharp,color: buttonStart,size: 24,),  onTap: () { }),
              drawerItemView('', 'Articles', context,"image",const Icon(Icons.article_outlined,color: buttonStart,size: 24,),  onTap: () { }),
              drawerItemView('', 'Careers', context,"image",const Icon(Icons.cast_for_education_outlined,color: buttonStart,size: 24,),  onTap: () { }),
              drawerItemView('', 'Contact us', context,"image",const Icon(Icons.contact_support_outlined,color: buttonStart,size: 24,),  onTap: () { }),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Container(
                  height: 1,
                  color: Colors.grey.withOpacity(0.35),
                ),
              ),

              ListTile(
                title: Text("Resources",style: GoogleFonts.francoisOne(
                    color: Colors.black87.withOpacity(0.6), fontSize: 17, height: 1.2)),
                onTap: (){},
              ),

              drawerItemView('', 'Knowledge Base', context,"image",const Icon(Icons.contact_support_outlined,color: buttonStart,size: 24,),  onTap: () { }),

              drawerItemView('', 'Events', context,"image",const Icon(Icons.event_note,color: buttonStart,size: 24,),  onTap: () { }),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Container(
                  height: 1,
                  color: Colors.grey.withOpacity(0.35),
                ),
              ),

              const SizedBox(height: 24.0),

              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                [

                  Container(
                    width: CustomAppTheme.fullWidth(context) * 0.70,
                    decoration: BoxDecoration(
                      color:  Colors.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Currency INR",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.francoisOne(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24.0),
                  Container(
                    width: CustomAppTheme.fullWidth(context) * 0.70,
                    decoration: BoxDecoration(
                      color:  Colors.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Download app",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.francoisOne(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Term of Service - Privacy Policy",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.francoisOne(
                          color: Colors.black,
                          fontSize: 14),
                    ),
                  ),



                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " © 2020 - 2021 Edvoy™ Educational Services Ltd. All rights reserved.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.francoisOne(
                          color: Colors.black,
                          fontSize: 14),
                    ),
                  ),

                  const SizedBox(height: 24.0),


                ],
              ),


            ],
          ),
        ),
      ),
    );
  }

  drawerItemView(String imagePath, String name, BuildContext context,String type,Icon icon,{required Function onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.7),
        onTap: () {
          try {
            Navigator.of(context).pop();
            onTap();
          } catch (e) {
            print(e);
          }
        },
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16, top: 8.0, bottom: 8.0),
              child: name == 'Home'
                  ? Container(
                decoration: BoxDecoration(
                    color: const Color(0xffF3F7FA),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: imagePath.isEmpty ? icon :Image.asset(
                    'assets/image/$imagePath',
                    width: 30,
                    height: 30,
                  ),
                ),
              )
                  : Container(
                decoration: BoxDecoration(
                    color: const Color(0xffF3F7FA),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: imagePath.isEmpty ? icon : Image.asset(
                    'assets/image/$imagePath',
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                name,
                style:  GoogleFonts.francoisOne(
                    color: Colors.black, fontSize: 15.5, height: 1),
              ),
            )
          ],
        ),
      ),
    );
  }


}


