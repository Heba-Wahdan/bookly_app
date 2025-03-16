import 'package:bookly/Core/errors/failures.dart';
import 'package:bookly/Core/models/book_model/book_model.dart';
import 'package:bookly/Core/utils/api_services.dart';
import 'package:bookly/Features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks() async {
    try {
      final data = await apiServices.get(
          endpoint: "volumes?Filtering=free-ebooks&q=subject:Programming");

      List<BookModel> bookModel = [];

      for (var item in data["items"]) {
        bookModel.add(BookModel.fromJson(item));
      }

      return right(bookModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServicesFailure.fromDioException(e));
      }
      return left(ServicesFailure(e.toString()));
    }
  }
}
