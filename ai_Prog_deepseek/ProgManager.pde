class ProgManager {
  volatile byte[] control = new byte[16];
  String[][] bitNames = new String[16][8];
  ArrayList<Prog> programs = new ArrayList<Prog>();
  Prog currentProg;
  
  ProgManager() {
    initDefaultNames();
  }
  
  void initDefaultNames() {
    for(int i=0; i<8; i++) {
      bitNames[3][i] = "L"+(i+1);
    }
  }
  
  void loadProg(String filename) {
    currentProg = new Prog(filename);
    programs.add(currentProg);
  }
  
  String getBitName(int byteIdx, int bit) {
    return (byteIdx >=0 && byteIdx <16 && bit >=0 && bit <8) ? bitNames[byteIdx][bit] : null;
  }
  
  void setBitName(int byteIdx, int bit, String name) {
    if(byteIdx >=0 && byteIdx <16 && bit >=0 && bit <8) {
      bitNames[byteIdx][bit] = name;
    }
  }
}
