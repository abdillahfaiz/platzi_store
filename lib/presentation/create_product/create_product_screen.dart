import 'package:flutter/material.dart';
import 'package:platzi_store/provider/create_product_provider.dart';
import 'package:provider/provider.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CreateProductProvider(), child: const _Content());
  }
}

class _Content extends StatefulWidget {
  const _Content({super.key});

  @override
  State<_Content> createState() => __ContentState();
}

class __ContentState extends State<_Content> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();
  final categoryIdController = TextEditingController();
  final imagesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: descController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: categoryIdController,
              decoration: InputDecoration(
                labelText: 'Category ID',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: imagesController,
              decoration: InputDecoration(
                labelText: 'Images',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final title = titleController.text;
                  final price = int.parse(priceController.text);
                  final desc = descController.text;
                  final categoryId = int.parse(categoryIdController.text);
                  final images = imagesController.text;

                  await context
                      .read<CreateProductProvider>()
                      .addProduct(title, price, desc, categoryId, images);
                },
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      // body: Column(
      //   spacing: 10,
      //   children: [
      // TextField(
      //   controller: titleController,
      //   decoration: InputDecoration(
      //     labelText: 'Title',
      //     border: OutlineInputBorder(),
      //   ),
      // ),
      // TextField(
      //   controller: priceController,
      //   decoration: InputDecoration(
      //     labelText: 'Price',
      //     border: OutlineInputBorder(),
      //   ),
      // ),
      // TextField(
      //   controller: descController,
      //   decoration: InputDecoration(
      //     labelText: 'Description',
      //     border: OutlineInputBorder(),
      //   ),
      // ),
      // TextField(
      //   controller: categoryIdController,
      //   decoration: InputDecoration(
      //     labelText: 'Category ID',
      //     border: OutlineInputBorder(),
      //   ),
      // ),
      // TextField(
      //   controller: imagesController,
      //   decoration: InputDecoration(
      //     labelText: 'Images',
      //     border: OutlineInputBorder(),
      //   ),
      // ),
      //     ElevatedButton(
      //       onPressed: () async {
      //         final provider = context.read<ProductProvider>();

      //         await provider.createProduct(
      //           titleController.text,
      //           int.tryParse(priceController.text) ?? 0,
      //           descController.text,
      //           int.tryParse(categoryIdController.text) ?? 0,
      //           imagesController.text,
      //         );

      //         if (provider.createProductResponse != null) {
      //           if (!mounted)
      //             return; // Cegah Snackbar muncul jika widget sudah di-dispose
      //           ScaffoldMessenger.of(context).showSnackBar(
      //             SnackBar(
      //               content: Text('Produk berhasil dibuat!'),
      //               backgroundColor: Colors.green,
      //             ),
      //           );
      //         } else if (provider.errorMessage.isNotEmpty) {
      //           if (!mounted) return;
      //           ScaffoldMessenger.of(context).showSnackBar(
      //             SnackBar(
      //               content: Text('Gagal: ${provider.errorMessage}'),
      //               backgroundColor: Colors.red,
      //             ),
      //           );
      //         }
      //       },
      //       child: const Text('Submit'),
      //     ),
      //   ],
      // ),
    );
  }
}
