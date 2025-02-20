import 'package:flutter/material.dart';
import 'package:platzi_store/data/api_service.dart';
import 'package:provider/provider.dart';


class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  late Map argument;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    argument = ModalRoute.of(context)!.settings.arguments as Map;
    ApiService().getDetailProduct(9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(argument['title'] ?? ''),
      ),
    );
  }
}
