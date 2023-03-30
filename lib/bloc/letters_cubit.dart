import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareas_cubit/bloc/letters_state.dart';

class LetterArrayCubit extends Cubit<Letter_state>{
  LetterArrayCubit() : super(Letter_state([], ''));

  void setSelectedLetter(String selectedLetter){
    emit(state.copyWith(selectedLetter: selectedLetter));
  }

  void addLetter(String letter) {
    List<String> newLetters = List<String>.from(state.letters)..add(letter);
    emit(state.copyWith(letters: newLetters, selectedLetter: letter));
  }

  void removeExistentLetter(String letter) {
    List<String> newLetters = List<String>.from(state.letters)..remove(letter);
    emit(state.copyWith(letters: newLetters, selectedLetter: newLetters.isEmpty ? '':newLetters.first));
  }

  void updateLetter(String oldLetter, String newLetter){
    List<String> newLetters = List<String>.from(state.letters)..remove(oldLetter)..add(newLetter);
    emit(state.copyWith(letters: newLetters, selectedLetter: newLetter));
  }
}