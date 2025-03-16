import 'package:bookly/Core/errors/failures.dart';
import 'package:bookly/Core/utils/api_services.dart';
import 'package:bookly/Core/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      final data = await apiServices.get(
          endpoint: "volumes?Filtering=free-ebooks&Sorting=newest&q=computer");
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(
            item)); //BookModel.fromJson(item) → Converts the Map into a BookModel object.
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServicesFailure.fromDioException(e));
      }
      return left(ServicesFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      final data = await apiServices.get(
          endpoint: "volumes?Filtering=free-ebooks&q=subject:flutter");

      List<BookModel> books = [];

      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServicesFailure.fromDioException(e));
      }
      return left(ServicesFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      final data = await apiServices.get(
          endpoint:
              "volumes?Filtering=free-ebooks&Sorting=relevance&q=Programmierung");

      List<BookModel> books = [];

      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServicesFailure.fromDioException(e));
      }
      return left(ServicesFailure(e.toString()));
    }
  }
}
