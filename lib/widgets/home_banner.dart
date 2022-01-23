import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_wan_android/model/home_banner_entity.dart';
import 'package:flutter_wan_android/widgets/url_utils.dart';
import 'package:lx_base/widget/cached_image.dart';

class HomeBanner extends StatelessWidget {
  final List<HomeBannerData>? banners;
  final double? bannerHeight;
  final EdgeInsetsGeometry? padding;

  const HomeBanner(
    this.banners, {
    Key? key,
    this.bannerHeight = 160,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return banners != null && banners!.isNotEmpty
        ? SizedBox(
            height: bannerHeight,
            child: _banners(context),
          )
        : Container();
  }

  _banners(BuildContext context) {
    var right = 10 + (padding?.horizontal ?? 0) / 2;
    return Swiper(
      itemCount: banners!.length,
      autoplay: true,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {},
          child: _image(context, banners![index]),
        );
      },
      //指示器
      pagination: SwiperPagination(
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.only(right: right, bottom: 10),
          builder: const DotSwiperPaginationBuilder(
              color: Colors.white60,
              activeColor: Colors.white,
              size: 6,
              activeSize: 8)),
    );
  }

  _image(BuildContext context, HomeBannerData banner) {
    return InkWell(
      onTap: () {
        _handleClick(context, banner);
      },
      child: Container(
        padding: padding,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: CachedImage(banner.imagePath),
        ),
      ),
    );
  }

  void _handleClick(BuildContext context, HomeBannerData banner) {
    launchUrl(context, banner.url, title: banner.title);
  }
}
