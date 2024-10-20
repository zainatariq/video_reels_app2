
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octo_image/octo_image.dart';

class CustomCard extends StatelessWidget {
    CustomCard({
    super.key,
      this.image,
      this.widget,
      this.height,
  this.  width
  });

  final String? image;
  final double  ? width;
  final double  ? height;
  final Widget ? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      clipBehavior: Clip.antiAlias,
      width: width??MediaQuery
          .of(context)
          .size
          .width,
      margin: null,
      padding: null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
            color: Colors.transparent, width: 0),
      ),
      child:image==null?Container(
        color: Colors.black,
        child:widget ,
      ): OctoImage(
        image: CachedNetworkImageProvider(
            image!
        ),
        placeholderBuilder:  blurHashPlaceholderBuilder('LEHV6nWB2yk8pyo0adR*.7kCMdnj',   fit: BoxFit.cover),
        errorBuilder: (context, url, error) {
          return const BlurHash(
              hash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj');
        },
        fit: BoxFit.cover,
      ),
    );
  }
}

OctoPlaceholderBuilder blurHashPlaceholderBuilder(String hash, {BoxFit? fit}) {
  return (context) => SizedBox.expand(
    child: Image(
      image: BlurHashImage(hash),
      fit: fit ?? BoxFit.cover,
    ),
  );
}