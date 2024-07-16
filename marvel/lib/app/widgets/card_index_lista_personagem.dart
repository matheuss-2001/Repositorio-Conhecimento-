import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardIndexListaPersonagem extends StatelessWidget {
  final ValueKey<int> id;
  final String personagemName;
  final String personagemPhotoUrl;
  final Function()? onTapCard;

  const CardIndexListaPersonagem(
      {required this.id,
      required this.personagemName,
      required this.personagemPhotoUrl,
      required this.onTapCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0.0),
            blurRadius: 15.0,
            spreadRadius: 2.0,
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Dismissible(
          key: id,
          direction: DismissDirection.endToStart,
          background: Container(
            clipBehavior: Clip.antiAlias,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Spacer(),
                FaIcon(
                  FontAwesomeIcons.trashCan,
                  color: Colors.red.shade500,
                ),
              ],
            ),
          ),
          child: InkWell(
            onTap: onTapCard,
            child: IntrinsicHeight(
              child: Column(
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl: personagemPhotoUrl,
                    progressIndicatorBuilder: (context, url, progress) =>
                        Container(
                      height: 200,
                      color: Colors.grey,
                      child: const Center(
                          child: CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 250,
                      color: Colors.grey,
                      child: const Center(
                        child: Icon(
                          Icons.photo,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.red.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            personagemName,
                            maxLines: 5,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Colors.red.shade900),
                          ),
                          ElevatedButton(
                            onPressed: onTapCard,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Detalhes",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                  size: 18,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
