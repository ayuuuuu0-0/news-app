import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteArticle {
  String title;
  String imageUrl;
  String description;
  String url;

  FavoriteArticle({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.url,
  });
}

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late List<FavoriteArticle> favorites;

  @override
  void initState() {
    super.initState();
    fetchFavorites();
  }

  void fetchFavorites() async {
    // Fetch favorites from Firestore
    final snapshot =
        await FirebaseFirestore.instance.collection('favorites').get();

    // Parse retrieved data into FavoriteArticle objects
    final List<FavoriteArticle> tempFavorites = [];
    snapshot.docs.forEach((doc) {
      final data = doc.data() as Map<String, dynamic>;
      tempFavorites.add(FavoriteArticle(
        title: data['title'],
        imageUrl: data['imageUrl'],
        description: data['description'],
        url: data['url'],
      ));
    });

    // Update state with fetched favorites
    setState(() {
      favorites = tempFavorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: favorites != null
          ? ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final favorite = favorites[index];
                return ListTile(
                  title: Text(favorite.title),
                  subtitle: Text(favorite.description),
                  onTap: () {
                    // Implement navigation to view favorite article
                  },
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
