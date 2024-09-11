import 'package:flutter_base/constants/assets/local_icons.dart';
import 'package:flutter_base/services/route/routes.dart';

class BottomBarData {
  List<BottomBarDatum> data = [
    BottomBarDatum(title: "HOME", image: LocalIcons.home, route: Routes.home),
    // BottomBarDatum(
    //     title: "RESOURCES",
    //     image: LocalIcons.resources,
    //     route: Routes.resources),
    // BottomBarDatum(
    //     title: "TRAININGS", image: LocalIcons.training, route: Routes.training),
    // BottomBarDatum(
    //     title: "PROFILE", image: LocalIcons.profile, route: Routes.profile),
  ];
}

class BottomBarDatum {
  final String title, image, route;

  BottomBarDatum({required this.title, this.image = '', required this.route});
}
