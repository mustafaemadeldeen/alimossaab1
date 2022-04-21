import 'package:flutter/material.dart';


class Slide {
  final String images;
  final String title;
  final String description;
  Slide({
    required this.images,
    required this.title,
    required this.description});
}
final SlideLIst = [
  Slide(
    images:"images/baby1.jpg",
    title:"مرحبا بكم",
    description:"مربية اطفال للعاملات والامهات اللواتي"
      "لم يجدوا  أين يضعن ابنائهم للضرورة",
  ),
  Slide(
    images:"images/baby2.jpg",
    title:"مرحبا بكم",
    description:"مربية اطفال للعاملات والامهات اللواتي"
        "لم يجدوا  أين يضعن ابنائهم للضرورة",
  ),
  Slide(
    images:"images/maid1.jpg",
    title:"مرحبا بكم",
    description:"مربية اطفال للعاملات والامهات اللواتي"
        "لم يجدوا  أين يضعن ابنائهم للضرورة",
  ),
  Slide(
    images:"images/maid2.jpg",
    title:"مرحبا بكم",
    description:"مربية اطفال للعاملات والامهات اللواتي"
        "لم يجدوا  أين يضعن ابنائهم للضرورة",
  )];
