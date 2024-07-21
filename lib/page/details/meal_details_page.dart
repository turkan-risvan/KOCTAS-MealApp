import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:recipes_app/page/details/meal_details_viewmodel.dart';

class MealDetailsPage extends StatefulWidget {
  final String mealId;

  MealDetailsPage({required this.mealId});

  @override
  _MealDetailsPageState createState() => _MealDetailsPageState();
}

class _MealDetailsPageState extends State<MealDetailsPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<MealDetailsViewModel>(context, listen: false);
    viewModel.fetchMealDetails(widget.mealId);
    viewModel.isFavorite(widget.mealId).then((value) {
      setState(() {
        isFavorite = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MealDetailsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            return Center(
              child: Text(
                viewModel.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (viewModel.mealDetails == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final meal = viewModel.mealDetails!.meals!.first;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (meal.strMealThumb != null)
                  Image.network(
                    meal.strMealThumb!,
                    fit: BoxFit.contain,
                  ),
                
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Text(
                          meal.strMeal ?? '',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                     
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  iconSize: 25,
                                  icon: const Icon(Icons.video_collection_outlined, color: Color(0xfff07e33)),
                                  onPressed: () async {
                                    final url = meal.strYoutube;
                                    if (url != null && url.isNotEmpty) {
                                      await _launchUrl(url);
                                    }
                                  },
                                ),
                                const Text("Cook", style: TextStyle(color: Colors.black, fontSize: 11)),
                              ],
                            ),
                            const SizedBox(width: 40),
                            Column(
                              children: [
                                IconButton(
                                  iconSize: 25,
                                  icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: const Color(0xfff07e33)),
                                  color: isFavorite ? Colors.red : null,
                                  onPressed: () {
                                    setState(() {
                                      isFavorite = !isFavorite;
                                    });
                                    viewModel.toggleFavorite(widget.mealId);
                                  },
                                ),
                                const Text("Favorite", style: TextStyle(color: Colors.black, fontSize: 11)),
                              ],
                            ),
                            const SizedBox(width: 40),
                            Column(
                              children: [
                                IconButton(
                                  iconSize: 25,
                                  icon: const Icon(Icons.edit_document, color: Color(0xfff07e33)),
                                  onPressed: () {
                                    setState(() {});
                                  },
                                ),
                                const Text("Calories", style: TextStyle(color: Colors.black, fontSize: 11)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xfffdf5ef),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Yapılış Talimatları",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 3),
                                ExpandableText(
                                  text: meal.strInstructions ?? '',
                                  maxLines: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildIngredientsTable(meal),
                        const SizedBox(height: 16),
                        _buildDetailsTable(meal),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildIngredientsTable(dynamic meal) {
    List<TableRow> rows = [];
    for (int i = 1; i <= 20; i++) {
      String ingredient = meal.toJson()['strIngredient$i'] ?? '';
      String measure = meal.toJson()['strMeasure$i'] ?? '';
      if (ingredient.isNotEmpty && measure.isNotEmpty) {
        rows.add(TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(ingredient),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(measure),
            ),
          ],
        ));
      }
    }

    return Table(
      border: TableBorder.all(color: const Color.fromARGB(255, 196, 196, 196)),
      children: [
        const TableRow(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Ingredient',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Measure',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        ...rows,
      ],
    );
  }

  Widget _buildDetailsTable(dynamic meal) {
    return Table(
      border: TableBorder.all(color: const Color.fromARGB(255, 248, 204, 147)),
      children: [
        TableRow(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Category',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(meal.strCategory ?? ''),
            ),
          ],
        ),
        TableRow(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Area',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(meal.strArea ?? ''),
            ),
          ],
        ),
        TableRow(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Tags',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(meal.strTags ?? ''),
            ),
          ],
        ),
        // TableRow(
        //   children: [
        //     const Padding(
        //       padding: EdgeInsets.all(8.0),
        //       child: Text(
        //         'Source',
        //         style: TextStyle(fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text(meal.strSource ?? ''),
        //     ),
        //   ],
        // ),
        // TableRow(
        //   children: [
        //     const Padding(
        //       padding: EdgeInsets.all(8.0),
        //       child: Text(
        //         'Youtube',
        //         style: TextStyle(fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: TextButton(
        //         onPressed: () async {
        //           final url = meal.strYoutube;
        //           if (url != null && url.isNotEmpty) {
        //             await _launchUrl(url);
        //           }
        //         },
        //         child: Text(meal.strYoutube ?? ''),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;

  const ExpandableText({
    Key? key,
    required this.text,
    this.maxLines = 4,
  }) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          style: const TextStyle(fontSize: 12),
          widget.text,
          maxLines: expanded ? null : widget.maxLines,
          overflow: expanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
        const SizedBox(height: 5),
        InkWell(
          onTap: () {
            setState(() {
              expanded = !expanded;
            });
          },
          child: Text(
            expanded ? 'Daha az göster' : 'Daha fazla göster',
            style: const TextStyle(color: Color(0xfff07e33), fontSize: 12),
          ),
        ),
      ],
    );
  }
}
