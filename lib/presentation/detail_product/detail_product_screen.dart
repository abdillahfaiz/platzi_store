import 'package:flutter/material.dart';
import 'package:platzi_store/core/components/app_button.dart';
import 'package:platzi_store/core/const/string_const.dart';
import 'package:platzi_store/data/model/product_model.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  late ProductModel argument;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    argument = ModalRoute.of(context)!.settings.arguments as ProductModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: Image.network(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  argument.images![0],
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                argument.title ?? 'null',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Rp${argument.price}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(argument.description ?? 'null'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButton(
                    label: StringConst.addProduct,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  AppButton(
                    label: 'Beli Sekarang',
                    onPressed: () {},
                  ),
                ],
              ),

              // AppButton(),
            ],
          ),
        ),
      ),
    );
  }
}
