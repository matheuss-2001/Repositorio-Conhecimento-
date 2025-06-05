import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/ui/home_movie/controller/home_movie_controller.dart';

class HomeMoviePage extends GetView<HomeMovieController> {
  const HomeMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar();
  }

  Container _buildBody() {
    return Container();
  }
}
