import 'package:engaged/search/searchlogic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class NewSearch extends StatefulWidget {
  NewSearch({super.key});

  @override
  State<NewSearch> createState() => _NewSearchState();
}

class _NewSearchState extends State<NewSearch> {
  final text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (value) {
                
                getSearchData(value);
                setState(() {});
              },
              controller: text,
              decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.search),
                  ),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60))),
            ),
          ),
          Expanded(
              child: searchResult.isEmpty
                  ? const Text("Enter search query")
                  : GridView.builder(
                      itemCount: searchResult.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        final sortdata = searchResult[index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.pink.shade50,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  sortdata.images![0],
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(sortdata.title!,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                    )),
                              )
                            ],
                          ),
                        );

                        //Text(sortdata.title!);
                      },
                    )),
        ],
      ),
    );
  }
}
