import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/helper/functions_helper.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/pages/cart_screen.dart';
import 'package:e_commerce/pages/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/fav_cubit/fav_cubit.dart';
import '../models/category_model.dart';
import '../network/apis_const.dart';

/* 
  favorites:
 // List<ProductModel> favorites = [];
  addToFav  for save product  in favorites
  removeFromFav for remove product id from favorites
  display favorites in ui 



 */

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "الرئيسية",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {
              navToPage(context: context, page: const CartScreen());
            },
            icon: const Icon(
              Icons.shopping_bag,
              color: Colors.black,
              size: 25,
            )),
        actions: [
          IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              constraints: const BoxConstraints(),
              onPressed: () {
                signOut(context);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
                size: 25,
              )),
        ],
      ),
      body: BlocBuilder<FavCubit, FavState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                       height: 60,
                            width: 60,
                        decoration:BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.green
                          ),
                      
                      shape: BoxShape.circle

                        ) ,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                            imageUrl: profileImage != null
                                ? ApisConst.baseUrlImage + profileImage!
                                : "",
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => SizedBox(
                                   height: 70,
                            width: 70,
                                child:
                                    Center(child: CircularProgressIndicator())),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text("${firstName!} , ${lastName!}",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "👋",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 45,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Categories",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),

                  // ! list category
                  const SizedBox(
                    height: 30,
                  ),

                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Stack(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image:
                                            AssetImage(categories[index].image),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(79, 0, 0, 0)),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.black,
                                    child: Text(
                                      categories[index].name,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  const Text(
                    "Products",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          navToPage(
                              context: context,
                              page: ProductDetailsScreen(
                                  product: products[index]));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: SizedBox(
                            height: 100,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image:
                                            AssetImage(products[index].image),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          const Color.fromARGB(109, 0, 0, 0)),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    products[index].name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )

                                // ! fav
                                ,
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    onPressed: () {
                                      FavCubit.get(context)
                                          .addToFavOrRemoveFromFav(
                                        products[index],
                                      );
                                    },
                                    icon: Icon(
                                      FavCubit.get(context)
                                              .favorites
                                              .contains(products[index])
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
