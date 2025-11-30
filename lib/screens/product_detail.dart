import 'package:flutter/material.dart';
import 'package:ego_gear/models/product_entry.dart';
import 'package:http/http.dart' as http;


class ProductDetailPage extends StatefulWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  String _formatDate(DateTime date) {
    // Simple date formatter without intl package
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${date.day} ${months[date.month - 1]} ${date.year}, ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  // @override
  // void initState() {
  //   super.initState();
  //   _increaseHype();
  // }

  // Future<void> _increaseHype() async {
  //   final url = Uri.parse(
  //     'https://muhammad-rafi42-egogear.pbp.cs.ui.ac.id/products/${widget.product.id}/increase_hype/'
  //   );

  //   await http.post(url);

  //   setState(() {
  //     widget.product.hype += 1;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail image
            if (product.thumbnail != null && product.thumbnail!.isNotEmpty)
              Image.network(
                'https://muhammad-rafi42-egogear.pbp.cs.ui.ac.id/proxy-image/?url=${Uri.encodeComponent(product.thumbnail!)}',

                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 50),
                  ),
                ),
              ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Featured badge
                  if (product.isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 6.0),
                      margin: const EdgeInsets.only(bottom: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Text(
                        'Featured',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),

                  // Title
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Category and Date
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade100,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          product.category.toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo.shade700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        widget._formatDate(product.createdAt),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Views count
                  Row(
                    children: [
                      Icon(Icons.visibility, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        '${product.hype} views',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  
                  // const Divider(height: 32),

                  // // Full content
                  // Text(
                  //   product.description ?? "",
                  //   style: const TextStyle(
                  //     fontSize: 16.0,
                  //     height: 1.6,
                  //   ),
                  //   textAlign: TextAlign.justify,
                  // ),
                  // const SizedBox(height: 24),

                  // const Divider(height: 32),

                  // Price
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 8),
                      Text(
                        'Price: Rp ${product.price}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Stock
                  Row(
                    children: [
                      const Icon(Icons.inventory),
                      const SizedBox(width: 8),
                      Text(
                        'Stock: ${product.stock}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Brand
                  Row(
                    children: [
                      const Icon(Icons.local_offer),
                      const SizedBox(width: 8),
                      Text(
                        'Brand: ${product.brand}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Created by (User ID)
                  if (product.userId != null)
                    Row(
                      children: [
                        const Icon(Icons.person),
                        const SizedBox(width: 8),
                        Text(
                          'Author ID: ${product.userId}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  const SizedBox(height: 12),

                  const Divider(height: 32),

                  // Full content
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 16.0,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 24),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}