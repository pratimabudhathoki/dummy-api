import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'serch_product.dart';
import 'package:engaged/search/searchlogic.dart';
import 'package:engaged/models.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail(
      {super.key,
      required this.images,
      required this.description,
      required this.brand,
      required this.discountPercentage,
      required this.price,
      required this.stock,
      required this.title,
      required this.rating});

  final List<String> images;
  final String description;
  final String title;
  final String brand;
  final double discountPercentage;
  final int price;
  final int stock;
  var rating;
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width / 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Expanded(child: Image.network(widget.images![0])),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.brand,
              style: GoogleFonts.montserrat(
                fontSize: 17,
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(widget.title),
                Spacer(),
                Text(
                  'Rs:  ' + widget.price.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Discount"),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.discountPercentage.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Stock"),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.stock.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Rating"),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.rating.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
                child: Center(
              child: Text(
                widget.description,
                style: GoogleFonts.sourceSerifPro(
                    fontSize: 17, color: Colors.black45),
              ),
            )),
          )
        ],
      ),
    );
  }
}
