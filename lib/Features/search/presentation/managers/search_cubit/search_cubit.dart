// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:bookly/Features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

import 'package:bookly/Core/models/book_model/book_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(
    this.searchRepo,
  ) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchBooks() async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchBooks();
    result.fold((failure) {
      emit(SearchFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(SearchSuccess(books: books));
    });
  }
}
