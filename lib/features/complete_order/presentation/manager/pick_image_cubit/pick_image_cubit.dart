import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../../data/repositories/complete_order_repo.dart';

part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit(this.completeOrderRepo) : super(PickImageInitial());
  final CompleteOrderRepo completeOrderRepo;

  String? fileName;
  String? path;
  String? imageUrl;
  File? imageFile;

  Future<void> pickImage() async {
    final picker = ImagePicker();

    try {
      emit(PickImageLoading());
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        path = imageFile.path;
        this.imageFile = imageFile;

        String fileName = basename(imageFile.path);
        this.fileName = fileName;

        // ignore: avoid_print
        print('File Name: $fileName');
        emit(PickImageSuccess());
      } else {
        emit(PickImageInitial());
      }
    } catch (e) {
      // ignore: avoid_print
      print('ERRORRRRRR');
      emit(PickImageFailure(e.toString()));
    }
  }
}
