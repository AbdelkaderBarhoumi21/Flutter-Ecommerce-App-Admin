import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:ecommerce_admin_app_php/data/model/categoryselectedList_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomDropdownSearch extends StatefulWidget {
  final String title;
  final String labelText;
  final IconData iconData;
  final void Function()? onTapIcon;
  final List<SelectedListItem<CategorySelectedListModel>> listData;
  final TextEditingController dropDownSelectedname;
  final TextEditingController dropDownSelectedId;

  const CustomDropdownSearch({
    super.key,
    required this.title,
    required this.listData,
    required this.dropDownSelectedname,
    required this.dropDownSelectedId,
    required this.labelText,
    required this.iconData,
    required this.onTapIcon,
  });

  @override
  State<CustomDropdownSearch> createState() => _CustomDropdownSearchState();
}

class _CustomDropdownSearchState extends State<CustomDropdownSearch> {
  void showDropDownSearch() {
    DropDownState<CategorySelectedListModel>(
      dropDown: DropDown<CategorySelectedListModel>(
        bottomSheetTitle: Text(
          widget.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        submitButtonChild: const Text(
          "Done",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        // enableMultipleSelection: true,
        data: widget.listData ?? [],
        listItemBuilder: (index, dataItem) {
          return Text(
            '${dataItem.data.name}',
          );
        },

        searchDelegate: (query, dataItems) {
          return dataItems
              .where((item) =>
                  item.data.name.toLowerCase().contains(query.toLowerCase()) ||
                  item.data.id.toLowerCase().contains(query.toLowerCase()))
              .toList();
        },

        onSelected: (selectedList) {
          SelectedListItem<CategorySelectedListModel> selectedListItem =
              selectedList[0];
          widget.dropDownSelectedname.text = selectedListItem.data.name;
          widget.dropDownSelectedId.text = selectedListItem.data.id;
          print("===============================");
          print(widget.dropDownSelectedname.text);
          print("===============================");
          print(widget.dropDownSelectedId.text);
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dropDownSelectedname,
      cursorColor: Colors.black,
      // readOnly: widget.isReadOnly,
      onTap: () {
        FocusScope.of(context).unfocus();
        showDropDownSearch();
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        label: Container(
          margin: const EdgeInsets.symmetric(horizontal: 9),
          child: Text(widget.labelText),
        ),
        hintText: widget.dropDownSelectedname.text == ""
            ? widget.title
            : widget.dropDownSelectedname.text,
        hintStyle: TextStyle(fontSize: 14),
        suffixIcon:
            InkWell(onTap: widget.onTapIcon, child: Icon(widget.iconData)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
