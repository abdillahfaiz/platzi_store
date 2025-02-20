import 'package:flutter/material.dart';
import 'package:platzi_store/provider/product_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProductProvider()..getProducts(),
        child: const _HomeScreenContent());
  }
}

class _HomeScreenContent extends StatefulWidget {
  const _HomeScreenContent();

  @override
  State<_HomeScreenContent> createState() => __HomeScreenContentState();
}

class __HomeScreenContentState extends State<_HomeScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/create-product');
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Consumer<ProductProvider>(
        builder: (context, state, child) {
          if (state.isLoading) {
            return Center(
              child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Image.asset('assets/gif/loading.gif')),
            );
          } else if (state.errorMessage != '') {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            // if (state.data.isNotEmpty) {
            //   WidgetsBinding.instance.addPostFrameCallback((_) {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(
            //         backgroundColor: Colors.green,
            //         action: SnackBarAction(label: 'Oke', onPressed: () {}),
            //         content: Text(
            //           "Succes to get Data",
            //           style: TextStyle(
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //     );
            //   });
            // }

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
                  onTap: () {
                    Navigator.pushNamed(context, '/detail-product',
                        arguments: {'id': data.id, 'title': data.title});
                  },
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
