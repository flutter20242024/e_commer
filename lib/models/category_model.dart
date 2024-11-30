class CategoryModel {
  final String name;
  final String image;

  CategoryModel({required this.name, required this.image});
}

List<CategoryModel> categories = [
  CategoryModel(name: "مأكولات", image: "assets/images/cat1.jpeg"),
  CategoryModel(name: "مشروبات", image: "assets/images/cat2.jpeg"),
  CategoryModel(name: "حلويات", image: "assets/images/cat3.jpeg"),
    CategoryModel(name: "خضروات", image: "assets/images/cat2.jpeg"),
  CategoryModel(name: "فواكه", image: "assets/images/cat3.jpeg"),
    CategoryModel(name: "عطارة", image: "assets/images/cat3.jpeg"),
];
