import 'package:edvoy_app/themes/app_colors.dart';
import 'package:edvoy_app/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView>{

  List<HelpViewDetails> topCategoryList =
  [
    HelpViewDetails(text: 'Mechanical Engineering', subTitleText: '', icon: const Icon(Icons.settings,color: Colors.black,),imagePath: ""),
    HelpViewDetails(text: 'Computer Engineering', subTitleText: '', icon: const Icon(Icons.computer,color: Colors.black,),imagePath: ""),
    HelpViewDetails(text: 'Business Administration', subTitleText: '', icon: const Icon(Icons.business_center_outlined,color: Colors.black,),imagePath: ""),
    HelpViewDetails(text: 'Data Sciences and Big Data', subTitleText: '', icon: const Icon(Icons.cast_for_education_rounded,color: Colors.black,),imagePath: ""),

  ];

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: ListView(
          children: <Widget>
          [

            PreferredSize(
              child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: const BoxDecoration(

                  ),
                  child:  CupertinoTextField(
                    enabled: false,
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    placeholder: 'Search courses,institutions and more',
                    placeholderStyle: GoogleFonts.francoisOne(
                      color: const Color(0xffC4C6CC),
                      fontSize: 14.0,
                    ),
                    prefix: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                    suffix: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.mic,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                  )
              ),
              preferredSize: const Size.square(50.0),
            ),

            Container(
              height: 10.0,
              color: Theme.of(context).dividerColor,
            ),


            Center(
              child: Padding(
                padding:
                const EdgeInsets.only(bottom: 24.0,left: 24,right: 24,top: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/search_result_icon.png',
                      width: 300,
                      height: 150,
                    ),
                    Center(
                      child: Text(
                        "We'll help you find the right courses",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.francoisOne(
                          fontSize: 18,
                          letterSpacing: 0.8,
                          color: Colors.black,
                          wordSpacing: 2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Seah thousands of top courses by \n subject or university",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.francoisOne(
                            color: Colors.black,
                            fontSize: 15,),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              color: Colors.white,

              child: ListTile(
                title: Text("Top searches",style: GoogleFonts.francoisOne(
                    color: Colors.black, fontSize: 18, height: 1.2)),
                onTap: (){},
              ),
            ),

            Container(
              color: Theme.of(context).dividerColor,
              height: 2,
            ),

            chipList(),

            Container(
              color: Theme.of(context).dividerColor,
              height: 8,
            ),


            Container(
              color: Colors.white,

              child: ListTile(
                title: Text("Browse subjects",style: GoogleFonts.francoisOne(
                    color: Colors.black, fontSize: 18, height: 1.2)),
                onTap: (){},
              ),
            ),

            Container(
              color: Theme.of(context).dividerColor,
              height: 2,
            ),

            ListView.builder(
              itemCount: topCategoryList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index)
              {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>
                  [
                    ListTile(
                      leading: topCategoryList[index].icon,
                      trailing: const Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size: 16,),
                      title: Text(topCategoryList[index].text,style: GoogleFonts.francoisOne(
                          color: Colors.black, fontSize: 15, height: 1)),
                      onTap: (){},
                    ),
                  ],
                );
              },
            ),

          ],
        ),
      ),
    );
  }


  chipList()
  {

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
        child: ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index)
            {
              switch(index)
              {
                case 0: return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left : 14.0, right: 14.0),
                    child: Wrap(
                      spacing: 6.0,
                      runSpacing: 6.0,
                      children: <Widget>
                      [
                        _buildChip('Emergency Medicine', const Color(0xFF60230b),"210"),
                        _buildChip('Information Technology', const Color(0xFF60230b),"210"),
                        _buildChip('Engineering And Technology', const Color(0xFF60230b),"210"),
                        _buildChip('Business Administration', const Color(0xFF60230b),"210"),
                        _buildChip('Artificial Intelligence', const Color(0xFF60230b),"210"),
                        _buildChip('Data Science and Big data', const Color(0xFF60230b),"210"),
                        _buildChip('Business',const Color(0xFF60230b),"50"),
                        _buildChip('Medicine',const Color(0xFF60230b),"82"),
                        _buildChip('Finance',const Color(0xFF60230b),"80"),
                        _buildChip('Health care',const Color(0xFF60230b),"63"),
                        _buildChip('Software Design', const Color(0xFF60230b),"210"),
                        _buildChip('Machine Learning', const Color(0xFF60230b),"210"),
                        _buildChip('Cloud Computing', const Color(0xFF60230b),"210"),

                      ],
                    ),
                  ),
                );
              }
              return Container(height: 1,);
            }),
      ),
    );

  }

  Widget _buildChip(String label, Color color,String categoryID)
  {
    return ActionChip(
      labelPadding: const EdgeInsets.all(2.0),
      label: Text(
        label,
        style: GoogleFonts.francoisOne(
            color: Colors.black, fontSize: 14, height: 1.2),
      ),
      shape : RoundedRectangleBorder(
        side: const BorderSide(color: Colors.grey, width: 0.4),
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: successColor.withOpacity(0.2),
      elevation: 6.0,
      shadowColor: Colors.grey.withOpacity(0.4),
      padding: const EdgeInsets.all(8.0),
      onPressed: ()
      {

      },
      pressElevation: 0.5,
    );
  }

}