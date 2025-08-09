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
      builder:(context, state) =>  Column(
        spacing:20,
       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('welcome sayed'),
              Text('sayed@yahoo.com'),
            ],
          ),
          accountWidget('your full name', 'sayed elfeki'),
          accountWidget('your E-mail', 'sayed@yahoo.com'),
          accountWidget('your password', '****************'),
          accountWidget('your mobile number', '123456789'),
          accountWidget('your Address', '6 october ,street'),
          Flexible(child: Container())
          // Text(startViewModel.lang),
          // ElevatedButton(onPressed: () {
          //   startViewModel.changeLang(startViewModel.lang=='arabic'?'english':'arabic');
          // }, child:Text('change to ${startViewModel.lang=='arabic'?'english':'arabic'}'))
        ],
      ),
    );
    
  }
  accountWidget(String title,String data)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(height: 10,),
        TextFormField(
          decoration: InputDecoration(
            hintText: data,
            suffixIcon: Icon(Icons.edit)
          ),
        )
      ],
    );
  }
}
