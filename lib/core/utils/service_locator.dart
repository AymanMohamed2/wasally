import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wasally/core/utils/api_services.dart';
import 'package:wasally/features/complete_order/data/repositories/complete_order_repo_Impl.dart';
import 'package:wasally/features/home/data/repositories/home_repo_impl.dart';

import '../../features/complete_order/presentation/manager/complete_order_get_location_cubit/complete_order_get_location_cubit.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiServices>()));
  getIt.registerSingleton<CompleteOrderRepoImpl>(
      CompleteOrderRepoImpl(getIt.get<ApiServices>()));
  getIt.registerSingleton<CompleteOrderGetLocationCubit>(
      CompleteOrderGetLocationCubit());
}
