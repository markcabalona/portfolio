// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


const socailLinks = [
  SocialLinkModel(
    name: 'Facebook',
    link: 'https://www.facebook.com/mark.cabalona.8',
    icon: FaIcon(
      FontAwesomeIcons.facebookSquare,
    ),
  ),
  SocialLinkModel(
    name: 'LinkedIn',
    link: 'https://ph.linkedin.com/in/markcabalona',
    icon: FaIcon(
      FontAwesomeIcons.linkedin,
    ),
  ),
  SocialLinkModel(
    name: 'Github',
    link: 'https://github.com/markcabalona',
    icon: FaIcon(
      FontAwesomeIcons.githubSquare,
    ),
  ),
];

class SocialLinkModel {
  final String name;
  final String link;
  final Widget icon;
  const SocialLinkModel({
    required this.name,
    required this.link,
    required this.icon,
  });
}
