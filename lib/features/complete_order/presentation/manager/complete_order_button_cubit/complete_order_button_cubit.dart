import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../../data/repositories/complete_order_repo.dart';

part 'complete_order_button_state.dart';

class CompleteOrderCubit extends Cubit<CompleteOrderState> {
  CompleteOrderCubit(this.completeOrderRepo) : super(CompleteOrderInitial());
  final CompleteOrderRepo completeOrderRepo;
  String? order;
  double? lat, long;
  String? imageUrl;

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });
    return await Geolocator.getCurrentPosition();
  }

  Future<void> postOrderAdmin({
    required String phone,
    required BuildContext context,
    required String categoryName,
    required String shopName,
    required String order,
    required String latitude,
    required String longtude,
    String? fileName,
    String? path,
    File? imageFile,
  }) async {
    emit(CompleteOrderLoading());

    if (imageFile != null) {
      await postOrderWithImage(
          fileName: fileName!,
          path: path!,
          categoryName: categoryName,
          latitude: latitude,
          longtude: longtude,
          order: order,
          phone: phone,
          shopName: shopName);
    } else {
      final String? playerId = await getPlayerId();
      var response = await completeOrderRepo.postOrderAdmin(
        // ignore: use_build_context_synchronously
        orderImage: imageUrl,
        playerId: playerId,
        phone: phone,
        categoryName: categoryName,
        shopName: shopName,
        order: order,
        latitude: latitude,
        longitude: longtude,
      );

      response.fold((failure) {
        emit(CompleteOrderFailure(failure.errMessage));
      }, (r) {
        emit(CompleteOrderSuccess());
      });
    }
  }

  bool isWithinWorkingHours() {
    // Get the current time in Egypt
    DateTime now = DateTime.now().toUtc().add(const Duration(hours: 2));
    final newTime = now.add(const Duration(hours: 1));

    // Check if the current time is within working hours (8 am to 11:59 pm)
    if (newTime.hour >= 8 && newTime.hour <= 24) {
      return true;
    } else {
      return false;
    }
  }

  Future<String?> getPlayerId() async {
    // Initialize OneSignal
    OneSignal.shared.setAppId("d3c7d9c5-9e70-48f0-891e-9d13208e8cba");

    // Get the player ID
    var status = await OneSignal.shared.getDeviceState();
    return status?.userId;
  }

  Future<void> getPlayerIdsAndSendNotification() async {
    var response = await completeOrderRepo.getPlayerIdsList();

    response.fold((l) {}, (r) async {
      await sendNotification(playerId: r, message: '🙂 في اوردر يا زعيم');
    });
  }

  Future<void> sendNotification(
      {required String message, required List<String> playerId}) async {
    // Initialize OneSignal
    OneSignal.shared.setAppId("bba93b33-c5b7-4ffd-a9c7-84b8ee55feb7");

    // Create a notification
    var notification = OSCreateNotification(
      playerIds: playerId,
      content: message,
    );

    // Send the notification
    try {
      await OneSignal.shared.postNotification(notification);
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future<void> postOrderWithImage({
    required String fileName,
    required String path,
    required String categoryName,
    required String shopName,
    required String order,
    required String latitude,
    required String longtude,
    required String phone,
  }) async {
    var result =
        await completeOrderRepo.createFile(fileName: fileName, path: path);
    result.fold((failure) {
      emit(UploadImageFailure());
    }, (imageUrl) async {
      final String? playerId = await getPlayerId();
      var response = await completeOrderRepo.postOrderAdmin(
        orderImage: imageUrl,
        playerId: playerId,
        phone: phone,
        categoryName: categoryName,
        shopName: shopName,
        order: order,
        latitude: latitude,
        longitude: longtude,
      );

      response.fold((failure) {
        emit(CompleteOrderFailure(failure.errMessage));
      }, (r) {
        emit(CompleteOrderSuccess());
      });
    });
  }
}
