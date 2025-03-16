import 'package:bookly/Core/functions/launch_url.dart';
import 'package:bookly/Core/widgets/custom_button.dart';
import 'package:bookly/Core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              fontSize: 18,
              backGroundColor: Colors.white,
              text: "Free",
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                CustomLaunchUrl(context, bookModel.volumeInfo.previewLink);
              },
              fontSize: 16,
              backGroundColor: const Color(0xffEF8262),
              text: getText(bookModel),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  topRight: Radius.circular(16)),
            ),
          )
        ],
      ),
    );
  }
}

String getText(BookModel bookModel) {
  if (bookModel.volumeInfo.previewLink == null) {
    return "Not Available";
  } else {
    return " Preview";
  }
}
