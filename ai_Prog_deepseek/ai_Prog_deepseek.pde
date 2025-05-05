// MAIN CONTROLLER
ProgManager progManager;
PageManager pageManager;
ConfigManager configManager;
InputManager inputManager;
int debugCounter = 0;

void setup() {
  size(1200, 800);
  surface.setTitle("Control System v3.0");
  
  // Initialize managers
  progManager = new ProgManager();
  pageManager = new PageManager();
  configManager = new ConfigManager();
  inputManager = new InputManager();
  
  // Setup pages
  pageManager.addPage(new HomePage());
  pageManager.addPage(new ControlViewPage());
  pageManager.addPage(new CompactControlPage());
  pageManager.addPage(new DebugPage());
  pageManager.addPage(new ProgPage());
  pageManager.addPage(new SettingsPage());
  
  // Load configuration
  configManager.loadConfig();
  
  // Load sample program
  progManager.loadProg("default.prg");
  
  // Set initial page
  pageManager.setCurrentPage("HOME");
}

void draw() {
  background(20);
  pageManager.drawCurrentPage();
}

void keyPressed() {
  inputManager.handleKeyPress(key, keyCode);
}

void keyTyped() {
  pageManager.handleKeyTyped(key);
}

void exit() {
  configManager.saveConfig();
  super.exit();
}
