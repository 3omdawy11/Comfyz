import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/backend/personal_data.dart';
import 'package:provider/provider.dart';

class AddToFavoriteIcon extends StatefulWidget {
  const AddToFavoriteIcon({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final dynamic movie;

  @override
  State<AddToFavoriteIcon> createState() => _AddToFavoriteIconState();
}

class _AddToFavoriteIconState extends State<AddToFavoriteIcon> {
  late Color _iconColor;
  late Icon _icon;
  late bool _favorite;

  @override
  void initState() {
    super.initState();
    _favorite = Provider.of<PersonalData>(context, listen: false).findMovie(widget.movie);
    _iconColor = _favorite ? Colors.yellow : Colors.white;
    _icon = const Icon(CupertinoIcons.star_fill);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Add to Favorite'),
        IconButton(
          onPressed: () {
            _favorite
                ? Provider.of<PersonalData>(context, listen: false).deleteMovie(widget.movie)
                : Provider.of<PersonalData>(context, listen: false).addMovie(widget.movie);
            print(widget.movie);
            //print(Provider.of<PersonalData>(context, listen: false).myFavorites.length);
            setState(() {
              _iconColor = _favorite ? Colors.white : Colors.yellow;
              _favorite = !_favorite;
            });
            if (!_favorite) Navigator.pop(context);
          },
          icon: _icon,
          color: _iconColor,
        )
      ],
    );
  }
}
