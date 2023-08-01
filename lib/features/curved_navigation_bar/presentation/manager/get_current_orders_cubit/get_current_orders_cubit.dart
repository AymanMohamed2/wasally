import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/models/order_model/document.dart';
import '../../../data/repositories/curved_navigation_bar_repo/curved_navigation_bar_repo.dart';

part 'get_current_orders_state.dart';

class GetCurrentOrdersCubit extends Cubit<GetCurrentOrdersState> {
  GetCurrentOrdersCubit(this.curvedNavigationBarRepo)
      : super(GetUserOrderInitial());
  final CurvedNavigationBarRepo curvedNavigationBarRepo;
  String? errMessage;
  List<Document> orderList = [];
  void Function()? updateUi;

  Future<void> getCurrentOrders({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(GetUserOrderLoading());
    } else {
      emit(GetUserOrderPaginationLoading());
    }
    var response =
        await curvedNavigationBarRepo.getCurrentOrders(pageNumber: pageNumber);
    response.fold((failure) {
      errMessage = failure.errMessage;
      emit(GetUserOrderFailure(failure.errMessage));
    }, (orderList) {
      emit(GetUserOrderSuccess(orderList));
    });
  }

  void getCurrentOrdersStream() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String phoneNumber = prefs.getString("phoneNumber")!;
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
        if (event.events.contains(
            'databases.64439ac773343115d92a.collections.64439af01110334cae23.documents.*.update')) {
          Document order = Document.fromJson(event.payload);
          if (order.phone == phoneNumber) {
            updateObjectById(id: order.id!, updateOrder: order);
            updateUi!();
          }
        } else if (event.events.contains(
            'databases.64439ac773343115d92a.collections.64439af01110334cae23.documents.*.create')) {
          Document order = Document.fromJson(event.payload);

          if (order.phone == phoneNumber) {
            orderList.add(order);
            updateUi!();
          }
        } else if (event.events.contains(
            'databases.64439ac773343115d92a.collections.64439af01110334cae23.documents.*.delete')) {
          Document order = Document.fromJson(event.payload);

          if (order.phone == phoneNumber) {
            orderList.removeWhere((element) => element.id == order.id);
            updateUi!();
          }
        }

        // await getCurrentOrders();
      });
    } on Exception catch (e) {
      // ignore: avoid_print
      print('exception = ${e.toString()}');
    }
  }

  void updateObjectById({required String id, required Document updateOrder}) {
    for (int i = 0; i < orderList.length; i++) {
      if (orderList[i].id == id) {
        orderList[i] = updateOrder;
        break;
      }
    }
  }

  Future<void> deleteOrder({required orderId}) async {
    var response = await curvedNavigationBarRepo.deleteOrder(orderId: orderId);

    response.fold((failure) {
      emit(DeleteOrderFailure(failure.errMessage));
    }, (success) {
      emit(DeleteOrderSuccess());
    });
  }

  makingPhoneCall({required String phone}) async {
    var url = Uri.parse("tel:$phone");
    await launchUrl(url, mode: LaunchMode.externalNonBrowserApplication);
  }
}
