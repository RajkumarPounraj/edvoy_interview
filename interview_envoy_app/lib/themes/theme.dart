import 'package:animations/animations.dart';
import 'package:edvoy_app/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppTheme {
  const CustomAppTheme();

  static ThemeData lightAppTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        elevation: 2,
        color: Colors.white,
        textTheme: TextTheme(
            subtitle1: TextStyle(color: Colors.black),
            caption: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black)),
    primaryTextTheme: const TextTheme(subtitle1: TextStyle(color: Colors.black)),
    backgroundColor: lightBackgroundColor,
    hoverColor: lightIconBackgroundColor,
    dividerColor: lightIconBackgroundColor,
    sliderTheme: SliderThemeData(trackShape: CustomTrackShape()),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Colors.white),
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: lightBackgroundColor,
        modalBackgroundColor: lightBackgroundColor),
    textTheme: const TextTheme(
      headline6: TextStyle(
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
      ),
      subtitle1: TextStyle(
        color: Colors.black,
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: SharedAxisPageTransitionsBuilder(
          transitionType: SharedAxisTransitionType.horizontal,
        ),
        TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
          transitionType: SharedAxisTransitionType.horizontal,
        ),
      },
    ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primaryColor),
  );

  static ThemeData darkAppTheme = ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    brightness: Brightness.dark,
    accentColor: primaryColor,
    textSelectionHandleColor: primaryColor,
    appBarTheme: AppBarTheme(
        elevation: 4,
        color: darkBackgroundColor,
        textTheme: TextTheme(subtitle1: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white)),
    backgroundColor: darkBackgroundColor,
    hoverColor: darkIconBackgroundColor,
    dividerColor: Colors.black.withOpacity(0.5),
    sliderTheme: SliderThemeData(trackShape: CustomTrackShape()),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: darkBackgroundColor),
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: darkBackgroundColor,
        modalBackgroundColor: darkBackgroundColor),
    textTheme: const TextTheme(
      headline6: TextStyle(
        color: Colors.white,
      ),
      bodyText2: TextStyle(
        color: Colors.white,
      ),
      subtitle1: TextStyle(
        color: Colors.white,
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: SharedAxisPageTransitionsBuilder(
          transitionType: SharedAxisTransitionType.horizontal,
        ),
        TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
          transitionType: SharedAxisTransitionType.horizontal,
        ),
      },
    ),
  );

  static Brightness brightness(BuildContext context) {
    return Theme.of(context).brightness;
  }

  static TextStyle titleStyle =
      const TextStyle(color: Colors.black54, fontSize: 16);
  static TextStyle subTitleStyle =
      const TextStyle(color: Colors.grey, fontSize: 12);

  static List<BoxShadow> shadow = <BoxShadow>[
    BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 15),
  ];

  static EdgeInsets padding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets hPadding = const EdgeInsets.symmetric(
    horizontal: 10,
  );

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }


  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }


}


class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, 3);
  }
}




