import 'package:flutter/material.dart';
class CircularProfilePhotoWidget extends StatelessWidget {
  const CircularProfilePhotoWidget({
    super.key,
    required this.imageUrl, this.errorWidget, this.loadWidget,
  });

  final String imageUrl;
  final Widget? errorWidget, loadWidget;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(imageUrl,
        height: 55,
        width: 55,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return loadWidget ?? Container(
            color: const Color(0xFFF39814).withOpacity(.3),
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 15,
              width: 15,
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                    : null,
                strokeWidth: 2,
                color: Colors.white,
              ),
            ),
          );
        },
        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
          return errorWidget ?? const Icon(Icons.person, color: Colors.white,);
        },
      ),
    );
  }
}