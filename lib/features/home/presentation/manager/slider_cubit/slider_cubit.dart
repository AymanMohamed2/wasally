import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wasally/features/complete_order/data/models/new_version_model/new_version_model.dart';

import '../../../data/repositories/home_repo.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit(this.homeRepo) : super(SliderInitial());
  final HomeRepo homeRepo;
  List<dynamic>? items;
  String? userId;
  NewVersionModel? newVersionModel;
  String? currentVersion;

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

  void getSliderListStream() {
    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('645ac8903beada8a7d13');

    final realtime = Realtime(client);

    try {
      final subscription = realtime.subscribe([
        'databases.658b3929673605997672.collections.658b48fc5f7ee0525aa2.documents',
        'files'
      ]);

      subscription.stream.listen((event) async {
        await getSliderList();
      });
    } on Exception catch (e) {
      // ignore: avoid_print
      print('exception = ${e.toString()}');
    }
  }

  Future<void> getNewVersion() async {
    var response = await homeRepo.getNewVersion();

    response.fold((l) => null, (r) {
      newVersionModel = r;
    });
  }
}
