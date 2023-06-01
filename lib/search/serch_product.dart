import 'package:engaged/search/new_search.dart';
import 'package:engaged/search/product_detail.dart';
import 'package:engaged/search/searchlogic.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Products",
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewSearch()));
                },
                icon: Icon(Icons.search)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        final output = snapshot.data![index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetail(
                                            description: output.description!,
                                            images: output.images!,
                                            title: output.title!,
                                            stock: output.stock!,
                                            price: output.price!,
                                            brand: output.brand!,
                                            discountPercentage:
                                                output.discountPercentage!,
                                            rating: output.rating!,
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.pink.shade50,
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      output.images![0],
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(output.title!,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 15,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
