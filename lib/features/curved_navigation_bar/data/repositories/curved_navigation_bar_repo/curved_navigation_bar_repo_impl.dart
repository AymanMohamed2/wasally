import 'package:appwrite/appwrite.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasally/core/networking/api_services.dart';
import 'package:wasally/features/auth/data/models/user_info_model/user_info_model.dart';

import 'package:wasally/core/errors/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../home/data/models/category_details_model/category_details_model.dart';
import '../../models/order_model/document.dart';
import 'curved_navigation_bar_repo.dart';

class CurvedNavigationBarRepoImpl implements CurvedNavigationBarRepo {
  final ApiServices apiServices;

  CurvedNavigationBarRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, UserInfoModel>> getUserInfo(
      {required String userId}) async {
    try {
      var response = await apiServices.get(
        headers: {
          "Content-Type": "application/json",
          "X-Appwrite-Project": "645ac8903beada8a7d13",
          "X-Appwrite-Key":
              "8e6ec60f1c9eaea2c034d4ebaf6b918d6836d5167dbcb91aadc61f444a44ca94a147772bafc646f664add4703ab80aee612495c524dfbad4edc3388496bf359e0f78c3f8f27d67e2277bcfc1d8c93a88e0b28c34db25acf869691cd66aaa11e995fea9e4e82a4bb9cede9a88592999968630dd6848f032b93a9ca5697a9515ac"
        },
        endPoint: 'users/$userId',
      );

      return right(
        UserInfoModel.fromJson(response),
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
  Future<Either<Failure, CategoryDetailsModel>> postCategory({
    required String collectionId,
    required String name,
    required String address,
    required String categoryName,
    required String shopId,
  }) async {
    try {
      var response = await apiServices.post(
          endPoint:
              'databases/643cc351878dafb57524/collections/$collectionId/documents',
          data: {
            'documentId': shopId,
            'data': {
              'name': name,
              'address': address,
              'categoryName': categoryName,
            }
          },
          headers: {
            "Content-Type": "application/json",
            "X-Appwrite-Project": "6435d5e1a13eff6332c2",
            "X-Appwrite-Key":
                "0de0fe8c91c9c980d16bb39a2e1a579c29048e74ef33b879b4d2e11dbbeec648e6ceb198a7dc7b26898d2c990f33225d045ae64a70381449d33984abcb18714d8ad96f49e30cb4dd9e07b0402743bb52214bb3a0f8f18c780ce186f9ee9e7d84b33ea63a24844a2271e780046c3593fd02c8d1c6202c267c9d92439beb815940"
          });

      return right(
        CategoryDetailsModel.fromJson(response),
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
  Future<Either<Failure, List<Document>>> getCurrentOrders(
      {int pageNumber = 0}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String phoneNumber = prefs.getString("phoneNumber")!;

    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('645ac8903beada8a7d13');

    final databases = Databases(client);

    try {
      final documents = await databases.listDocuments(
          databaseId: '658b3929673605997672',
          collectionId: '658b3935095bff845277',
          queries: [
            Query.equal('phone', phoneNumber),
            Query.limit(10),
            Query.offset(pageNumber * 10),
            Query.notEqual('orderState', 'تم التوصيل')
          ]);

      final List<Document> orderList = [];
      for (var element in documents.documents) {
        orderList.add(Document.fromJson(element.data));
      }

      return right(orderList);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> deleteOrder({required String orderId}) async {
    try {
      await apiServices.delete(
          endPoint:
              'databases/658b3929673605997672/collections/658b3935095bff845277/documents/$orderId',
          headers: {
            "Content-Type": "application/json",
            "X-Appwrite-Project": "645ac8903beada8a7d13",
            "X-Appwrite-Key":
                "0de0fe8c91c9c980d16bb39a2e1a579c29048e74ef33b879b4d2e11dbbeec648e6ceb198a7dc7b26898d2c990f33225d045ae64a70381449d33984abcb18714d8ad96f49e30cb4dd9e07b0402743bb52214bb3a0f8f18c780ce186f9ee9e7d84b33ea63a24844a2271e780046c3593fd02c8d1c6202c267c9d92439beb815940"
          });
      return right(null);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<Document>>> getOldOrders() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String phoneNumber = pref.getString("phoneNumber")!;

    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('645ac8903beada8a7d13');

    final databases = Databases(client);

    try {
      final documents = await databases.listDocuments(
          databaseId: '658b3929673605997672',
          collectionId: '658b3935095bff845277',
          queries: [
            Query.equal(
              'phone',
              phoneNumber,
            ),
            Query.equal('orderState', 'تم التوصيل'),
          ]);

      final List<Document> orderList = [];
      for (var element in documents.documents) {
        orderList.add(Document.fromJson(element.data));
      }

      return right(orderList);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
