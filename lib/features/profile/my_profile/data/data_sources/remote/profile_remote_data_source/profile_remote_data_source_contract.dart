import 'package:flowery_rider_app/features/profile/my_profile/data/models/response/profile_response_model.dart';

abstract interface class ProfileRemoteDataSourceContract {
  Future<ProfileResponseModel> getLoggedDriverData();
}
