class PageManager {
  HashMap<String, Page> pages = new HashMap<String, Page>();
  Page currentPage;
  
  void addPage(Page page) {
    pages.put(page.name, page);
  }
  
  void setCurrentPage(String pageName) {
    Page p = pages.get(pageName);
    if(p != null) {
      if(currentPage != null) currentPage.onExit();
      currentPage = p;
      currentPage.onEnter();
    }
  }
  
  void drawCurrentPage() {
    if(currentPage != null) currentPage.draw();
  }
  
  void handleKeyTyped(char key) {
    if(currentPage instanceof SettingsPage) {
      ((SettingsPage)currentPage).keyTyped(key);
    }
  }
}
