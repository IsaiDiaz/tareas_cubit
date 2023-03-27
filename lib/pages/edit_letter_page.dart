import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/letters_cubit.dart';

class editLetterPage extends StatelessWidget{
  
  final String letter;

  editLetterPage({Key? key, required this.letter}) : super(key: key);

  final editLetterController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit letter'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: editLetterController,
                decoration: InputDecoration(
                  hintText: 'Enter a new letter for $letter',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){
                  BlocProvider.of<LetterArrayCubit>(context).updateLetter(letter, editLetterController.text);
                  Navigator.pop(context);
                },
                child: Text('Edit letter'),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                //Cambiar el fondo del boton a color rojo
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red), 
                  ),
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
            ],
          ) 
        ),
    );
  }
}