import '../../../../common/utils/logger/log_utils.dart';
import '../../../../common/utils/pubspec/pubspec_utils.dart';
import '../../../../common/utils/shell/shel.utils.dart';
import '../../../../core/internationalization.dart';
import '../../../../core/locales.g.dart';
import '../../../interface/command.dart';
import 'init_katteko.dart';

class InitCommand extends Command {
  @override
  String get commandName => 'init';

  @override
  Future<void> execute() async {
    await createInitKatekko();
    if (!PubspecUtils.isServerProject) {
      await ShellUtils.pubGet();
    }
    return;
  }

  @override
  String? get hint => Translation(LocaleKeys.hint_init).tr;

  @override
  bool validate() {
    super.validate();
    return true;
  }

  @override
  String? get codeSample => LogService.code('get init');

  @override
  int get maxParameters => 0;
}
