import 'package:appwrite/appwrite.dart';
import 'package:dio/dio.dart';

import 'package:wasally/core/errors/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:wasally/core/networking/api_services.dart';

import '../models/category_details_model/document.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<Document>>> getCategoryDetails(
      {int pageNumber = 0}) async {
    var client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('6435d5e1a13eff6332c2');

    Databases databases = Databases(client);

// Page 1
    try {
      var result = await databases.listDocuments(
          databaseId: '643cc351878dafb57524',
          collectionId: '643fff738de6a968c5ba',
          queries: [Query.limit(25), Query.offset(pageNumber * 25)]);

      List<Document> shopsList = [];
      for (var element in result.documents) {
        shopsList.add(Document.fromJson(element.data));
      }
      return right(shopsList);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List>> getSliderList() async {
    try {
      var response = await apiServices.get(
        headers: {
          "Content-Type": "application/json",
          "X-Appwrite-Project": "6435d5e1a13eff6332c2",
          "X-Appwrite-Key":
              "0de0fe8c91c9c980d16bb39a2e1a579c29048e74ef33b879b4d2e11dbbeec648e6ceb198a7dc7b26898d2c990f33225d045ae64a70381449d33984abcb18714d8ad96f49e30cb4dd9e07b0402743bb52214bb3a0f8f18c780ce186f9ee9e7d84b33ea63a24844a2271e780046c3593fd02c8d1c6202c267c9d92439beb815940"
        },
        endPoint:
            'databases/643ede0e57f9b9961866/collections/643eeaf57cb1ebbbeaa1/documents',
      );
      List<dynamic> sliderList = [];
      for (var element in response['documents']) {
        sliderList.add(element['imageUrl']);
      }

      return right(
        sliderList,
      );
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> getNewVersion() async {
    try {
      var response = await apiServices.get(
        headers: {
          "Content-Type": "application/json",
          "X-Appwrite-Project": "6435d5e1a13eff6332c2",
          "X-Appwrite-Key":
              "0de0fe8c91c9c980d16bb39a2e1a579c29048e74ef33b879b4d2e11dbbeec648e6ceb198a7dc7b26898d2c990f33225d045ae64a70381449d33984abcb18714d8ad96f49e30cb4dd9e07b0402743bb52214bb3a0f8f18c780ce186f9ee9e7d84b33ea63a24844a2271e780046c3593fd02c8d1c6202c267c9d92439beb815940"
        },
        endPoint:
            'databases/64caa95190471332db5a/collections/64caa95a148beae1157a/documents',
      );
      List<dynamic> sliderList = [];
      for (var element in response['documents']) {
        sliderList.add(element['newVersion']);
      }
      String newVersion = sliderList[0];

      return right(
        newVersion,
      );
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
