class MealModel {
  final String type;
  final List<FoodList> foodList;

  MealModel({
    required this.type,
    required this.foodList,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
        type: json["type"],
        foodList: json["foodList"]
            .map<FoodList>((e) => FoodList.fromJson(e))
            .toList(),
      );
}

class FoodList {
  final String image;
  final String title;
  final String ingredients;
  final int protein;
  final int carbohydrates;
  final int fats;
  final String description;

  FoodList({
    required this.image,
    required this.title,
    required this.ingredients,
    required this.protein,
    required this.carbohydrates,
    required this.fats,
    required this.description,
  });

  factory FoodList.fromJson(Map<String, dynamic> json) => FoodList(
        image: json["image"],
        title: json["title"],
        ingredients: json["ingredients"],
        protein: json["protein"],
        carbohydrates: json["carbohydrates"],
        fats: json["fats"],
        description: json["description"],
      );
}
