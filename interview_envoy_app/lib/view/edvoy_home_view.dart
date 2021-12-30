
import 'dart:async';

import 'package:edvoy_app/themes/app_colors.dart';
import 'package:edvoy_app/themes/theme.dart';
import 'package:edvoy_app/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';


class EdvoyHomeView extends StatefulWidget
{
  const EdvoyHomeView({Key? key}) : super(key: key);

  @override
  _EdvoyHomeViewState createState() => _EdvoyHomeViewState();
}

class _EdvoyHomeViewState extends State<EdvoyHomeView>
{
  bool isAppBarExpanded = false;
  ScrollController _scrollController = ScrollController();
  final ScrollController _scrollControllerHelp = ScrollController();
  final ScrollController _scrollControllerNews = ScrollController();

  late Timer animationTimer;

  List<HelpViewDetails> list =
  [
    HelpViewDetails(text: 'Find courses', subTitleText: 'Browse the top courses from the \n comfort of your home.', icon: const Icon(Icons.search,color: buttonStart,size: 28,),imagePath: ""),
    HelpViewDetails(text: 'Apply and receive offers!', subTitleText: 'Instantly apply,upload academic \n documents and receive offers.', icon: const Icon(Icons.book_outlined,color: buttonStart,size: 28,),imagePath: ""),
    HelpViewDetails(text: 'Chat with us', subTitleText: 'Receive free,expert advice from \n one of friendly advisers.', icon: const Icon(Icons.chat_outlined,color: buttonStart,size: 28,),imagePath: ""),

  ];

  List<HelpViewDetails> listNews =
  [
    HelpViewDetails(subTitleText: '- 22nd Sep 2020', text: '"Edvoy focuses on empowering students \n worldwide through impartial advice by \n making them informed to make better decisions about their future."',icon: const Icon(Icons.search,color: buttonStart), imagePath: "yahoo_news.png"),
    HelpViewDetails(subTitleText: '- 2nd Nov 2020', text: '"Edvoy has a multilingual team of over 100 \n highly qualified education consultants and \n has so far placed 20,000 international students worldwide."',icon: const Icon(Icons.search,color: buttonStart), imagePath: "times_news.png"),
    HelpViewDetails(subTitleText: '- 2nd Sep 2020', text: '"Edvoy, an online platform promising \n impartial advice,application support and \n content for prospective international students across South Asia."',icon:const Icon(Icons.search,color: buttonStart) ,imagePath: "standard_news.png"),

  ];



  @override
  void initState()
  {
      super.initState();
      _scrollListener();

      animationTimer = Timer.periodic(const Duration(seconds: 3), (Timer timer)
      {
        if(_scrollControllerHelp.hasClients)
        {
          _scrollControllerHelp.animateTo(_scrollControllerHelp.position.maxScrollExtent, duration: const Duration(seconds: 3), curve: Curves.easeInToLinear);
        }
      });

  }

  _scrollListener() {
    try {
      _scrollController = ScrollController();
      _scrollController.addListener(() async {
        _scrollController.hasClients &&
                _scrollController.position.pixels > (220 - kToolbarHeight)
            ? setState(
                () {
                  isAppBarExpanded = true;
                },
              )
            : setState(
                () {
                  isAppBarExpanded = false;
                },
              );
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Theme.of(context).backgroundColor,
          height: double.infinity,
          child:  CustomScrollView(
            reverse: false,
            controller: _scrollController,
            physics: const ClampingScrollPhysics(),
            slivers: <Widget>
            [
              SliverAppBar(
                leading: isAppBarExpanded
                    ? IconButton(
                    icon: Material(
                        shape: const CircleBorder(),
                        color: Theme.of(context).hoverColor,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () =>
                              Scaffold.of(context).openDrawer(),
                          splashColor: Colors.grey.withOpacity(0.5),
                          child: const Padding(
                            padding: EdgeInsets.all(9.0),
                            child: Icon(
                              Icons.menu,
                              size: 21,
                            ),
                          ),
                        )),
                    onPressed: () =>
                        Scaffold.of(context).openDrawer())
                    : InkWell(
                  borderRadius: BorderRadius.circular(50),
                  child: IconButton(
                      icon: const Padding(
                        padding: EdgeInsets.all(9.0),
                        child: Icon(
                          Icons.menu,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () =>
                          Scaffold.of(context).openDrawer()),
                ),
                titleSpacing: 2,
                title: isAppBarExpanded
                    ? Image.asset(
                  "assets/images/edvoy_app_logo.png",
                  height: 30,
                  width: double.maxFinite,
                  alignment: Alignment.centerLeft,
                )
                    : Image.asset("assets/images/edvoy_app_logo.png",
                    height: 30,
                    width: double.maxFinite,
                    alignment: Alignment.centerLeft,
                    color: Colors.white),
                centerTitle: false,

                expandedHeight: 220.0,
                floating: false,
                pinned: true,
                snap: false,
                stretch: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  background: Container(
                    padding:
                    const EdgeInsets.only(top: 90, left: 10, right: 10),
                    height: 180,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:  <Widget>[
                            Center(
                              child: Text(
                                "Studying abroad.Simplified.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.francoisOne(
                                  fontSize: 24,
                                  letterSpacing: 0.8,
                                  color: Colors.white,
                                  wordSpacing: 2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                "Find,Apply and chat.It's that simple!.Start your journey in 2 minutes.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.francoisOne(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    decoration:  const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        image: AssetImage(
                          'assets/images/banner_img.png',
                        ),
                      ),
                    ),
                  ),
                ),
                backgroundColor: Colors.white,
                elevation: 1,
                shadowColor: Colors.grey,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>
                  [
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                            child: Container(
                              width: CustomAppTheme.fullWidth(context),
                              height: 44,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  stops: [0.2, 0.6,1],
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
                          _suggestionsView(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _suggestionsView() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>
            [
              Container(
                color: Theme.of(context).dividerColor,
                height: 8,
              ),

              Container(
                padding: const EdgeInsets.only(top: 14, left: 10, right: 10,bottom: 14.0),
                height: 180,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children:  <Widget>[
                        Center(
                          child: Text(
                            "We'll help you find the right courses",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.francoisOne(
                              fontSize: 24,
                              letterSpacing: 0.8,
                              color: Colors.black,
                              wordSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 14.0),
                          child: Text(
                            "Search from over 38,000 courses by \n subject or university",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.francoisOne(
                                color: Colors.black,
                                fontSize: 18,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                color: Theme.of(context).dividerColor,
                height: 8,
              ),

              Container(
                color: Colors.white,

                child: ListTile(
                  title: Text("TRENDING SUBJECTS",style: GoogleFonts.francoisOne(
                      color: Colors.black, fontSize: 17, height: 1.2)),
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

              const SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [

                    const SizedBox(height: 8.0),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Center(
                        child: Text(
                          "HOW IT WORKS",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.francoisOne(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: buttonStart),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Center(
                        child: Text(
                          "It's easier with \n Edvoy",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.francoisOne(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Center(
                        child: Text(
                          "We're here to do the hard work for you,saving \n your time and helping you find the best courses \n based on your interests and experience,all \n from your mobile!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.9)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Container(
                color: Theme.of(context).dividerColor,
                height: 8,
              ),

              SizedBox(
                height: 240,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: list.length,
                    controller: _scrollControllerHelp,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => _helpListItemView(list[index])),
              ),

              ListTile(
                leading: const Icon(Icons.add,color: buttonMiddle,size: 20,),
                title: Text("Compare and shortlist courses",style: GoogleFonts.francoisOne(
                    color: Colors.black, fontSize: 14.5, height: 1)),
                onTap: (){},
              ),

              ListTile(
                leading: const Icon(Icons.add,color: buttonMiddle,size: 20,),
                title: Text("Real time notifications to stay up to date",style: GoogleFonts.francoisOne(
                    color: Colors.black, fontSize: 14.5, height: 1)),
                onTap: (){},
              ),

              ListTile(
                leading: const Icon(Icons.add,color: buttonMiddle,size: 20,),
                title: Text("Upload your documents safely and securely",style: GoogleFonts.francoisOne(
                    color: Colors.black, fontSize: 14.5, height: 1)),
                onTap: (){},
              ),

              Container(
                color: Theme.of(context).dividerColor,
                height: 8,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [

                    const SizedBox(height: 14.0),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 14.0),
                      child: Center(
                        child: Text(
                          "Find the best \n university courses \n and study abroad, all with us.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.francoisOne(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
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



                    Padding(
                      padding: const EdgeInsets.only(bottom: 14.0),
                      child: Center(
                        child: Text(
                          "We're partnered with over 120 world class \n education providers",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.9)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                color: Theme.of(context).dividerColor,
                height: 8,
              ),



              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [

                    const SizedBox(height: 14.0),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Center(
                        child: Text(
                          "HELPING STUDENT LIKE YOU",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.francoisOne(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: buttonStart),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Center(
                        child: Text(
                          "Student at the \n heart of everything \n we do",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.francoisOne(
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14.0),
                      child: Center(
                        child: Text(
                          "We believe everyone has the right to an \n education and have helped over 20,000 \n students realise their dream to study abroad. \n  We can help students make the best decisions \n for them and their future.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.5,
                              color: Colors.black.withOpacity(0.9)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),



              Container(
                color: Theme.of(context).dividerColor,
                height: 8,
              ),




              SizedBox(
                height: 272,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: listNews.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => _newsListItemView(listNews[index])),
              ),

              const SizedBox(height: 14.0),

            ],
          ),
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

  _helpListItemView(HelpViewDetails helpListData)
  {

    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        height: 240,
        decoration: BoxDecoration(
          color: colorCombination.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>
            [
              Padding(
                padding:  const EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child:  CircleAvatar(
                    child: helpListData.icon,
                    backgroundColor: buttonMiddle.withOpacity(0.15),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom : 20.0),
                child: Text(
                  helpListData.text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.francoisOne(
                      fontWeight: FontWeight.w500,
                      color: Colors.black, fontSize: 17, height: 1),                              ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom : 20.0),
                child: Text(
                  helpListData.subTitleText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 15, height: 1),                            ),
              ),

            ],
          ),
        ),
      ),
    );

  }

  _newsListItemView(HelpViewDetails helpListData)
  {

    return Container(
      height: 272,
      width: CustomAppTheme.fullWidth(context),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>
          [
            Padding(
              padding:  const EdgeInsets.only(bottom: 10.0),
              child: Image.asset('assets/images/${helpListData.imagePath}',fit: BoxFit.fill,width: 100,height: 100,),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom : 10.0),
              child: Text(
                helpListData.text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black, fontSize: 15, height: 1),                              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom : 10.0),
              child: Text(
                helpListData.subTitleText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.8), fontSize: 14, height: 1),                            ),
            ),

          ],
        ),
      ),
    );

  }

  @override
  dispose()
  {
    super.dispose();

    _scrollController.dispose();
    _scrollControllerHelp.dispose();

    animationTimer.cancel();
  }


}
