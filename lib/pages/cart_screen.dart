import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context , index){

            ProductModel productModel= products[index];

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,width: .8
              )
            )
          ),
          child: Row(
            children: [

              Image.asset(productModel.image,
              height: 100,
                width: 100,
                fit:  BoxFit.cover,
              ),
              
              Expanded(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productModel.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                    ),
                    Text("${productModel.price} جنيه",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                      ),
                
                    ),
                    const Text("4x",
                        style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87
                    ),)
                    
                  ],
                ),
              )

          ,IconButton(onPressed: (){
               
              },
                  icon: const Icon(Icons.delete
                    ,color: Colors.red,size: 25,))

              
            ],
          ),
        );
      }),
    );
  }


}
