import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../server/serverInfo.dart';
import 'dart:convert';

class BooksAppBar extends StatefulWidget {
  final Function(String) fetchData;
  const BooksAppBar({required this.fetchData, super.key});

  @override
  State<BooksAppBar> createState() => _BooksAppBarState();
}

class _BooksAppBarState extends State<BooksAppBar> {
  List categories = [];

  void fetchCategories() async {
    Uri url = Uri.parse("$SERVER_LINK/api/categories");

    var res = await http.get(url);

    setState(() {
      categories = jsonDecode(res.body);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    void changeCategory(String link) {
      // print(link);
      widget.fetchData(link);
    }

    Widget buildCategoriesButtons() {
      List<Widget> c = categories
          .map((e) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                child: ElevatedButton(
                    onPressed: () => {
                          changeCategory(
                              "$SERVER_LINK/api/categories/${e['id']}")
                        },
                    style: const ButtonStyle(),
                    child: Text(e['name'])),
              ))
          .toList();

      c.insert(
          0,
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            child: ElevatedButton(
                onPressed: () => {changeCategory("$SERVER_LINK/api/books")},
                style: const ButtonStyle(),
                child: const Text('All')),
          ));

      return Row(children: c);
    }
// Theme.of(context).colorScheme.primary.withOpacity(0.5)

    return SliverAppBar(
      title: const Text("Home"),
      floating: true,
      // backgroundColor: Colors.red,
      // bottom: MenuBar(children: )),
      // excludeHeaderSemantics: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: buildCategoriesButtons(),
          ),
        ),
        //  buildCategoriesButtons(),
      ),

      // actions: [ElevatedButton(onPressed: null, child: Text('all'))],
      snap: true,
    );
  }
}
