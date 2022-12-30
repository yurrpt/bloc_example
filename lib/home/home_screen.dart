import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/enum/person_enum.dart';
import '../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    context.read<PersonsBloc>().add(const LoadPersonsAction(url: PersonUrl.persons));
                  },
                  child: const Text('Load json #1')),
              _loadJsonButton(context, () {
                context.read<PersonsBloc>().add(const LoadPersonsAction(url: PersonUrl.persons2));
              }, 'Load json #2'),
            ],
          ),
          BlocBuilder<PersonsBloc, FetchResult?>(
            buildWhen: (previousResult, currentResult) => previousResult?.persons != currentResult?.persons,
            builder: (context, fetchResult) {
              final persons = fetchResult?.persons;
              if (persons == null) {
                return const SizedBox.shrink();
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: persons.length,
                  itemBuilder: (context, index) {
                    final person = persons[index];
                    return ListTile(
                      title: Text(person?.name ?? ''),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }

  TextButton _loadJsonButton(BuildContext context, Function onTap, String text) {
    return TextButton(
      onPressed: () {
        context.read<PersonsBloc>().add(const LoadPersonsAction(url: PersonUrl.persons2));
      },
      child: const Text('Load json #2'),
    );
  }
}
