import 'dart:async';

import 'package:relax/src/base/base_bloc.dart';
import 'package:relax/src/base/base_event.dart';
import 'package:relax/src/models/category.dart';
import 'package:relax/src/repositories/firestore_service.dart';

class CategoryBloc extends BaseBloc{
  StreamController<List<Category>> categoryStreamController = StreamController<List<Category>>.broadcast();

  Stream<List<Category>> get categoryStream => categoryStreamController.stream;

  void getCategoryData() async {
    List<Category> data = await FirestoreService.getAllCategory();

    categoryStreamController.sink.add(data);
  }

  @override
  void dispatchEvent(BaseEvent event){

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    categoryStreamController.close();
  }
}