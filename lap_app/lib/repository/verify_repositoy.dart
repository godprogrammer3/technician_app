import 'package:lap_app/model/models.dart';

abstract class VerifyRepository {
  Future<Token> getToken(Credential credential);
}