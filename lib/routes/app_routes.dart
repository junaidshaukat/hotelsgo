import '../presentation/home/binding.dart';
import '/export.dart';

class AppRoutes {
  static const String home = '/';

  static const String initialRoute = home;

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => const Home(),
      bindings: [
        HomeBinding(),
      ],
    )
  ];
}
