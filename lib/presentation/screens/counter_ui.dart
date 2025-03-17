import 'package:bloc_app/Bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    const cardBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(70),
        bottomRight: Radius.circular(70),
      ),
    );
    return Scaffold(
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, state) {
          return SafeArea(
            child: Center(
              child: InkWell(
                customBorder: cardBorder,
                onTap: () {},
                child: Card(
                  elevation: 10,
                  shape: cardBorder,
                  child: SizedBox(
                    height: 350,
                    width: 250,
                    child: Center(
                      child: Text(
                        state.toString(),
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncrementCounterBloc());
            },
            child: Icon(
              Icons.exposure_plus_1_sharp,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecrementCounterBloc());
            },
            child: Icon(Icons.exposure_neg_1_sharp),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
