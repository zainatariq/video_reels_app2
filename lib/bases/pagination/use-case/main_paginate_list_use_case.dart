
import '../../../../helper/data_state.dart';
 import '../model/main_req_entity.dart';
import '../model/pagination_api_model.dart';

abstract class MainPaginateListUseCase<E,
    P extends MainPaginateRequestEntity?> {
  P? req;

  P setPage(int page);
  MainPaginateListUseCase(this.req);
  Future<DataState<(PaginationApiModel, List<E>)>> invoke({P? parm});
}

abstract class NetWorkPaginateListUseCase<E,
        P extends MainPaginateRequestEntity?>
    implements MainPaginateListUseCase<E, P> {
  @override
  P? req;

  @override
  Future<DataState<(PaginationApiModel, List<E>)>> invoke({P? parm}) async {
    return invoke(parm: parm);
  }
}
