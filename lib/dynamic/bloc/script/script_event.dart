part of 'script_bloc.dart';

@immutable
abstract class ScriptEvent {
  const ScriptEvent();
}

class GetAllScriptEvent extends ScriptEvent {
  const GetAllScriptEvent();
}

class GetScriptEvent extends ScriptEvent {
  final int id;
  const GetScriptEvent(this.id);
}
