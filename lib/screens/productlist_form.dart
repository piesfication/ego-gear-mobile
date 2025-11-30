import 'package:flutter/material.dart';
import 'package:ego_gear/widgets/left_drawer.dart';

import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:ego_gear/screens/menu.dart';


class ProductFormPage extends StatefulWidget {
    const ProductFormPage({super.key});

    @override
    State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {

    final _formKey = GlobalKey<FormState>();

    String _name = "";
    int _price = 0;
    String _description = "";
    String _category = "Playmaker"; // default
    String _thumbnail = "";
    bool _isFeatured = false; // default
    int _stock = 0;
    String _brand = "";

    final List<String> _categories = [
      "Finisher", "Speedster", "Playmaker", "Reinforcer", "Strategist", "Specialist"
    ];

    @override
    Widget build(BuildContext context) {

      final request = context.watch<CookieRequest>();

      return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Add Your Gear!',
            ),
          ),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
      drawer: const LeftDrawer(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                // === Title ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Name",
                      labelText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _name = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Nama tidak valid!";
                      }
                      return null;
                    },
                  ),
                ),

                // === Price ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Price",
                      labelText: "Price",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _price = int.tryParse(value) ?? 0;;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Harga tidak valid!";
                      }

                      final price = int.tryParse(value);

                      if (price == null) {
                        return "Harga harus berupa angka!";
                      } else if (price < 0) {
                        return "Harga tidak boleh negatif!";
                      }

                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Description",
                      labelText: "Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _description = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Deskripsi tidak valid!";
                      }
                      return null;
                    },
                  ),
                ),

                // === Category ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Category",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    value: _category,
                    items: _categories
                        .map((cat) => DropdownMenuItem(
                              value: cat,
                              child: Text(
                                  cat[0].toUpperCase() + cat.substring(1)),
                            ))
                        .toList(), 
                    onChanged: (String? newValue) {
                      setState(() {
                        _category = newValue!;
                      });
                    },
                  ),
                ),

                // === Thumbnail URL ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "URL Thumbnail",
                      labelText: "URL Thumbnail",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _thumbnail = value!;
                      });
                    },

                    validator: (String? value) {
                    
                      if (value == null || value.isEmpty) return null;

                  
                      final uri = Uri.tryParse(value);

                      if (uri == null || !(uri.isAbsolute && 
                          (uri.scheme == 'http' || uri.scheme == 'https'))) {
                        return "Masukkan URL yang valid!";
                      }
                       
                      return null;
                    }
                  ),
                ),

                // === Is Featured ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    title: const Text("Tandai sebagai Gear Unggulan"),
                    value: _isFeatured,
                    onChanged: (bool value) {
                      setState(() {
                        _isFeatured = value;
                      });
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Stock",
                      labelText: "Stock",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _stock = int.tryParse(value) ?? 0;;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Stock tidak valid!";
                      }

                      final stck = int.tryParse(value);

                      if (stck == null) {
                        return "Stock harus berupa angka!";
                      } else if (stck < 0) {
                        return "Stock tidak boleh negatif!";
                      }

                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Brand",
                      labelText: "Brand",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _brand = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Brand tidak valid!";
                      }
                      return null;
                    },
                  ),
                ),

                // === Tombol Simpan ===
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.indigo),
                      ),
                      // onPressed: () {
                      //   if (_formKey.currentState!.validate()) {
                      //     showDialog(
                      //       context: context,
                      //       builder: (context) {
                      //         return AlertDialog(
                      //           title: const Text('Gear berhasil disimpan!'),
                      //           content: SingleChildScrollView(
                      //             child: Column(
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 Text('Name: $_name'),
                      //                 Text('Price: $_price'),
                      //                 Text('Description: $_description'),
                      //                 Text('Category: $_category'),
                      //                 Text('Thumbnail: $_thumbnail'),
                      //                 Text(
                      //                     'Is Featured: ${_isFeatured ? "Ya" : "Tidak"}'),
                      //                 Text('Stock: $_stock'),
                      //                 Text('Brand: $_brand'),
                      //               ],
                      //             ),
                      //           ),
                      //           actions: [
                      //             TextButton(
                                    
                      //               child: const Text('OK'),
                      //               onPressed: () {
                      //                 Navigator.pop(context);
                      //                 _formKey.currentState!.reset();
                      //                 setState(() {
                      //                   _name = "";
                      //                   _price = 0;
                      //                   _description = "";
                      //                   _thumbnail = "";
                      //                   _category = "Playmaker";
                      //                   _isFeatured = false;
                      //                   _stock = 0;
                      //                   _brand = "";
                      //                 });

                      //               },
                      //             ),
                      //           ],
                      //         );
                      //       },
                      //     );
                      //     // _formKey.currentState!.reset();
                      //   }
                      // },

                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {

                          // Kirim ke backend Django
                          final response = await request.postJson(
                            "https://muhammad-rafi42-egogear.pbp.cs.ui.ac.id/create-flutter/",
                            jsonEncode({
                              "name": _name,
                              "price": _price,
                              "description": _description,
                              "category": _category,
                              "thumbnail": _thumbnail,
                              "is_featured": _isFeatured,
                              "stock": _stock,
                              "brand": _brand,
                            }),
                          );

                          if (!context.mounted) return;

                          if (response['status'] == 'success') {
                            // Jika sukses
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Gear successfully saved!"))
                            );

                            // Reset form
                            _formKey.currentState!.reset();
                            setState(() {
                              _name = "";
                              _price = 0;
                              _description = "";
                              _thumbnail = "";
                              _category = "Playmaker";
                              _isFeatured = false;
                              _stock = 0;
                              _brand = "";
                            });

                            // Kembali ke menu
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => MyHomePage()),
                            );

                          } else {
                            // Jika gagal
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Something went wrong."))
                            );
                          }
                        }
                      },

                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

              ]
            )
          ),
        ),
      );
    }
}