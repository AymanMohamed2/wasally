// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// import '../../../data/repositories/curved_navigation_bar_repo/curved_navigation_bar_repo.dart';

// part 'delete_order_state.dart';

// class DeleteOrderCubit extends Cubit<DeleteOrderState> {
//   DeleteOrderCubit(this.curvedNavigationBarRepo) : super(DeleteOrderInitial());
//   final CurvedNavigationBarRepo curvedNavigationBarRepo;

//   Future<void> deleteOrder({required orderId}) async {
//     emit(DeleteOrderLoading());
//     var response = await curvedNavigationBarRepo.deleteOrder(orderId: orderId);

//     response.fold((failure) {
//       emit(DeleteOrderFailure(failure.errMessage));
//     }, (success) {
//       emit(DeleteOrderSuccess());
//     });
//   }
// }
