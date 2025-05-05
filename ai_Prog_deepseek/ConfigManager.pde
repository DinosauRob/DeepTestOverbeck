class ConfigManager {
  String CONFIG_FILE = "config.json";
  
  void loadConfig() {
    try {
      JSONObject json = loadJSONObject(CONFIG_FILE);
      progManager.control = json.getJSONArray("control").toIntArray();
    } catch(Exception e) {
      println("Config not found, using defaults");
    }
  }
  
  void saveConfig() {
    JSONObject json = new JSONObject();
    json.setJSONArray("control", new JSONArray().toIntArray(progManager.control));
    saveJSONObject(json, CONFIG_FILE);
  }
}
