import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(path: 'secret.env')
abstract class Env {
  @EnviedField(varName: 'MY_KEY', obfuscate: true)
  static String myApiKey = _Env.myApiKey;
}
