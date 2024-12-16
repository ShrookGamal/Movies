import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/utils/colors_manager.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static const String _baseUrl = 'api.themoviedb.org';
  static const String _apiKey = 'bbc87f41a4d25baf582e187287c3cb0c';
  static const String _searchEndPoint = '/3/search/movie';

  List<dynamic> _movies = [];
  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> getSearchMovie(String query) async {
    setState(() {
      _isLoading = true;
      _movies = [];
      _errorMessage = '';
    });

    try {
      Uri url = Uri.https(_baseUrl, _searchEndPoint, {
        'api_key': _apiKey,
        'query': query,
      });

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _movies = data['results'] ?? [];
        });
      } else {
        setState(() {
          _errorMessage = 'Failed to fetch movies.';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.scaffoldBg,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.grey,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15),
            ),
            onSubmitted: (query) {
              getSearchMovie(query); // Trigger the search
            },
          ),
        ),
      ),
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(color: Colors.grey),
      )
          : _errorMessage.isNotEmpty
          ? Center(
        child: Text(
          _errorMessage,
          style: const TextStyle(color: Colors.red, fontSize: 16),
        ),
      )
          : _movies.isEmpty
          ? const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.movie,
              size: 100,
              color: Colors.grey,
            ),
            SizedBox(height: 20), // Add spacing between the icon and the text
            Text(
              'Movie is not found',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      )
          : ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (context, index) {
          final movie = _movies[index];
          return ListTile(
            leading: movie['poster_path'] != null
                ? Image.network(
              'https://image.tmdb.org/t/p/w200${movie['poster_path']}',
              fit: BoxFit.cover,
            )
                : const Icon(Icons.movie, color: Colors.grey),
            title: Text(
              movie['title'] ?? 'No Title',
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              movie['release_date'] != null
                  ? movie['release_date'].toString()
                  : '',
              style: const TextStyle(color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}
