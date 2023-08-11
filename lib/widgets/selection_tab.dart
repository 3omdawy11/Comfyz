import 'package:flutter/material.dart';

class SelectionTab extends StatefulWidget {
  const SelectionTab({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<String> categories;

  @override
  _SelectionTabState createState() => _SelectionTabState();
}

class _SelectionTabState extends State<SelectionTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: index == selectedIndex ? Colors.grey.withOpacity(0.4) : Colors.transparent,
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.categories[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
