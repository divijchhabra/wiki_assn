import 'package:freo_wiki/feature/home/bloc/dashboard_bloc.dart';
import 'package:freo_wiki/feature/home/repository/mapper/wiki_page_ui_mapper.dart';
import 'package:get_it/get_it.dart';
import 'package:freo_wiki/core/api_service/wiki_service.dart';
import 'package:freo_wiki/feature/home/repository/dashboard_repository.dart';

abstract class AppDependencyInjector {
  static final getIt = GetIt.instance;

  static void setupAppDependencies() {
    initDependencies();
  }

  static void initDependencies() {
    getIt.registerFactory<DashBoardRepository>(
      () => DashBoardRepository(
        getIt.get<WikiService>(),
      ),
    );

    getIt.registerFactory<DashBoardBloc>(
      () => DashBoardBloc(
        getIt.get<DashBoardRepository>(),
        getIt.get<WikiPageUiMapper>(),
      ),
    );

    getIt.registerFactory<WikiService>(
      () => WikiService(),
    );

    getIt.registerFactory<WikiPageUiMapper>(
          () => WikiPageUiMapper(),
    );
  }
}
