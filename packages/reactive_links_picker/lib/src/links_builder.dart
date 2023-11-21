import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:reactive_links_picker/reactive_links_picker.dart';
import 'package:reactive_links_picker/src/helpers/custom_link_extension.dart';
import 'package:reactive_links_picker/src/link_types.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksBuilder extends StatelessWidget {
  final Color? color;
  final List<Map<String, dynamic>> links;
  const LinksBuilder({super.key, required this.links, this.color});

  @override
  Widget build(BuildContext context) {
    return links.isEmpty
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
                children: (links).mapIndexed((i, element) {
              final CustomLink customLink = linkTypes
                  .firstWhere(
                    (element) => element.label == links[i]['label'],
                    orElse: () => CustomLink(
                      label: "Link",
                      icon: const Icon(Icons.link_rounded),
                    ),
                  )
                  .copyWith(
                    custom: links[i]['custom'],
                    value: links[i]['value'],
                  );
              return InkWell(
                onTap: () async {
                  if (await canLaunchUrl(Uri.parse(customLink.link()))) {
                    await launchUrl(Uri.parse(customLink.link()));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 15,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: color ?? Theme.of(context).primaryColor,
                        ),
                        child: const Icon(
                          Icons.email_rounded,
                          size: 25,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              customLink.custom == null ||
                                      customLink.custom
                                          .toString()
                                          .trim()
                                          .isEmpty
                                  ? "${customLink.label}"
                                  : "${customLink.custom}",
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              "${customLink.value}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList()),
          );

////////////
  }
}
