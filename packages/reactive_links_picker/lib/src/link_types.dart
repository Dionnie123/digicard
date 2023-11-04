import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'models/custom_link.dart';

final linkTypes = [
  CustomLink(
    label: "Website",
    value: "Website",
    icon: const Icon(FontAwesomeIcons.globe, color: Colors.white),
  ),
  CustomLink(
    label: "Email",
    value: " Email",
    icon: const Icon(FontAwesomeIcons.envelope, color: Colors.white),
  ),
  CustomLink(
    label: "LinkedIn",
    value: "LinkedIn",
    icon: const Icon(FontAwesomeIcons.linkedin, color: Colors.white),
  ),
  CustomLink(
    label: "Facebook",
    value: "Facebook",
    icon: const Icon(FontAwesomeIcons.facebook, color: Colors.white),
  ),
  CustomLink(
    label: "Twitter",
    value: "Twitter",
    icon: const Icon(FontAwesomeIcons.twitter, color: Colors.white),
  ),
  CustomLink(
    label: "Instagram",
    value: "Instagram",
    icon: const Icon(FontAwesomeIcons.instagram, color: Colors.white),
  ),
  CustomLink(
    label: "Paypal",
    value: "Paypal",
    icon: const Icon(FontAwesomeIcons.paypal, color: Colors.white),
  ),
  CustomLink(
    label: "Stripe",
    value: "Stripe",
    icon: const Icon(FontAwesomeIcons.stripe, color: Colors.white),
  ),
];
