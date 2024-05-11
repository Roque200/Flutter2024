import 'dart:ui_web';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/popular_model.dart';

class PopularView extends StatelessWidget {
  PopularView({super.key, this.popularModel});

  PopularModel? popularModel;


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: 'https://image.tmdb.org/t/p/w500/${popularModel!.backdropPath}',
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url , error)=>Image.network('https://www.mundodeportivo.com/alfabeta/hero/2024/01/maxresdefault-16.1705584954.625.jpg?width=768&aspect_ratio=16:9&format=nowebp'),
          ),
        ),
    );
  }
}