class ProductModel {
  final int id;
  final String name;
  final String image;
  final String description;
  final double price;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });
}

List<ProductModel> products = [
  ProductModel(
    id: 1,
    name: "كيلو سكر",
    image: "assets/images/pro3.jpg",
    description: "سوبر ماركت كارفور - اشتري اون لاين منتجات البقالة بأفضل سعر و استمتع بعروض كارفور على الشوكولاته و لبن و حتي الزيت و استمتع بشحن و ارجاع سهل، دفع عند ...",
    price: 4.99,
  ),
  ProductModel(
    id: 2,
    name: "كيلو أرز",
    image: "assets/images/pro1.jpeg",
    description: "سوبر ماركت كارفور - اشتري اون لاين منتجات البقالة بأفضل سعر و استمتع بعروض كارفور على الشوكولاته و لبن و حتي الزيت و استمتع بشحن و ارجاع سهل، دفع عند ...",
    price: 4.99,
  ),
  ProductModel(
    id: 3,
    name: "كيس شيبسي ملون",
    image: "assets/images/pro2.jpg",
    description:  "سوبر ماركت كارفور - اشتري اون لاين منتجات البقالة بأفضل سعر و استمتع بعروض كارفور على الشوكولاته و لبن و حتي الزيت و استمتع بشحن و ارجاع سهل، دفع عند ...",
    price: 4.99,
  ),
  ProductModel(
    id: 4,
    name: "عصير جهينة ",
    image: "assets/images/pro4.jpg",
    description:  "سوبر ماركت كارفور - اشتري اون لاين منتجات البقالة بأفضل سعر و استمتع بعروض كارفور على الشوكولاته و لبن و حتي الزيت و استمتع بشحن و ارجاع سهل، دفع عند ...",
    price: 4.99,
  ),
];
