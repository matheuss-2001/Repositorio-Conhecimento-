import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardIndexListaPersonagem extends StatelessWidget {
  final String id;
  final String personagemName;
  final String personagemUrl;
  final Function()? onDelete;

  const CardIndexListaPersonagem({
    required this.id,
    required this.personagemName,
    required this.personagemUrl,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
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
        child: ListTile(
          isThreeLine: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          title: CachedNetworkImage(
            imageUrl:personagemUrl,
            progressIndicatorBuilder: (context, url, prog) =>
            const Center(child: CircularProgressIndicator.adaptive()),
            errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.photo)),
          ),
              /*
              InkWell(
                splashColor: Colors.white.withOpacity(0.5),
                onTap: onDelete,
                child: const Icon(
                  Icons.delete,
                  size: 18,
                ),
              ),

               */

          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                personagemName,
                style: const TextStyle(fontSize: 13),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
