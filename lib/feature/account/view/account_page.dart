import 'package:a_to_z_store/core/utils/re_usable_widget/custome_container.dart';
import 'package:a_to_z_store/feature/start/ui/view_model/start_state.dart';
import 'package:a_to_z_store/feature/start/ui/view_model/start_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  @override
  Widget build(BuildContext context) {
    StartViewModel startViewModel=BlocProvider.of<StartViewModel>(context);
    return BlocConsumer<StartViewModel,StartState>(
      listener: (context, state) {

      },
      builder:(context, state) =>  CustomContainer(
        child: Column(
          children: [
            Text(startViewModel.lang),
            ElevatedButton(onPressed: () {
              startViewModel.changeLang(startViewModel.lang=='arabic'?'english':'arabic');
            }, child:Text('change to ${startViewModel.lang=='arabic'?'english':'arabic'}'))
          ],
        ),
      ),
    );
  }
}
