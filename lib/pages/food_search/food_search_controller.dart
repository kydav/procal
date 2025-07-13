import 'dart:async';

import 'package:flutter/material.dart';
import 'package:procal/services/api/clients/procal_service.dart';
import 'package:procal/services/api/models/food/food.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_search_controller.g.dart';

@riverpod
class FoodSearchController extends _$FoodSearchController {
  int _page = 1;
  String _searchQuery = '';
  List<Food> _foodList = <Food>[];
  Timer _timer = Timer(Duration.zero, () {});
  @override
  FutureOr<List<Food>> build() async => _foodList;

  Future<void> init(String query) async {
    _page = 1;
    _searchQuery = query;
    final procalService = ref.read(procalServiceProvider.notifier);
    final list = await procalService.searchFoodsByName(_searchQuery, _page);
    _foodList = list;
    state = AsyncData(_foodList);
  }

  // @override
  // void dispose() {
  //   _timer.cancel();
  //   _foodList.clear();
  //   _page = 1;
  //   _searchQuery = '';
  // }

  Future<void> getNextPage() async {
    if (_timer.isActive && _foodList.isNotEmpty) {
      return;
    }
    _timer = Timer(const Duration(seconds: 1), () {});
    state = const AsyncLoading();
    _page++;
    debugPrint('Getting next page: $_page');
    final procalService = ref.read(procalServiceProvider.notifier);
    final list = await procalService.searchFoodsByName(_searchQuery, _page);
    _foodList = [..._foodList, ...list];
    state = AsyncData(_foodList);
  }

  Future<void> refresh(String query) async {
    _page = 1;
    final procalService = ref.read(procalServiceProvider.notifier);
    final list = await procalService.searchFoodsByName(query, _page);
    _foodList = list;
    state = AsyncData(_foodList);
  }
}
