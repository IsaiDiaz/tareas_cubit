import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/letters_cubit.dart';

class addLetterPage extends StatelessWidget{
  final addLetterController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Add letter'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: addLetterController,
                decoration: InputDecoration(
                  hintText: 'Enter a letter',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){
                  BlocProvider.of<LetterArrayCubit>(context).addLetter(addLetterController.text);
                  Navigator.pop(context);
                },
                child: Text('Add letter'),
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