import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/order_model/document.dart';
import '../../../data/repositories/curved_navigation_bar_repo/curved_navigation_bar_repo.dart';

part 'old_orders_state.dart';

class OldOrdersCubit extends Cubit<OldOrdersState> {
  OldOrdersCubit(this.curvedNavigationBarRepo) : super(OldOrdersInitial());
  final CurvedNavigationBarRepo curvedNavigationBarRepo;

  Future<void> getOldOrders() async {
    emit(OldOrdersLoading());

    var response = await curvedNavigationBarRepo.getOldOrders();
    response.fold((failure) {
      emit(OldOrdersFailure(failure.errMessage));
    }, (orderList) {
      getOldOrdersStream();

      emit(OldOrdersSuccess(orderList));
    });
  }

  void getOldOrdersStream() async {
    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('645ac8903beada8a7d13');

    final realtime = Realtime(client);

    try {
      final subscription = realtime.subscribe([
        'databases.658b3929673605997672.collections.658b3935095bff845277.documents',
        'files'
      ]);

      subscription.stream.listen((event) async {
        getOldOrders();
      });
    } on Exception catch (e) {
      // ignore: avoid_print
      print('exception = ${e.toString()}');
    }
  }
}
