import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/fav_cubit/fav_cubit.dart';
import '../helper/functions_helper.dart';
import '../models/product_model.dart';
import 'product_details_screen.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  void initState() {
    super.initState();

    // BlocProvider.of<FavCubit>(context).getFavCubit();
 
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
    
    print(state.getFavState);

        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text("Fav Screen"),
            ),
            body: state.getFavState == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount:FavCubit.get(context).favorites.length,
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
                                        image: AssetImage(
                                             BlocProvider.of<FavCubit>(context).favorites[index].image),
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
                                    FavCubit.get(context).favorites[index].name,
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
                                    FavCubit.get(context).  addToFavOrRemoveFromFav(
                                          BlocProvider.of<FavCubit>(context).favorites[index]);
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      BlocProvider.of<FavCubit>(context).favorites.contains(products[index])
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
                  ));
      },
    );
  }
}
