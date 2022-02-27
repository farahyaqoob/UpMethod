part of 'script_bloc.dart';

@immutable
abstract class ScriptState {
  const ScriptState();
}

class ScriptInitial extends ScriptState {
  const ScriptInitial();
}

class ScriptLoading extends ScriptState {
  const ScriptLoading();
}

class AllScriptLoaded extends ScriptState {
  final List<AllScriptModel> allScriptModel;
  const AllScriptLoaded(this.allScriptModel);
}

class ScriptLoaded extends ScriptState {
  final ScriptModel scriptModel;
  const ScriptLoaded(this.scriptModel);
}

class ScriptFailure extends ScriptState {
  final String msg;
  const ScriptFailure(this.msg);
}
