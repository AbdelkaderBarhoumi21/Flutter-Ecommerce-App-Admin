import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String titleApp;
  final void Function()? onPressedSearch;
  final void Function()? onPressedIconFavorite;
  final void Function(String)? onChangeSearchItems;
  final TextEditingController myController;
  const CustomAppbar({
    super.key,
    required this.titleApp,
    required this.onPressedSearch,
    required this.onPressedIconFavorite,
    required this.onChangeSearchItems,
    required this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: onChangeSearchItems,
              controller: myController,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: onPressedSearch,
                  icon: Icon(Icons.search),
                ),
                hintText: titleApp,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          // const SizedBox(width: 10),
          // Container(
          //   width: 60,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     color: Colors.grey[200],
          //   ),
          //   padding: const EdgeInsets.symmetric(vertical: 6),
          //   child: IconButton(
          //     onPressed: onPressedIcon,
          //     icon: Icon(
          //       Icons.notifications_active_outlined,
          //       size: 30,
          //       color: Colors.grey[600],
          //     ),
          //   ),
          // ),
          const SizedBox(width: 10),
          Container(
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: IconButton(
              onPressed: onPressedIconFavorite,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 30,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
