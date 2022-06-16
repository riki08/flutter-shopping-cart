import 'package:k11/entities/api_response.dart';

abstract class UserListRespositoryIml {
  Future<ApiResponse> getUser();
}
