import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:marvel/app/helpers/global_variables.dart';
import 'package:marvel/app/widgets/movie_widget/studio_banner.dart';
import 'package:marvel/ui/detail_movie/controller/detail_movie_controller.dart';
import 'package:marvel/ui/detail_movie/data/model/movie_studio_viewmodel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildImageCarousel(), _buildMovieDescription(), _buildTabs(), _buildTabViews()],
          ),
        );
      },
    );
  }

  Widget _buildImageCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 400,
          child: PageView.builder(
            controller: controller.pageController,
            itemCount: controller.listBackgroundImage.isNotEmpty ? controller.listBackgroundImage.length : 1,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: controller.listBackgroundImage.isNotEmpty ? controller.listBackgroundImage[index] : '',
                fit: BoxFit.fill,
                width: double.infinity,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: Colors.blue)),
                errorWidget:
                    (context, url, error) =>
                        Container(color: Colors.blue, child: const Icon(Icons.image, color: Colors.white, size: 100)),
              );
            },
          ),
        ),
        if (controller.listBackgroundImage.length > 1)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: SmoothPageIndicator(
              controller: controller.pageController,
              count: controller.listBackgroundImage.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.blue,
                dotColor: Colors.grey.shade400,
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 3,
              ),
            ),
          ),
      ],
    );
  }

  Padding _buildMovieDescription() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                controller.detailMovieViewModel.movieTitle,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  controller.onTapLikeMovie();
                },
                icon: Icon(controller.likedMovie ? Icons.star : Icons.star_border, color: Colors.blue, size: 22),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            controller.detailMovieViewModel.movieDescription,
            style: const TextStyle(fontSize: 12),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Container _buildTabs() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.blue.withOpacity(0.3), width: 1.2),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: TabBar(
        controller: controller.tabController,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.blue,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8)),
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontSize: 13),
        tabs: const [Tab(text: "Informações"), Tab(text: "Studios")],
      ),
    );
  }

  SizedBox _buildTabViews() {
    return SizedBox(
      height: 400,
      child: TabBarView(controller: controller.tabController, children: [_buildMovieInformation(), _buildStudioList()]),
    );
  }

  Widget _buildMovieInformation() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        shadowColor: Colors.black26,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            RatingBar.builder(
              ignoreGestures: true,
              itemSize: 20,
              initialRating: controller.detailMovieViewModel.movieRate,
              minRating: 1,
              allowHalfRating: true,
              direction: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) {},
            ),
            const SizedBox(height: 8),
            _buildInfoRow(Icons.calendar_today, "Lançamento", controller.detailMovieViewModel.getReleaseDateFormated()),
            const SizedBox(height: 8),
            _buildInfoRow(Icons.attach_money, "Orçamento", controller.detailMovieViewModel.getBudgetFormated()),
            const SizedBox(height: 8),
            _buildInfoRow(Icons.category, "Gênero", controller.detailMovieViewModel.getGenreString()),
          ],
        ),
      ),
    );
  }

  Widget _buildStudioList() {
    if (controller.detailMovieViewModel.listStudioViewmodel.isNotEmpty) {
      return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 16),
        itemCount: controller.detailMovieViewModel.listStudioViewmodel.length,
        itemBuilder: (context, index) {
          MovieStudioViewmodel studioViewmodel = controller.detailMovieViewModel.listStudioViewmodel[index];
          return StudioBanner(
            studioDescription: "${studioViewmodel.studioNme} - ${studioViewmodel.studioCountry}",
            studioBackgroundImage: studioViewmodel.studioBackgroundImage,
          );
        },
      );
    }
    return const Center(child: Text('Não há studio disponível'));
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: Colors.blueAccent),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: "$title: ",
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 14),
              children: [TextSpan(text: value, style: const TextStyle(fontWeight: FontWeight.normal))],
            ),
          ),
        ),
      ],
    );
  }
}
