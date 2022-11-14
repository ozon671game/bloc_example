import 'package:bloc_example/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'single_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(create: (BuildContext context) => ColorBloc(),
      child: const MyHomePage()),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ColorBloc, Color>(
        builder: (context, event) {
          return Center(
            child: Container(
              height: 200,
              width: 200,
              color: event,
            ),
          );
        }
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SingleButton(),
          const SizedBox(width: 10,),
          FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                 context.read<ColorBloc>().add(ColorEvent.eventBlack);
                // bloc.add(ColorEvent.eventBlack);
              }),
        ],
      ),
    );
  }
}

