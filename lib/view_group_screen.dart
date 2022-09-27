import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p5/bloc/counter_bloc.dart';

class ViewGroupScreen extends StatelessWidget {
  const ViewGroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _counterBloc = CounterBloc();

    return Scaffold(
      appBar: AppBar(
        title: Text('View Group'),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              _counterBloc.add(Tambah());
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              _counterBloc.add(Kurang());
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: BlocBuilder(
            bloc: _counterBloc,
            builder: (context, state) {
              print(state);
              if(state is CounterLoading){
                return Text('...');
              }

              if(state is CounterLoaded){
                return Text(
                  state.nilai.toString(),
                  style: TextStyle(fontSize: 50),
                );
              }

              if(state is CounterInitial){
                return Text(
                  '1',
                  style: TextStyle(fontSize: 50),
                );
              }

              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
