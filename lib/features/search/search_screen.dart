import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kursus_online_mobile/constants/colors.dart';
import 'package:kursus_online_mobile/constants/helpers/helper_functions.dart';
import 'package:kursus_online_mobile/core/network/api_client.dart';
import 'package:kursus_online_mobile/features/cart/data/cart.dart';
import 'package:kursus_online_mobile/features/search/controllers/category_controller.dart';
import 'package:kursus_online_mobile/features/search/data/tags.dart';
import 'package:kursus_online_mobile/features/search/repositories/category_repository.dart';
import 'package:kursus_online_mobile/features/search/services/category_service.dart';
import 'package:kursus_online_mobile/features/search/widgets/search_categories.dart';
import 'package:kursus_online_mobile/features/subcategories/subcategories.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FocusNode _focusNode = FocusNode();
  bool isFocused = false;
  final TextEditingController _searchController = TextEditingController();
  late final CategoryController controller;
  @override
  void initState() {
    super.initState();
    controller = Get.put(
      CategoryController(CategoryRepository(CategoryService(ApiClient.dio))),
    );
    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: UColors.backgroundColor,
        title: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _searchController,
                  builder: (context, value, child) {
                    return TextField(
                      controller: _searchController,
                      focusNode: _focusNode,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: Colors.white70,
                        ),
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.white),
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        filled: true,
                        fillColor: Colors.white.withAlpha(30),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: value.text.isEmpty
                            ? null
                            : GestureDetector(
                                onTap: () {
                                  _searchController.clear();
                                },
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                      ),
                    );
                  },
                ),
              ),
            ),
            if (isFocused) ...[
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  _focusNode.unfocus();
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              if (isFocused)
                Column(
                  children: courses.map((course) {
                    return Center();
                  }).toList(),
                )
              else
                Column(
                  children: [
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 16,
                      runSpacing: 8,
                      children: tags.map((tag) {
                        return GestureDetector(
                          onTap: () {
                            _searchController.text = tag;
                            _focusNode.requestFocus();
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              border: BoxBorder.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              tag,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    Obx(() {
                      if (controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return Wrap(
                        children: controller.categories.map((category) {
                          return InkWell(
                            onTap: () => Get.to(() => SubCategoriesScreen(), arguments: category.id),
                            child: SearchCategories(title: category.name),
                          );
                        }).toList(),
                      );
                    }),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
