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
    Vocabulary(
      word: "Cat",
      translation: "แมว",
      imageUrl:
          "https://media.istockphoto.com/id/1073475928/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/%E0%B9%81%E0%B8%A1%E0%B8%A7%E0%B8%82%E0%B8%B4%E0%B8%87.jpg?s=1024x1024&w=is&k=20&c=TI40ap7vOb-wA1Ae3YIOcErdclFVdsB3x_wdDXI3PaY=",
      category: "Animals",
    ),
    // เพิ่มคำศัพท์อื่นๆ ตามต้องการ
  ].obs;

  List<Vocabulary> getVocabulariesByCategory(String category) {
    return vocabularies.where((vocab) => vocab.category == category).toList();
  }
}
