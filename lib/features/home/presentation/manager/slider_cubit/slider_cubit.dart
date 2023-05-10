import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repositories/home_repo.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit(this.homeRepo) : super(SliderInitial());
  final HomeRepo homeRepo;
  List<dynamic>? items;
  String? userId;

  Future<void> getSliderList() async {
    emit(SliderStateLoading());
    var response = await homeRepo.getSliderList();
    response.fold((failure) {
      emit(SliderStateFailure(failure.errMessage));
    }, (sliderItems) {
      items = sliderItems;
      emit(SliderStateSuccess(sliderItems));
    });
  }

  void getAllOrder() {
    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('6435d5e1a13eff6332c2');

    final realtime = Realtime(client);

    try {
      final subscription = realtime.subscribe([
        'databases.643ede0e57f9b9961866.collections.643eeaf57cb1ebbbeaa1.documents',
        'files'
      ]);

      subscription.stream.listen((event) async {
        print(event);
        await getSliderList();
      });
    } on Exception catch (e) {
      print('exception = ${e.toString()}');
    }
  }
}
