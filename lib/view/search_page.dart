import 'dart:convert';

import 'package:cabto_app/view/book_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cabto_app/.env';

import '../services/utils/cosnt/cosnts.dart';

import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  
  // Focus Node to put focus when user come to the page 
  FocusNode _focusNode = FocusNode();
  TextEditingController _searchController = TextEditingController();
  List<Prediction> _suggestions = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
    FocusScope.of(context).requestFocus(_focusNode);
  });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusNode.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Enter Destination'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                focusNode: _focusNode,
                controller: _searchController,
                onChanged: _onSearchTextChanged,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: black),
                    label: Text('Destination'),
                    prefixIcon: Icon(CupertinoIcons.search),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: grey.withOpacity(0.1)),
              ),
            ),

            Expanded(child: ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BookPage(destination: _suggestions[index].description),));
                },
                title: Text(_suggestions[index].description),
              );
            },
            itemCount: _suggestions.length,))
          ],
        ));
  }

void _onSearchTextChanged(String query) async {
    if (query.isEmpty) {
      setState(() {
        _suggestions.clear();
      });
      return;
    }

    final predictions = await _fetchAutocompleteResults(query);

    print(predictions);

    setState(() {
      _suggestions = predictions;
    });
  }

  Future<List<Prediction>> _fetchAutocompleteResults(String input) async {
    final response = await http.get(
      Uri.parse('https://maps.googleapis.com/maps/api/place/autocomplete/json'
          '?input=${Uri.encodeQueryComponent(input)}'
          '&key=$SEARCH_PLACE_API'),
    );

    if (response.statusCode == 200) {
      final predictions = jsonDecode(response.body)['predictions'] as List;
      return predictions.map((json) => Prediction.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch autocomplete suggestions');
    }
  }
}

class Prediction {
  final String description;
  final String placeId;

  Prediction({required this.description, required this.placeId});

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      description: json['description'],
      placeId: json['place_id'],
    );
  }
}