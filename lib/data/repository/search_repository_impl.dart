import 'package:dev_journey/core/database/daos/search_dao.dart';
import 'package:dev_journey/data/mapper/search_mappers.dart';
import 'package:dev_journey/domain/model/search.dart';
import 'package:dev_journey/domain/repository/search_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  const SearchRepositoryImpl(this._dao);

  final SearchDao _dao;

  @override
  Stream<SearchResults> watchResults(String ftsQuery) =>
      _dao.watchMatches(ftsQuery).map(searchResultsFromRows);
}
