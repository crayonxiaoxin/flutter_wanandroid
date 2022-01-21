import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// 可以缓存的图片组件
class CachedImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final PlaceholderWidgetBuilder? placeholder;
  final LoadingErrorWidgetBuilder? errorWidget;

  const CachedImage(
    this.imageUrl, {
    Key? key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl != null && imageUrl!.isNotEmpty
        ? CachedNetworkImage(
            imageUrl: imageUrl!,
            width: width,
            height: height,
            fit: fit,
            placeholder: placeholder ??
                (context, url) {
                  return Container(
                    color: Colors.grey[200],
                  );
                },
            errorWidget:
                errorWidget ?? (context, url, error) => const Icon(Icons.error))
        : Container();
  }
}
