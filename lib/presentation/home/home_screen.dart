import 'package:flutter/material.dart';
import 'package:platzi_store/provider/product_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.microtask(() {
      context.read<ProductProvider>().getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Consumer<ProductProvider>(
        builder: (context, state, child) {
          if (state.isLoading) {
            return Center(
              child: Image.asset('assets/gif/loading.gif'),
            );
          } else if (state.errorMessage != '') {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return ListView.separated(
              itemCount: state.data.length,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 16,
                );
              },
              itemBuilder: (context, index) {
                // simpan dummyData di variable data per index
                final data = state.data[index];

                return ListTile(
                  leading: Image.network(data.images![0]),
                  title: Text(
                    data.title ?? '-',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(data.price.toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
