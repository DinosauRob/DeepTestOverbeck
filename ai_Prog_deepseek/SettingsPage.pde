class SettingsPage extends Page {
  int selectedByte = 0;
  int selectedBit = 0;
  String newName = "";
  
  SettingsPage() {
    super("SETTINGS");
    
    for(int i=0; i<4; i++) {
      final int byteIdx = i;
      addComponent(new Button(100 + i*150, 150, "BYTE "+i, str(i+1).charAt(0), () -> {
        selectedByte = byteIdx;
        newName = "";
      }));
    }
  }
  
  void draw() {
    super.draw();
    
    // Editor nome
    if(!newName.isEmpty()) {
      fill(50);
      rect(width/2-100, height-150, 200, 40);
      fill(255);
      text("Nome: "+newName, width/2-90, height-130);
    }
    
    // Grid
    drawByteGrid(selectedByte, 200, 200);
  }
  
  void drawByteGrid(int byteIdx, int x, int y) {
    for(int bit=0; bit<8; bit++) {
      addComponent(new Button(x + 200, y + bit*40, "EDIT", 0, () -> {
        selectedBit = bit;
        newName = progManager.getBitName(selectedByte, bit) != null ? 
                 progManager.getBitName(selectedByte, bit) : "";
      }));
    }
  }
  
  void keyTyped(char key) {
    if(key == BACKSPACE && newName.length() > 0) {
      newName = newName.substring(0, newName.length()-1);
    } else if(key >= 'a' && key <= 'z') {
      newName += key;
    }
    
    if(!newName.isEmpty()) {
      progManager.setBitName(selectedByte, selectedBit, newName);
    }
  }
}
