import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:product_listing_grid/data/dummydata.dart';
import 'package:product_listing_grid/responsive.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class ListingView extends StatefulWidget {
  const ListingView({super.key});

  @override
  State<ListingView> createState() => _ListingViewState();
}

class _ListingViewState extends State<ListingView> {
  double rating = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hidden"),
        backgroundColor: Color(0xFF260C0C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(),
            Expanded(
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 5,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 10,
                    margin: const EdgeInsets.all(0),
                    child: Container(
                      height: (index + 1) % 2 == 0
                          ? getHeight(context) * 0.33
                          : getHeight(context) * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromARGB(255, 24, 24, 24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black,
                                image: DecorationImage(
                                  isAntiAlias: true,
                                  image: NetworkImage(
                                    imagesLinks[index % imagesLinks.length],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.all(3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    "HiddenSolves",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 0),
                                    child: Row(
                                      children: [
                                        SmoothStarRating(
                                          allowHalfRating: false,
                                          onRatingChanged: (v) {
                                            rating = v;
                                            setState(() {});
                                          },
                                          starCount: 5,
                                          rating: rating,
                                          size: 16.0,
                                          color: const Color.fromARGB(
                                              255, 214, 213, 213),
                                          borderColor: Colors.blueGrey,
                                          spacing: 0.0,
                                        ),
                                        Text(
                                          "$rating/5",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "Price: \$999",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 4),
                                        child: Card(
                                          child: Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: Icon(Icons
                                                .add_shopping_cart_rounded),
                                            // child: Text(
                                            //   "Add",
                                            //   style: TextStyle(
                                            //     fontWeight: FontWeight.bold,
                                            //     fontSize: 18,
                                            //   ),
                                            // ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
