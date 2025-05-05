abstract class Page {
  String name;
  ArrayList<UIComponent> components = new ArrayList<UIComponent>();
  
  Page(String name) {
    this.name = name;
  }
  
  void onEnter() {}
  void onExit() {}
  
  void addComponent(UIComponent comp) {
    components.add(comp);
  }
  
  void draw() {
    drawTitle();
    for(UIComponent comp : components) comp.draw();
  }
  
  void drawTitle() {
    fill(255);
    textSize(24);
    textAlign(LEFT, TOP);
    text(name, 20, 20);
  }
}
