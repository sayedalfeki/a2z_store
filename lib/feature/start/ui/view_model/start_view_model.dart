import 'package:a_to_z_store/feature/start/ui/view_model/start_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartViewModel extends Cubit<StartState>
{
  StartViewModel():super(StartInitState());
  int selectedIndex=0;
  changeSelectedIndex(int value)
  {
    selectedIndex=value;
    emit(ChangeIndexStartState());
  }
}