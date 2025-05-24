import 'package:get/get.dart';
import '../models/vocabulary.dart';

class VocabularyService extends GetxService {
  final RxList<Vocabulary> vocabularies = <Vocabulary>[
    Vocabulary(
      word: "Apple",
      translation: "แอปเปิ้ล",
      imageUrl:
          "https://cdn.pixabay.com/photo/2016/01/05/13/58/apple-1122537_640.jpg",
      category: "Fruits",
    ),
    Vocabulary(
      word: "Dog",
      translation: "สุนัข",
      imageUrl:
          "https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313_640.jpg",
      category: "Animals",
    ),
    // เพิ่มคำศัพท์อื่นๆ ตามต้องการ
  ].obs;

  List<Vocabulary> getVocabulariesByCategory(String category) {
    return vocabularies.where((vocab) => vocab.category == category).toList();
  }
}
