import 'package:edvoy_app/util/route_const.dart';
import 'package:edvoy_app/view/chat_view.dart';
import 'package:edvoy_app/view/edvoy_home_view.dart';
import 'package:edvoy_app/view/search_view.dart';
import 'package:edvoy_app/view/shortlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


abstract class RouterViews
{
  static Route<dynamic> generateRoute(RouteSettings settings)
  {
    switch (settings.name)
    {
      case RoutePaths.edvoyHomeView:
        return MaterialPageRoute(builder: (_) => const EdvoyHomeView());

      case RoutePaths.searchView:
        return MaterialPageRoute(builder: (_) => const SearchView());

      case RoutePaths.shortListView:
        return MaterialPageRoute(builder: (_) => const ShortListView());

      case RoutePaths.chatView:
        return MaterialPageRoute(builder: (_) => const ChatView());


      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
