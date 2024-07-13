import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardIndexListaPersonagem extends StatelessWidget {
  final String id;
  final String personagemName;
  final String personagemUrl;
  final Function()? onDelete;
  final Function()? onTapCard;

  const CardIndexListaPersonagem(
      {required this.id,
      required this.personagemName,
      required this.personagemUrl,
      required this.onDelete,
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
          key: ValueKey<String>(id),
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
          //confirmDismiss: onDelete,
          child: Container(
            color: Colors.purple,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  constraints:
                      const BoxConstraints(maxWidth: 200, maxHeight: 180),
                  child: CachedNetworkImage(
                      fit: BoxFit.contain,
                      imageUrl: personagemUrl,
                      progressIndicatorBuilder: (context, url, progress) =>
                          Container(
                            color: Colors.grey,
                            child: const Center(
                                child: CircularProgressIndicator.adaptive(
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.white),
                            )),
                          ),
                      errorWidget: (context, url, error) => Container(
                            // constraints: const BoxConstraints(maxWidth: 200),
                            color: Colors.grey,
                            child: const Center(
                              child: Icon(
                                Icons.photo,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          )),
                ),
                Container(
                  height: 150,
                  color: Colors.pink,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(personagemName),
                      ElevatedButton(
                          iconAlignment: IconAlignment.end,
                          onPressed: onTapCard,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade600,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14)),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  "Detalhes"),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 16,
                              )
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
