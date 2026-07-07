import 'package:flowery_rider_app/config/base_response/base_response.dart';
import 'package:flowery_rider_app/features/profile/my_profile/data/models/edit_profile_request_model.dart';
import 'package:flowery_rider_app/features/profile/my_profile/domain/entities/driver_profile_entity.dart';
import 'package:flowery_rider_app/features/profile/my_profile/domain/repositories/profile_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileUseCase {
  final ProfileRepoContract _repository;

  EditProfileUseCase(this._repository);

  Future<BaseResponse<DriverProfileEntity>> call(
    EditProfileRequestModel request,
  ) {
    return _repository.editProfile(request);
  }
}
