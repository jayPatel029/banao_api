class ApiOneModel {
  String requestId;
  List<Item> items;
  int count;
  String anyKey;

  ApiOneModel({
    required this.requestId,
    required this.items,
    required this.count,
    required this.anyKey,
  });

  factory ApiOneModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> itemsJson = json['items'];
    List<Item> itemsList = itemsJson.map((itemJson) => Item.fromJson(itemJson)).toList();

    return ApiOneModel(
      requestId: json['requestId'],
      items: itemsList,
      count: json['count'],
      anyKey: json['anyKey'],
    );
  }
}

class Item {
  String createdAt;
  String name;
  String category;
  int lesson;
  String id;

  Item({
    required this.createdAt,
    required this.name,
    required this.category,
    required this.lesson,
    required this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      createdAt: json['createdAt'],
      name: json['name'],
      category: json['category'],
      lesson: json['lesson'],
      id: json['id'],
    );
  }
}
