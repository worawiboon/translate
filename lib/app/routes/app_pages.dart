import 'package:get/get.dart';
import 'package:translate/app/bindings/home_binding.dart';
import 'package:translate/app/modules/flashcard/flashcard_page.dart';
import 'package:translate/app/modules/home/home_page.dart';
import 'package:translate/app/modules/matching_game/matching_game_page.dart';

abstract class Routes {
  static const HOME = '/home';
  static const FLASHCARD = '/flashcard';
  static const MATCHING_GAME = '/matching-game';
}

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.FLASHCARD,
      page: () => FlashcardPage(),
    ),
    GetPage(
      name: Routes.MATCHING_GAME,
      page: () => MatchingGamePage(),
    ),
  ];
}
