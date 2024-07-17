import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardIndexListaPersonagem extends StatelessWidget {
  final ValueKey<int> id;
  final String personagemName;
  final String personagemPhotoUrl;
  final Function()? onTapCard;

  const CardIndexListaPersonagem({
    required this.id,
    required this.personagemName,
    required this.personagemPhotoUrl,
    required this.onTapCard,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4.0),
            blurRadius: 10.0,
            spreadRadius: 2.0,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Dismissible(
        key: id,
        direction: DismissDirection.endToStart,
        background: Container(
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
            child: Container(
              color: Colors.red,
              child: Column(
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: personagemPhotoUrl,
                    placeholder: (context, url) => Container(
                      height: 200,
                      color: Colors.grey.shade300,
                      child: const Center(
                        child: CircularProgressIndicator.adaptive(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 200,
                      color: Colors.grey.shade300,
                      child: const Center(
                        child: Icon(
                          Icons.photo,
                          color: Colors.red,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          personagemName,
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: onTapCard,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Detalhes",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.red,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
