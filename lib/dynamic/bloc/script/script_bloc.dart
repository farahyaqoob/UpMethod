import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:up_method_mobile_app/dynamic/models/all_scripts_model.dart';
import 'package:up_method_mobile_app/dynamic/models/script_model.dart';
import 'package:up_method_mobile_app/dynamic/repositories/scripts_repository.dart';

part 'script_event.dart';
part 'script_state.dart';

class ScriptBloc extends Bloc<ScriptEvent, ScriptState> {
  ScriptBloc() : super(ScriptInitial());
  ScriptRepository scriptRepository = ScriptRepository();
  @override
  Stream<ScriptState> mapEventToState(ScriptEvent event) async* {
    // GET ALL
    if (event is GetAllScriptEvent) {
      try {
        yield ScriptLoading();
        List<AllScriptModel> allScripts =
            await scriptRepository.getAllScripts();
        yield AllScriptLoaded(allScripts);
      } on Exception {
        yield ScriptFailure("Network Error");
      }
    }
    // --------------------------------------------------
    // GET ONE
    else if (event is GetScriptEvent) {
      try {
        yield ScriptLoading();
        ScriptModel script = await scriptRepository.getScriptById(event.id);
        yield ScriptLoaded(script);
      } on Exception {
        yield ScriptFailure("Network Error");
      }
    }
  }
}
