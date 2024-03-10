import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:news_app/HomeScreen/article_view.dart';
import 'package:news_app/HomeScreen/landingPage.dart';
import 'package:news_app/dynamic/data.dart';
import 'package:news_app/dynamic/news.dart';
import 'package:news_app/dynamic/slider.dart';
import 'package:news_app/favourites/favouritePage.dart';
import 'package:news_app/models/articleModel.dart';
import 'package:news_app/models/categoryModel.dart';
import 'package:news_app/models/slider_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List<CategoryModel> categories = [];
  List<sliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _loading = true;
  int activeIndex = 0;

  @override
  void initState() {
    categories = getCategories();
    getSlider();
    getNews();
    super.initState();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {
      _loading = false;
    });
  }

  getSlider() async {
    Sliders slider = Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(246, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 254, 238, 238),
        title: const Center(
            child: Text(
          "News",
          style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins SemiBold',
              fontSize: 30),
        )),
        actions: [
          PopupMenuButton<int>(
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ), // Add an icon for the button
            offset: Offset(0, 50),
            itemBuilder: (context) => [
              // popupmenu item 1
              PopupMenuItem(
                value: 1,
                // row has two child icon and text.
                child: Row(
                  children: [
                    Text(
                      "Logout",
                      style: TextStyle(
                        color: Color(0xff1D1617),
                        fontSize: 15,
                        fontFamily: 'Poppins Regular',
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.login_outlined,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LandingPage()),
                );
              }
            },
          ),
        ],
        elevation: 1.0,
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    // Container(
                    //   margin: const EdgeInsets.only(left: 10.0),
                    //   height: 70,
                    //   child: ListView.builder(
                    //       shrinkWrap: true,
                    //       scrollDirection: Axis.horizontal,
                    //       itemCount: categories.length,
                    //       itemBuilder: (context, index) {
                    //         return CategoryTile(
                    //           image: categories[index].image,
                    //           categoryName: categories[index].categoryName,
                    //         );
                    //       }),
                    // ),
                    //const SizedBox(height: 30.0),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trending News",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                                fontFamily: 'Poppins SemiBold'),
                          ),
                          // Text(
                          //   "View All",
                          //   style: TextStyle(
                          //       color: Colors.blue,
                          //       fontWeight: FontWeight.w500,
                          //       fontSize: 16.0,
                          //       fontFamily: 'Poppins Regular'),
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    CarouselSlider.builder(
                      itemBuilder: (context, index, realIndex) {
                        String? res = sliders[index].urlToImage;
                        String? res1 = sliders[index].title;
                        return buildImage(res!, index, res1!);
                      },
                      itemCount: sliders.length,
                      options: CarouselOptions(
                          height: 250,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              activeIndex = index;
                            });
                          }),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(child: buildIndicator()),
                    const SizedBox(height: 30.0),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Live News",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                fontFamily: 'Poppins SemiBold'),
                          ),
                          // Text(
                          //   "View All",
                          //   style: TextStyle(
                          //       color: Colors.blue,
                          //       fontWeight: FontWeight.w500,
                          //       fontSize: 16.0,
                          //       fontFamily: 'Poppins Regular'),
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return BlogTile(
                              url: articles[index].url!,
                              imageUrl: articles[index].urlToImage!,
                              title: articles[index].title!,
                              desc: articles[index].description!,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Widget buildImage(String image, int index, String name) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: image,
                height: 250,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              height: 250,
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: 170.0),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(20)),
              ),
              child: Text(
                name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: sliders.length,
        effect: const SlideEffect(
            dotWidth: 10, dotHeight: 10, activeDotColor: Colors.blue),
      );
}

// class CategoryTile extends StatelessWidget {
//   final image, categoryName;
//   const CategoryTile({this.image, this.categoryName});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: 16),
//       child: Stack(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(6),
//             child: Image.asset(
//               image,
//               width: 120,
//               height: 80,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class BlogTile extends StatefulWidget {
  final String imageUrl, title, desc, url;
  BlogTile({
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.url,
  });

  @override
  _BlogTileState createState() => _BlogTileState();
}

class _BlogTileState extends State<BlogTile> {
  bool isFavorited = false;

  // Function to handle the button press event
  void _toggleFavorite(BuildContext context) {
    setState(() {
      isFavorited = !isFavorited;
    });

    // Access Firebase Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    if (isFavorited) {
      // Add the article details to Firestore
      firestore.collection('favorites').add({
        'imageUrl': widget.imageUrl,
        'title': widget.title,
        'desc': widget.desc,
        'url': widget.url,
        // You can add more fields as needed
      }).then((value) {
        // Show a snackbar indicating successful addition
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Article added to favorites')),
        );
      }).catchError((error) {
        // Handle errors, if any
        print('Error adding article to favorites: $error');
      });
    } else {
      // Remove the article from Firestore
      // You need to implement the logic for removing the article from Firestore
      // This will depend on how you are storing and querying the articles
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to article view
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(blogUrl: widget.url),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.imageUrl,
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          widget.title,
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          widget.desc,
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isFavorited ? Icons.favorite : Icons.favorite_border,
                          color: isFavorited ? Colors.red : null,
                        ),
                        onPressed: () {
                          // Call function to toggle favorite status
                          _toggleFavorite(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
