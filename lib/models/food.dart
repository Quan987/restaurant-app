import 'package:project2/models/extra_item.dart';

class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  List<ExtraItem> extra;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.extra,
  });
}
