class ApiTwoModel {
  String requestId;
  List<ItemTwo> items;
  int count;
  String anyKey;

  ApiTwoModel({
    required this.requestId,
    required this.items,
    required this.count,
    required this.anyKey,
  });

  factory ApiTwoModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> itemsJson = json['items'];
    List<ItemTwo> itemsList = itemsJson.map((itemJson) => ItemTwo.fromJson(itemJson)).toList();

    return ApiTwoModel(
      requestId: json['requestId'],
      items: itemsList,
      count: json['count'],
      anyKey: json['anyKey'],
    );
  }
}

class ItemTwo {
  String createdAt;
  String name;
  int duration;
  String category;
  bool locked;
  String id;

  ItemTwo({
    required this.createdAt,
    required this.name,
    required this.duration,
    required this.category,
    required this.locked,
    required this.id,
  });

  factory ItemTwo.fromJson(Map<String, dynamic> json) {
    return ItemTwo(
      createdAt: json['createdAt'],
      name: json['name'],
      duration: json['duration'],
      category: json['category'],
      locked: json['locked'],
      id: json['id'],
    );
  }
}
