import 'package:evently_c20_dokki/core/config/app_config.dart';
import 'package:evently_c20_dokki/core/utils/context_extention.dart';
import 'package:evently_c20_dokki/core/utils/numbers_extension.dart';
import 'package:evently_c20_dokki/models/category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTabBarWidget extends StatelessWidget {
  final List<Category> categories;
  final void Function(int) selectItem;
  final int selectedIndex ;

  const CustomTabBarWidget({
    required this.categories,
    required this.selectItem,
    required this.selectedIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfig>(context);
    return DefaultTabController(
      length: categories.length,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        indicatorColor: Colors.transparent,
        dividerHeight: 0,
        isScrollable: true,
        onTap: selectItem,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: EdgeInsets.symmetric(horizontal: 8),
        tabs: categories.map((category) {
          bool isSelected = selectedIndex == categories.indexOf(category);
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? context.colors.primary
                  : context.colors.onSecondary,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: context.colors.primary, width: 0.6),
            ),
            child: Row(
              children: [
                Icon(
                  category.icon,
                  color: isSelected ? Colors.white : context.colors.primary,
                ),
                8.horizontalSpace,
                Text(
                  provider.isEn ? category.nameEn : category.nameAr,
                  style: context.text.labelLarge!.copyWith(
                    color: isSelected ? Colors.white : context.colors.secondary,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
