class Letter_state{
  final List<String> letters;
  final String selectedLetter;

  const Letter_state(this.letters, this.selectedLetter);

  List<String> getLettersWithoutSelected(){
    return letters.where((element) => element != selectedLetter).toList(); 
  }

  Letter_state copyWith({
    List<String>? letters,
    String? selectedLetter,
  }) => Letter_state(
    letters ?? this.letters,
    selectedLetter ?? this.selectedLetter,
  );

}
