class Prog {
  String name;
  ArrayList<String> instructions = new ArrayList<String>();

  Prog(String filename) {
    this.name = filename.replace(".prg", "");
    // Implementa il caricamento da file
  }

  void display(int x, int y) {
    fill(255);
    textSize(16);
    textAlign(LEFT, TOP);
    text("Program: "+name, x, y);
  }
}
