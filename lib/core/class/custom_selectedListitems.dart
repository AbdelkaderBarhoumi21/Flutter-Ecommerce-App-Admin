import 'package:drop_down_list/model/selected_list_item.dart';

/// This is a model class used to represent an item in a selectable list
class CustomSelectedlistitems extends SelectedListItem {
  final dynamic value;
  CustomSelectedlistitems({
    required super.data,
    required this.value,
  });
}
