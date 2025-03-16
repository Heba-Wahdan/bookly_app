part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksCubitInitial extends FeaturedBooksState {}

final class FeaturedBooksCubitLoading extends FeaturedBooksState {}

final class FeaturedBooksCubitSuccess extends FeaturedBooksState {
  final List<BookModel> books;

  const FeaturedBooksCubitSuccess(this.books);
}

final class FeaturedBooksCubitFailure extends FeaturedBooksState {
  final String errMessage;
  const FeaturedBooksCubitFailure(this.errMessage);
}
