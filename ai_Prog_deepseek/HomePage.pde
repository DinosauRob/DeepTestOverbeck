class HomePage extends Page {
  HomePage() {
    super("HOME");
    
    String[] pages = {"CONTROL_VIEW", "SETTINGS", "DEBUG"};
    for(int i=0; i<pages.length; i++) {
      final String pageName = pages[i];
      addComponent(new Button(100 + i*200, height-100, pageName, str(i+1).charAt(0), () -> {
        pageManager.setCurrentPage(pageName);
      }));
    }
  }
  
  void draw() {
    super.draw();
    fill(255);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("SYSTEM CONTROL PANEL", width/2, 200);
  }
}
