import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/order_model/document.dart';
import '../../../data/repositories/curved_navigation_bar_repo/curved_navigation_bar_repo.dart';

part 'old_orders_state.dart';

class OldOrdersCubit extends Cubit<OldOrdersState> {
  OldOrdersCubit(this.curvedNavigationBarRepo) : super(OldOrdersInitial());
  final CurvedNavigationBarRepo curvedNavigationBarRepo;

  Future<void> getOldOrders({required String phoneNumber}) async {
    emit(OldOrdersLoading());
    var response =
        await curvedNavigationBarRepo.getOldOrders(phoneNumber: phoneNumber);
    response.fold((failure) {
      emit(OldOrdersFailure(failure.errMessage));
    }, (orderList) {
      getOldOrdersStream();

      emit(OldOrdersSuccess(orderList));
    });
  }

  void getOldOrdersStream() async {
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
        getOldOrders(phoneNumber: pref.getString("phoneNumber")!);
      });
    } on Exception catch (e) {
      // ignore: avoid_print
      print('exception = ${e.toString()}');
    }
  }
}
