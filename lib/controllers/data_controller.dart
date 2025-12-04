import 'dart:convert';
import 'dart:core';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/detail_data_model.dart';

class DataController extends GetxController {
  final RxList<DetailDataModel> _dataList = <DetailDataModel>[].obs;
  List<DetailDataModel> get dataList => _dataList.value;

  final RxList<DetailDataModel> _dataTempList = <DetailDataModel>[].obs;
  List<DetailDataModel> get dataTempList => _dataTempList.value;

  final Rx<DetailDataModel> _data =
      const DetailDataModel(name: '', title: '', text: '', img: '', time: '', prize: '').obs;
  DetailDataModel get data => _data.value;

  final RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;

  // get dataTempList => null;
  set isLoading(bool val) => _isLoading.value = val;

  @override
  void onInit() {
    super.onInit();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String jsonString = await rootBundle.loadString('json/detail.json');

    final jsonData = jsonDecode(jsonString) as List<dynamic>;
    _dataList.value =
        jsonData.map((item) => DetailDataModel.fromJson(item as Map<String, dynamic>)).toList();
  }

  void updateTempList(int index) {
    final sortedList = List<DetailDataModel>.from(_dataList);
    final DetailDataModel targetItem = sortedList[index];

    sortedList.removeAt(index);
    sortedList.insert(0, targetItem);
    _dataTempList.assignAll(sortedList);
  }

  @override
  void onClose() {
    // TODO(quandv): aaaaa.
    super.onClose();
  }
}
