import 'package:flowery_rider_app/features/auth/domain/repositories/auth_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepoContract)
class AuthRepoImpl implements AuthRepoContract {
  AuthRepoImpl();
}
