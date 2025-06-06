import 'package:flutter/material.dart';

class StudioBanner extends StatelessWidget {
  final String studioDescription;
  final String studioBackgroundImage;

  const StudioBanner({super.key, required this.studioDescription, required this.studioBackgroundImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        border: Border.all(color: Colors.blue, width: 1.5),
        boxShadow: [
          BoxShadow(offset: const Offset(0, 4), blurRadius: 12, spreadRadius: 1, color: Colors.black.withOpacity(0.08)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              studioDescription,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(3, 3),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
              image:
                  studioBackgroundImage.isNotEmpty
                      ? DecorationImage(fit: BoxFit.contain, image: NetworkImage(studioBackgroundImage))
                      : null,
            ),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                if (studioBackgroundImage.isEmpty) ...[
                  Container(alignment: Alignment.center, color: Colors.grey),
                  Container(
                    decoration: const BoxDecoration(color: Colors.black38, shape: BoxShape.circle),
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.store, color: Colors.white70, size: 50),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
