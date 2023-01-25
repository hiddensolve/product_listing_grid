import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
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
      drawer: Drawer(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Icon(Icons.arrow_circle_right_rounded),
        title: Text(
          "Riders Club",
          style: GoogleFonts.acme(textStyle: const TextStyle(fontSize: 25)),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Icon(Icons.sports_score_outlined),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.bike_scooter),
          ),
        ],
        elevation: 5,
        shadowColor: const Color.fromARGB(181, 141, 141, 141),
        backgroundColor: const Color.fromARGB(255, 1, 1, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(),
            Expanded(
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 8,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    shadowColor: const Color.fromARGB(255, 53, 53, 53),
                    elevation: 10,
                    margin: const EdgeInsets.all(0),
                    child: Container(
                      height: (index + 1) % 2 == 0
                          ? getHeight(context) * 0.33
                          : getHeight(context) * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 24, 24, 24),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                  color: const Color.fromARGB(255, 24, 24, 24),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "HiddenSolves",
                                        style: GoogleFonts.aBeeZee(
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
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
                                              size: 14.0,
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
                                        children: [
                                          Text(
                                            "Price: \$999",
                                            style: GoogleFonts.lato(
                                              textStyle: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                                fontSize: 15,
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
                          const Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(Icons.add_shopping_cart_rounded),
                                ),
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
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.black,
        items: const [
          TabItem(icon: Icons.store_mall_directory_outlined, title: 'Store'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.bike_scooter, title: 'Cart'),
          TabItem(icon: Icons.sports_score_outlined, title: 'Sports'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        onTap: (int i) => print('click index=$i'),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
    );
  }
}
