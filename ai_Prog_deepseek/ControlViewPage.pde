class ControlViewPage extends Page {
  ControlViewPage() {
    super("CONTROL_VIEW");
    
    addComponent(new Button(width*0.2, height-80, "HOME", 'H', () -> pageManager.setCurrentPage("HOME")));
  }
  
  void draw() {
    super.draw();
    
    int startX = 50, startY = 100;
    int boxSize = 30, spacing = 40;
    
    for(int byteIdx=0; byteIdx<4; byteIdx++) {
      fill(255);
      text("Byte "+byteIdx+":", startX, startY-20 + (byteIdx*120));
      
      for(int bit=0; bit<8; bit++) {
        int y = startY + (byteIdx*120) + (bit*(boxSize+5));
        boolean state = ((progManager.control[byteIdx]>>bit & 1) == 1;
        
        fill(state ? #00FF00 : #444444);
        rect(startX, y, boxSize, boxSize);
        
        fill(255);
        textAlign(LEFT, CENTER);
        String name = progManager.getBitName(byteIdx, bit);
        text(name != null ? name : "Bit "+bit, startX+boxSize+10, y+boxSize/2);
      }
    }
  }
}
