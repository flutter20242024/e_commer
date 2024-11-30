import 'package:e_commerce/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavState());

  static FavCubit get(context) => BlocProvider.of(context);

  List<ProductModel> favorites = [];

  

  Future addToFavOrRemoveFromFav(ProductModel product) async {
    emit(FavState(getFavState: true));
    if (favorites.contains(product)) {
      favorites.remove(product);
    } else {
      favorites.add(product);
    }
    
    emit(FavState(getFavState: false));
  }
}
