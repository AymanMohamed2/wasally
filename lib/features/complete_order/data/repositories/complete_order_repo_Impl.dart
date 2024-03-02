import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wasally/core/networking/api_services.dart';
import 'package:wasally/features/complete_order/data/repositories/complete_order_repo.dart';

import '../../../../core/errors/failures.dart';
import '../models/product_model/document.dart';

class CompleteOrderRepoImpl implements CompleteOrderRepo {
  final ApiServices apiServices;

  CompleteOrderRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<Document>>> fetchShopProducts(
      {required String shopId, int pageNumber = 0}) async {
    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('645ac8903beada8a7d13');

    final databases = Databases(client);

    try {
      final documents = await databases.listDocuments(
          databaseId: '64b8f36cd21320ef3067',
          collectionId: '64b8f37e63bb24f50384',
          queries: [
            Query.equal('shopid', shopId),
            Query.limit(25),
            Query.offset(pageNumber * 25)
          ]);

      final List<Document> productsList = [];
      for (var element in documents.documents) {
        productsList.add(Document.fromJson(element.data));
      }

      return right(productsList);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> postOrderAdmin({
    required String phone,
    required String categoryName,
    required String shopName,
    required String order,
    required String latitude,
    required String longitude,
    String? playerId,
    String? orderImage,
  }) async {
    DateTime? dateTime = await getCurrentTimeInEgypt();
    try {
      await apiServices.post(
          headers: {
            "Content-Type": "application/json",
            "X-Appwrite-Project": "645ac8903beada8a7d13",
            "X-Appwrite-Key":
                "8e6ec60f1c9eaea2c034d4ebaf6b918d6836d5167dbcb91aadc61f444a44ca94a147772bafc646f664add4703ab80aee612495c524dfbad4edc3388496bf359e0f78c3f8f27d67e2277bcfc1d8c93a88e0b28c34db25acf869691cd66aaa11e995fea9e4e82a4bb9cede9a88592999968630dd6848f032b93a9ca5697a9515ac"
          },
          endPoint:
              'databases/658b3929673605997672/collections/658b3935095bff845277/documents',
          data: {
            'documentId': ID.unique(),
            'data': {
              'playerId': playerId,
              'dateTime': dateTime.toString(),
              'phone': phone,
              'categoryName': categoryName,
              'shopName': shopName,
              'order': order,
              'latitude': latitude,
              'longtude': longitude,
            }
          });

      return right(null);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  Future<DateTime> getCurrentTimeInEgypt() async {
    final currentTime = DateTime.now().toUtc().add(const Duration(hours: 2));

    final newTime = currentTime;

    return newTime;
  }

  @override
  Future<Either<Failure, List<String>>> getPlayerIdsList() async {
    try {
      var response = await apiServices.get(
        endPoint:
            'databases/658b3929673605997672/collections/658b494f96054174ff9e/documents',
        headers: {
          'Content-Type': 'application/json',
          'X-Appwrite-Response-Format': '1.0.0',
          'X-Appwrite-Project': '645ac8903beada8a7d13',
          'X-Appwrite-Key':
              '0de0fe8c91c9c980d16bb39a2e1a579c29048e74ef33b879b4d2e11dbbeec648e6ceb198a7dc7b26898d2c990f33225d045ae64a70381449d33984abcb18714d8ad96f49e30cb4dd9e07b0402743bb52214bb3a0f8f18c780ce186f9ee9e7d84b33ea63a24844a2271e780046c3593fd02c8d1c6202c267c9d92439beb815940',
        },
      );
      List<String> playerIds = [];
      for (var element in response['documents']) {
        playerIds.add(element['playerId']);
      }
      // ignore: avoid_print
      print(playerIds);

      return right(playerIds);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, String>> createFile(
      {required String path, required String fileName}) async {
    Client client = Client();
    Storage storage = Storage(client);

    client
        .setEndpoint('https://cloud.appwrite.io/v1') // Your API Endpoint
        .setProject('6435d5e1a13eff6332c2');
    try {
      var result = await storage.createFile(
        bucketId: '64bd4831c088d8d855c5',
        fileId: ID.unique(),
        file: InputFile.fromPath(path: path, filename: fileName),
      );
      return right(
          'https://cloud.appwrite.io/v1/storage/buckets/64bd4831c088d8d855c5/files/${result.$id}/view?project=6435d5e1a13eff6332c2&mode=admin');
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
