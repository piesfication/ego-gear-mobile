import 'package:flutter/material.dart';
import 'package:ego_gear/models/product_entry.dart';
import 'package:ego_gear/widgets/left_drawer.dart';
import 'package:ego_gear/screens/product_detail.dart';
import 'package:ego_gear/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:ego_gear/screens/product_detail.dart';

class ProductEntryListPage extends StatefulWidget {

  final String filter;

  const ProductEntryListPage({super.key, required this.filter});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();

  
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000
    
    final response = await request.get("https://muhammad-rafi42-egogear.pbp.cs.ui.ac.id/json/");
    
    // print(response);
    // Decode response to json format
    var data = response;

    // Convert json data to ProductEntry objects
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  Future<void> increaseHype(CookieRequest request, String productId) async {
    final response = await request.post(
      "https://muhammad-rafi42-egogear.pbp.cs.ui.ac.id/products/$productId/increase_hype/",
      {},
    );

    print("Increase hype response: $response");
  }


  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'There are no product in football product yet.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
                // Ambil semua produk
                List<ProductEntry> allProducts = snapshot.data!;

                // Ambil user yang login
                final currentUserId = (request.loggedIn && request.jsonData["id"] != null)
                  ? int.tryParse(request.jsonData["id"].toString())
                  : null;
                
                print("Current logged-in user id: $currentUserId");
                print("Cookie JSON data:");
                print(request.jsonData);

 
                // Sesuaikan dengan struktur data login kamu

                // Lakukan filter berdasarkan widget.filter
                List<ProductEntry> filtered;
                if (widget.filter == "all") {
                  filtered = allProducts;
                } else {
                  filtered = allProducts
                      .where((p) => p.userId != null && currentUserId != null && p.userId == currentUserId)
                      .toList();
                }

                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (_, index) => ProductEntryCard(
                    product: filtered[index],
                    onTap: () async {

                      await increaseHype(request, filtered[index].id);

                      // 2. Update hype lokal supaya UI langsung berubah
                      setState(() {
                        filtered[index].hype++;
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                          product: filtered[index],
                          ),
                        ),
                      );

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text("You clicked on ${filtered[index].name}"),
                          ),
                        );
                    },
                  ),
                );
              }

          }
        },
      ),
    );
  }
}