import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToFavoriteIcon extends StatefulWidget {
  const AddToFavoriteIcon({
    super.key,
  });

  @override
  State<AddToFavoriteIcon> createState() => _AddToFavoriteIconState();
}

Color _iconColor = Colors.white;
Icon _icon = const Icon(CupertinoIcons.star_fill);

class _AddToFavoriteIconState extends State<AddToFavoriteIcon> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Add to Favorite'),
        IconButton(
          onPressed: () {
            setState(() {
              _iconColor =
                  (_iconColor == Colors.white ? Colors.yellow : Colors.white);
            });
          },
          icon: _icon,
          color: _iconColor,
        )
      ],
    );
  }
}
