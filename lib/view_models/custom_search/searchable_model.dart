import 'dart:async';

import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_enums.dart';

abstract class SearchableModel<T> with ChangeNotifier {
  SearchScreenStates states = SearchScreenStates.EMPTY;
  List<T> searchList = [];
  Timer? _debounce;

  void search(String query) {
    if (query.isEmpty) return;
    states = SearchScreenStates.LOADING;
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      try {
        searchList.clear();
        var value = await searchApi(query);
        if (value.isEmpty) {
          states = SearchScreenStates.NOTHING;
        } else {
          value.forEach((element) {
            searchList.add(element);
          });
          states = SearchScreenStates.SUCCESS;
        }
      } catch (error) {
        states = SearchScreenStates.FAILED;
        print(error);
      }
      notifyListeners();
    });
    notifyListeners();
  }

  Future<List<T>> searchApi(String query);
}
