import 'package:bookly/Core/widgets/custom_circular_indicator.dart';
import 'package:bookly/Core/widgets/custom_error.dart';
import 'package:bookly/Features/home/presentation/views/widgets/newest_list_view_item.dart';
import 'package:bookly/Features/search/presentation/managers/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultSearchListView extends StatelessWidget {
  const ResultSearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                // child: CustomBookImage(
                //     imageUrl:
                //         state.books[index].volumeInfo.imageLinks?.thumbnail ??
                //             ""),
                child: NewestListViewItem(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is SearchFailure) {
          return CustomError(
            errMessage: state.errMessage,
          );
        } else {
          return CustomCircularIndicator();
        }
      },
    );
  }
}
