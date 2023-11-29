import 'package:code_academy_3/bloc/counter_cubit.dart';
import 'package:code_academy_3/bloc/counter_states.dart';
import 'package:code_academy_3/local/cache.dart';
import 'package:code_academy_3/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Consumer<CounterProvider>(
            //   builder: (context, provider, _){
            //     return Text(
            //       '${provider.counter}',
            //       style: TextStyle(
            //         fontSize: 22,
            //       ),
            //     );
            //   },
            // ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state){
                return Text(
                  '${BlocProvider.of<CounterCubit>(context).counter}',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                );
              },
            ),
            TextButton(
              onPressed: (){
                //Provider.of<CounterProvider>(context, listen: false).inc3();
                BlocProvider.of<CounterCubit>(context).dec();
              }, 
              child: Text('-1'),
            ),
            TextButton(
              onPressed: (){
                //Provider.of<CounterProvider>(context, listen: false).inc3();
                BlocProvider.of<CounterCubit>(context).incThree();
              }, 
              child: Text('+3'),
            ),
          ],
        ),
      ),
    );
  }
}