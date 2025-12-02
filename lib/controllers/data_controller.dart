import 'dart:convert';
import 'dart:core';

import 'package:flutter/services.dart';
import 'package:flutter_getx/models/detail_data_model.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  final RxList<DetailDataModel> _dataList = <DetailDataModel>[].obs;
  List<DetailDataModel> get dataList => _dataList.value;

  final Rx<DetailDataModel> _data =
      DetailDataModel(name: '', title: '', text: '', img: '', time: '', prize: '').obs;
  DetailDataModel get data => _data.value;

  final RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool val) => _isLoading.value = val;

  @override
  void onInit() {
    super.onInit();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String jsonString = await rootBundle.loadString('json/detail.json');

    final jsonData = jsonDecode(jsonString) as List<dynamic>;
    // final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
    // final jsonData = jsonDecode(jsonString) as List<dynamic>;
    // data = DetailDataModel.fromJson(jsonData);
    // _data.value = DetailDataModel.fromJson(jsonData);
    _dataList.value =
        jsonData.map((item) => DetailDataModel.fromJson(item as Map<String, dynamic>)).toList();
    // isLoading = false;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
