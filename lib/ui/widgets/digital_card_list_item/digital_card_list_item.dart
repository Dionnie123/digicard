import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:flutter/material.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:flutter_ez_core/extensions/color_extension.dart';

class DigitalCardListItem extends StatelessWidget {
  final DigitalCardDTO card;

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
            child: CachedNetworkImage(
          imageUrl: card.avatarHttpUrl,
          width: double.infinity,
          height: imageSize,
          fit: BoxFit.cover,
          imageBuilder: (context, imageProvider) {
            return Container(
                decoration: BoxDecoration(
                    color: card.color?.darken(),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: imageProvider)));
          },
          placeholder: (context, url) {
            return Container(color: card.color?.darken());
          },
          errorWidget: (context, url, error) {
            return Container(
              width: double.infinity,
              height: imageSize,
              color: card.color?.darken(),
            );
          },
        )),
      );
    }

    Widget title() {
      return Text(
        card.title.toString(),
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
          clipBehavior: Clip.antiAliasWithSaveLayer,
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
