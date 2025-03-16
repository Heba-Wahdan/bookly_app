import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Features/search/presentation/view/widgets/custom_search_text_field.dart';
import 'package:bookly/Features/search/presentation/view/widgets/result_search_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomSearchTextField(),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Search Result",
            style: Styles.textStyle18,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(child: ResultSearchListView())
      ],
    );
  }
}
