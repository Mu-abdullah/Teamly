import 'package:dartz/dartz.dart';

import '../../../../../../core/error/custom_errors.dart';
import '../../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../model/get_month_model.dart';

class GetMonthRepo {
  GraphQLService service;

  GetMonthRepo(this.service);
  Future<Either<CustomError, List<String>>> getMonth({
    required String compId,
  }) async {
    try {
      var result = await service.fetchCollection<GetMonthModel>(
        collection: BackendPoint.attendance,
        fromJson: GetMonthModel.fromJson,
        fields: const ['date'],
        filters: {
          'comp_id': {'eq': compId},
        },
      );
      final months =
          result
              .map((record) {
                final dateStr = record.date as String;
                final date = DateTime.parse(dateStr.replaceAll('/', '-'));
                return '${date.year}-${date.month.toString().padLeft(2, '0')}';
              })
              .toSet()
              .toList();

      months.sort();

      return Right(months);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
