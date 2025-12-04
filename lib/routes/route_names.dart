import 'package:get/get_navigation/src/routes/get_route.dart';

import '../views/content_page.dart';
import '../views/my_detail_page.dart';
import '../views/my_home_page.dart';

class RouteNames {
  static const String initial = '/';
  static const String homePage = '/home-page';
  static const String detailPage = '/detail-page';
  static const String contentPage = '/content-page';

  static String getInitial() => initial;
  static String getDetailPage(int id) => '$detailPage?id=$id';
  static String getContentPage() => contentPage;

  static List<GetPage<dynamic>> routes = [
    GetPage(name: initial, page: () => const MyHomePage()),
    GetPage(name: detailPage, page: () => DetailPage()),
    GetPage(name: contentPage, page: () => const ContentPage()),
  ];
}
