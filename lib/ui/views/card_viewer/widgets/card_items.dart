import 'package:digicard/app/extensions/custom_link_extension.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:digicard/ui/views/card_editor/widgets/icon_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/flutter_ez_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:url_launcher/url_launcher.dart';

class CardItems {
  final BuildContext context;
  final Color color;
  CardItems(this.context, {this.color = kcPrimaryColor});

  Widget headline(String value) {
    return value.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              value.sanitize().toTitleCase(),
              style: const TextStyle(),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget fullName(String value) {
    return value.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              value.sanitize().toTitleCase(),
              overflow: TextOverflow.visible,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget position(String value) {
    return value.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              value.sanitize().toTitleCase(),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget department(String value) {
    return value.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              value.sanitize().toTitleCase(),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget company(String value) {
    return value.isNotEmpty
        ? IconListItem(
            icon: Icons.domain,
            iconColor: getThemeManager(context).isDarkMode
                ? Colors.white
                : Colors.black,
            text: value.sanitize().toTitleCase(),
            textStyle: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: color),
          )
        : const SizedBox.shrink();
  }

  Widget dateCreated(DateTime? value) {
    return value != null
        ? IconListItem(
            iconColor: getThemeManager(context).isDarkMode
                ? Colors.white
                : Colors.black,
            backgroundColor: Colors.transparent,
            icon: FontAwesomeIcons.circleInfo,
            text: "Created ${DateFormat('MMM dd, yyyy').format(value)}"
                .sanitize(),
          )
        : const SizedBox.shrink();
  }

  Widget dateAdded(DateTime? value) {
    return value != null
        ? IconListItem(
            iconColor: getThemeManager(context).isDarkMode
                ? Colors.white
                : Colors.black,
            backgroundColor: Colors.transparent,
            icon: FontAwesomeIcons.handshake,
            text:
                "Added ${DateFormat('MMM dd, yyyy hh:mm a').format(DateTime.now())}"
                    .sanitize(),
          )
        : const SizedBox.shrink();
  }

  Widget customLinks(List<CustomLink> value) {
    return value.isNotEmpty
        ? Wrap(
            runSpacing: 5,
            spacing: 5,
            children: value.map((e) {
              return GestureDetector(
                  onTap: (e.extras().uri != null)
                      ? () async {
                          if (await launchUrl(e.extras().uri ?? Uri())) {
                            throw Exception(
                                'Could not launch ${e.extras().uri}');
                          }
                        }
                      : null,
                  child: IconListItem(
                    icon: e.extras().icon,
                    iconColor: Colors.white,
                    backgroundColor: color,
                    text: e.value.sanitize(),
                  ));
            }).toList(),
          )
        : const SizedBox.shrink();
  }
}
