import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../featurs/accounts/presentaion/manager/accounts_cubit/accounts_cubit.dart';
// import '../../featurs/details/presentaion/manager/detaills_cubit.dart';
// import '../../featurs/transactions/presentaion/manager/favorite_cubit.dart';
// import '../../featurs/home/presentaion/manager/home_cubit.dart';
// import '../../featurs/homeScreen/presentaion/manager/home_screen_cubit.dart';
// import '../../featurs/onboarding/controller/cubit/on_boarding_controller_cubit.dart';
// import '../../featurs/search/presentaion/manager/search_screen_cubit.dart';
// import '../../featurs/accounts/presentaion/manager/top_rated_cubit.dart';
// import '../../featurs/transactions/presentaion/manager/transaction_cubit/transactions_cubit.dart';
import '../../injection_contanier.dart' as di;
import '../../localization/cubit/localization_cubit.dart';
import '../Theme/theme_bloc/theme_bloc.dart';

class Providers {
  static get getProviders => [
        // BlocProvider<OnBoardingControllerCubit>(
        //     create: (_) => di.sl<OnBoardingControllerCubit>()),
        // BlocProvider<HomeCubit>(create: (_) => di.sl<HomeCubit>()),
        // BlocProvider<HomeScreenCubit>(create: (_) => di.sl<HomeScreenCubit>()),
        // BlocProvider<DetailsCubit>( create: (_) => di.sl<DetailsCubit>()),
        BlocProvider<ThemeBloc>( create: (_) => di.sl<ThemeBloc>()),
        BlocProvider<LocalizationCubit>( create: (_) => di.sl<LocalizationCubit>()),
        // BlocProvider<SearchScreenCubit>( create: (_) => di.sl<SearchScreenCubit>()),
        // BlocProvider<FavoriteCubit>( create: (_) => di.sl<FavoriteCubit>()),
        // BlocProvider<TopRatedCubit>( create: (_) => di.sl<TopRatedCubit>()),
        // BlocProvider<TransactionsCubit>( create: (_) => di.sl<TransactionsCubit>()),
        // BlocProvider<AccountsCubit>( create: (_) => di.sl<AccountsCubit>()),
        // BlocProvider<BankAccountCubit>( create: (_) => di.sl<BankAccountCubit>()),
      ];
}
