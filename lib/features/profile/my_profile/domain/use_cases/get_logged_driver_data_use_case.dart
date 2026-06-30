import 'package:flowery_rider_app/config/base_response/base_response.dart';
import 'package:flowery_rider_app/features/profile/my_profile/domain/entities/driver_profile_entity.dart';
import 'package:flowery_rider_app/features/profile/my_profile/domain/repositories/profile_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLoggedDriverDataUseCase {
  final ProfileRepoContract _profileRepoContract;

  GetLoggedDriverDataUseCase(this._profileRepoContract);

  Future<BaseResponse<DriverProfileEntity>> call() {
    return _profileRepoContract.getLoggedDriverData();
  }
}
