import './character.dart';

class Attack {
  Attack(this.character);

  Character character;
  String name = "New Attack";
  bool bab = true;
  bool strMod = true;
  bool dexMod = false;
  bool conMod = false;
  bool intMod = false;
  bool wisMod = false;
  bool chaMod = false;

  int miscMod = 0;

  bool getBAB() {
    return bab;
  }
  bool getStrMod() {
    return strMod;
  }
  bool getDexMod() {
    return dexMod;
  }
  bool getConMod() {
    return conMod;
  }
  bool getIntMod() {
    return intMod;
  }
  bool getWisMod() {
    return wisMod;
  }
  bool getChaMod() {
    return chaMod;
  }
  int getMiscMod() {
    return miscMod;
  }

  int getTotalBonus() {
    int total = miscMod;
    total += bab ? character.getTotalAttackBonus() : 0;
    total += strMod ? character.getTotalStrMod() : 0;
    total += dexMod ? character.getTotalDexMod() : 0;
    total += conMod ? character.getTotalConMod() : 0;
    total += intMod ? character.getTotalIntMod() : 0;
    total += wisMod ? character.getTotalWisMod() : 0;
    total += chaMod ? character.getTotalChaMod() : 0;
    return total;
  }

  int getActiveBonus() {
    int total = miscMod;
    total += bab ? character.getActiveAttackBonus(): 0;
    total += strMod ? character.getActiveStrMod() : 0;
    total += dexMod ? character.getActiveDexMod() : 0;
    total += conMod ? character.getActiveConMod() : 0;
    total += intMod ? character.getActiveIntMod() : 0;
    total += wisMod ? character.getActiveWisMod() : 0;
    total += chaMod ? character.getActiveChaMod() : 0;
    return total;
  }

  void setBAB(bool newBAB) {
    bab = newBAB;
  }
  void setStrMod(bool newMod) {
    strMod = newMod;
  }
  void setDexMod(bool newMod) {
    dexMod = newMod;
  }
  void setConMod(bool newMod) {
    conMod = newMod;
  }
  void setIntMod(bool newMod) {
    intMod = newMod;
  }
  void setWisMod(bool newMod) {
    wisMod = newMod;
  }
  void setChaMod( bool newMod) {
    chaMod = newMod;
  }
  void setMiscMod(int newMod) {
    miscMod = newMod;
  }
}