import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/order_model/document.dart';
import '../../../data/repositories/curved_navigation_bar_repo/curved_navigation_bar_repo.dart';

part 'get_current_orders_state.dart';

class GetUserOrderCubit extends Cubit<GetUserOrderState> {
  GetUserOrderCubit(this.curvedNavigationBarRepo)
      : super(GetUserOrderInitial());
  final CurvedNavigationBarRepo curvedNavigationBarRepo;
  String? errMessage;

  Future<void> getCurrentOrders({required String phoneNumber}) async {
    emit(GetUserOrderLoading());
    var response = await curvedNavigationBarRepo.getCurrentOrders(
        phoneNumber: phoneNumber);
    response.fold((failure) {
      errMessage = failure.errMessage;
      emit(GetUserOrderFailure(failure.errMessage));
    }, (orderList) {
      emit(GetUserOrderSuccess(orderList));
    });
  }

  void getCurrentOrdersStream() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('6435d5e1a13eff6332c2');

    final realtime = Realtime(client);

    try {
      final subscription = realtime.subscribe([
        'databases.64439ac773343115d92a.collections.64439af01110334cae23.documents',
        'files'
      ]);

      subscription.stream.listen((event) async {
        getCurrentOrders(phoneNumber: pref.getString("phoneNumber")!);
      });
    } on Exception catch (e) {
      // ignore: avoid_print
      print('exception = ${e.toString()}');
    }
  }
}
