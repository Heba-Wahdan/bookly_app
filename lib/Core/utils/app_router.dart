import 'package:bookly/Core/utils/service_locator.dart';
import 'package:bookly/Core/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:bookly/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly/Features/search/presentation/managers/search_cubit/search_cubit.dart';
import 'package:bookly/Features/search/presentation/view/search_view.dart';
import 'package:bookly/Features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomePath = "/homeView";
  static const kBookDetailsView = "/bookDetailsView";
  static const kSearchView = "/SearchView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomePath,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            bookModel: state.extra
                as BookModel, //!!!!!!!!!!!!!!!!!!!! msh hyroo7 ll screen el tanya mn 8er el book model w el book detail view asln 3ayz bookmodel fa msh 3arf ad5olo mn8ero
          ),
        ),
      ),
      GoRoute(
          path: kSearchView,
          builder: (context, state) => BlocProvider(
                create: (context) => SearchCubit(getIt.get<SearchRepoImpl>())
                  ..fetchSearchBooks(),
                child: const SearchView(),
              )),
    ],
  );
}
