import 'dart:async';

import 'package:flutter/material.dart';
import 'package:procal/services/api/clients/procal_service.dart';
import 'package:procal/services/api/models/food/food.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_search_controller.g.dart';

@riverpod
class FoodSearchController extends _$FoodSearchController {
  int _page = 0;
  String _searchQuery = '';
  List<Food> _foodList = <Food>[];
  Timer _timer = Timer(Duration.zero, () {});
  @override
  Future<List<Food>> build() async => _foodList;

  FutureOr<void> init(String query) async {
    _page = 0;
    _searchQuery = query;
    final procalService = ref.read(procalServiceProvider);
    final searchData = await procalService.searchFoodsByName(
      _searchQuery,
      _page,
    );
    _foodList = searchData.results.foods;
    state = AsyncData(_foodList);
  }

  Future<void> getNextPage() async {
    if (_timer.isActive && _foodList.isNotEmpty) {
      return;
    }
    _timer = Timer(const Duration(seconds: 1), () {});
    state = const AsyncLoading<List<Food>>().copyWithPrevious(state);
    _page++;
    debugPrint('Getting next page: $_page');
    var attempts = 3;
    while (attempts > 0) {
      try {
        final procalService = ref.read(procalServiceProvider);
        final foodSearch = await procalService.searchFoodsByName(
          _searchQuery,
          _page,
        );
        _foodList = [..._foodList, ...foodSearch.results.foods];
        state = AsyncData(_foodList);
        return;
      } on Exception catch (e) {
        attempts--;
        if (attempts == 0) {
          state = AsyncError(e, StackTrace.current);
          return;
        }
      }
    }
  }

  Future<void> refresh(String query) async {
    _page = 1;
    final procalService = ref.read(procalServiceProvider);
    final foodSearch = await procalService.searchFoodsByName(query, _page);
    _foodList = foodSearch.results.foods;
    state = AsyncData(_foodList);
  }
}
