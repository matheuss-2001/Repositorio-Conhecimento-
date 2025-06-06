import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/app/helpers/global_variables.dart';
import 'package:marvel/ui/detail_movie/controller/detail_movie_controller.dart';

class DetailMoviePage extends GetView<DetailMovieController> {
  const DetailMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(toolbarHeight: 70, title: Image.asset(GlobalVariableAssets.logoMovie, height: 32), centerTitle: true);
  }

  GetBuilder _buildBody() {
    return GetBuilder<DetailMovieController>(
      builder: (controller) {
        if (controller.loadingDetailMovie) {
          return const Center(child: CircularProgressIndicator(color: Colors.blue));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
