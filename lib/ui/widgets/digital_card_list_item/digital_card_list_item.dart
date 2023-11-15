import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:flutter_ez_core/extensions/color_extension.dart';

class DigitalCardListItem extends StatelessWidget {
  final DigitalCard card;

  final Function onTap;
  const DigitalCardListItem({
    Key? key,
    required this.card,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget image() {
      const imageSize = 140.0;
      return Container(
        color: card.color,
        child: Material(
          child: (card.avatarUrl.isNotEmpty)
              ? CachedNetworkImage(
                  imageUrl:
                      "https://kbetklswsjdfouluglbr.supabase.co/storage/v1/object/public/images/avatars/${card.avatarUrl}",
                  width: double.infinity,
                  height: imageSize,
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return Container(color: card.color.darken(0.2));
                  },
                  errorWidget: (context, url, error) {
                    return Container(
                      width: double.infinity,
                      height: imageSize,
                      color: card.color.darken(0.2),
                    );
                  },
                )
              : Container(
                  width: double.infinity,
                  height: imageSize,
                  color: card.color.darken(0.2),
                ),
        ),
      );
    }

    Widget title() {
      return Text(
        card.title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );
    }

    return SizedBox(
      width: 256,
      height: 233,
      child: IntrinsicHeight(
        child: Card(
          elevation: 1,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => onTap(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                image(),
                Container(
                  color: card.color,
                  height: 5,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        title(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
