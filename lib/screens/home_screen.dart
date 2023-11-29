
import 'package:code_academy_3/bloc/counter_cubit.dart';
import 'package:code_academy_3/bloc/counter_states.dart';
import 'package:code_academy_3/providers/counter_provider.dart';
import 'package:code_academy_3/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            }, 
            icon: Icon(Icons.forward),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // Consumer<CounterProvider>(
            //   builder: (context, provider, widget){
            //     return Text(
            //       '${provider.counter}',
            //       style: Theme.of(context).textTheme.headlineMedium,
            //     );
            //   },
            // ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state){
                return Text(
                  '${BlocProvider.of<CounterCubit>(context).counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //Provider.of<CounterProvider>(context, listen: false).inc();
          BlocProvider.of<CounterCubit>(context, listen: false).inc();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
