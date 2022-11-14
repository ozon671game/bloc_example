import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'color_bloc.dart';

class SingleButton extends StatelessWidget {
  const SingleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => Page2(bloc: bloc,)));
          // context.read<ColorBloc>().add(ColorEvent.eventPurple);
          // bloc.add(ColorEvent.eventPurple);
        });
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key, required this.bloc}) : super(key: key);
final ColorBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.greenAccent,
        child: Center(
          child: FloatingActionButton(onPressed: () {

            bloc.add(ColorEvent.eventPurple);
          },),
        ),
      ),
    );
  }
}

