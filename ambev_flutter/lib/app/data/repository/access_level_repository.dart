import 'package:ambev_flutter/app/data/model/access_level_model.dart';
import 'package:ambev_flutter/app/data/provider/access_level_provider.dart';

class AccessLevelRepository {
  final AccessLevelApiClient api = AccessLevelApiClient();

  Future<List<AccessLevel>> get () async {
    var accessLevels = <AccessLevel>[];

    var response = await api.get();

    accessLevels.addAll(List.from(response['access_levels'].map((a) => AccessLevel.fromJson(a))));

    return accessLevels;
  }
}
