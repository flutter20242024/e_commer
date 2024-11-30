import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quntity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.product.name,
            style: const TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                widget.product.image,
                height: 300,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.product.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "السعر : ${widget.product.price} ر.س",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "حدد الكمية",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              _plusQuntity();
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 35,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          quntity.toString(),
                          style:
                              const TextStyle(fontSize: 25, color: Colors.black),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () {
                              _minusQuntity();
                            },
                            icon: const Icon(
                              Icons.remove,
                              size: 35,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.orange,
                      minWidth: double.infinity,
                      height: 50,
                      onPressed: () {
                        showMyDialog(context);
                      },
                      child: const Text(
                        "اطلب الان",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  _plusQuntity() {
    setState(() {
      quntity++;
    });
  }

  _minusQuntity() {
    if (quntity > 1) {
      setState(() {
        quntity--;
      });
    }
  }

  // دالة لعرض الـDialog
  void showMyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "الطلبات",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: const Text(
            "تم ارسال طلبك بنجاح شكرا لاستخدامك التطبيق",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25, color: Colors.green, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // يمكنك إضافة أي عملية أخرى هنا
                Navigator.of(context).pop(); // غلق الـDialog
              },
              child: const Text(
                'حسنا',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        );
      },
    );
  }
}
