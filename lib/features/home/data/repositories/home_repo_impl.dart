import 'package:appwrite/appwrite.dart';
import 'package:dio/dio.dart';

import 'package:wasally/core/errors/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:wasally/core/networking/api_services.dart';
import 'package:wasally/features/complete_order/data/models/new_version_model/new_version_model.dart';

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
        .setProject('645ac8903beada8a7d13');

    Databases databases = Databases(client);

// Page 1
    try {
      var result = await databases.listDocuments(
          databaseId: '658b3929673605997672',
          collectionId: '658b4860ee0bd88f61ab',
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
          "X-Appwrite-Project": "645ac8903beada8a7d13",
          "X-Appwrite-Key":
              "8e6ec60f1c9eaea2c034d4ebaf6b918d6836d5167dbcb91aadc61f444a44ca94a147772bafc646f664add4703ab80aee612495c524dfbad4edc3388496bf359e0f78c3f8f27d67e2277bcfc1d8c93a88e0b28c34db25acf869691cd66aaa11e995fea9e4e82a4bb9cede9a88592999968630dd6848f032b93a9ca5697a9515ac"
        },
        endPoint:
            'databases/658b3929673605997672/collections/658b48fc5f7ee0525aa2/documents',
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
  Future<Either<Failure, NewVersionModel>> getNewVersion() async {
    try {
      var response = await apiServices.get(
        headers: {
          "Content-Type": "application/json",
          "X-Appwrite-Project": "645ac8903beada8a7d13",
          "X-Appwrite-Key":
              "8e6ec60f1c9eaea2c034d4ebaf6b918d6836d5167dbcb91aadc61f444a44ca94a147772bafc646f664add4703ab80aee612495c524dfbad4edc3388496bf359e0f78c3f8f27d67e2277bcfc1d8c93a88e0b28c34db25acf869691cd66aaa11e995fea9e4e82a4bb9cede9a88592999968630dd6848f032b93a9ca5697a9515ac"
        },
        endPoint:
            'databases/658b3929673605997672/collections/658b49d70e2476598ed5/documents',
      );

      return right(
        NewVersionModel.fromJson(response),
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
