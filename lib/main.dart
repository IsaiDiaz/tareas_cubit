import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareas_cubit/bloc/letters_state.dart';
import 'package:tareas_cubit/pages/edit_letter_page.dart';
import 'bloc/letters_cubit.dart';
import 'pages/add_letter_page.dart';

void main() {
  runApp(BlocProvider(
    create: (BuildContext context) => LetterArrayCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cubit first project'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Letters:'),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<LetterArrayCubit, Letter_state>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                        value: state.selectedLetter,
                        items: state.letters.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          BlocProvider.of<LetterArrayCubit>(context)
                              .setSelectedLetter(value!);
                        }
                    ),
                    Container(
                      width: 20,
                    ),
                    Text('Selected: ${state.selectedLetter == '' ? 'None' : state.selectedLetter}')
                  ],
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => addLetterPage()));
              },
              child: Text('Add letter'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<LetterArrayCubit>(context).removeExistentLetter(
                    BlocProvider.of<LetterArrayCubit>(context)
                        .state
                        .selectedLetter);
              },
              child: Text('Remove letter'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => editLetterPage(
                            letter: BlocProvider.of<LetterArrayCubit>(context)
                                .state
                                .selectedLetter)));
              },
              child: Text('Edit letter'),
            ),
          ],
        )));
  }
}
