
class Buff {
  Buff();

  String buffName = "New Buff";
  int strStat = 0;
  int strMod = 0;
  int dexStat = 0;
  int dexMod = 0;
  int conStat = 0;
  int conMod = 0;
  int intStat = 0;
  int intMod = 0;
  int wisStat = 0;
  int wisMod = 0;
  int chaStat = 0;
  int chaMod = 0;
  int attackBonus = 0;

  void setStrStat(int newStat) {
    strStat = newStat;
  }

  void setStrMod(int newMod) {
    strMod = newMod;
  }

  void setDexStat(int newStat) {
    dexStat = newStat;
  }

  void setDexMod(int newMod) {
    dexMod = newMod;
  }

  void setConStat(int newStat) {
    conStat = newStat;
  }

  void setConMod(int newMod) {
    conMod = newMod;
  }

  void setIntStat(int newStat) {
    intStat = newStat;
  }

  void setIntMod(int newMod) {
    intMod = newMod;
  }

  void setWisStat(int newStat) {
    wisStat = newStat;
  }

  void setWisMod(int newMod) {
    wisMod = newMod;
  }

  void setChaStat(int newStat) {
    chaStat = newStat;
  }

  void setChaMod(int newMod) {
    chaMod = newMod;
  }

  void setAttackBonus(int newBonus) {
    attackBonus = newBonus;
  }



  int getStrStat() {
    return strStat;
  }

  int getStrMod() {
    return strMod;
  }

  int getDexStat() {
    return dexStat;
  }

  int getDexMod() {
    return dexMod;
  }

  int getConStat() {
    return conStat;
  }

  int getConMod() {
    return conMod;
  }

  int getIntStat() {
    return intStat;
  }

  int getIntMod() {
    return intMod;
  }

  int getWisStat() {
    return wisStat;
  }

  int getWisMod() {
    return wisMod;
  }

  int getChaStat() {
    return chaStat;
  }

  int getChaMod() {
    return chaMod;
  }

  int getAttackBonus() {
    return attackBonus;
  }
}
