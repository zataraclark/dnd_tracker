import './buff.dart';
import './attack.dart';

class Character {
  Character();

  String name = 'New Character';

  int _baseStr = 10;
  int _baseDex = 10;
  int _baseCon = 10;
  int _baseInt = 10;
  int _baseWis = 10;
  int _baseCha = 10;

  int _bab = 0;

  List<Buff> buffs = [];
  List<Attack> attacks = [];

  void addBuff(Buff newBuff) {
    buffs.add(newBuff);
  }

  void addAttack(Attack newAttack) {
    attacks.add(newAttack);
  }

  int getTotalStr() {
    int total = _baseStr;
    for (int i = 0; i < buffs.length; i++) {
      total += buffs[i].strStat;
    }
    return total;
  }

  int getTotalStrMod() {
    int total = (((getTotalStr() - 10) / 2)).floor();
    for (int i = 0; i < buffs.length; i++) {
      total += buffs[i].strMod;
    }
    return total;
  }

  int getTotalDex() {
    int total = _baseDex;
    for (int i = 0; i < buffs.length; i++) {
      total += buffs[i].dexStat;
    }
    return total;
  }

  int getTotalDexMod() {
    int total = (((getTotalDex() - 10) / 2)).floor();
    for (int i = 0; i < buffs.length; i++) {
      total += buffs[i].dexMod;
    }
    return total;
  }

  int getTotalCon() {
    int total = _baseCon;
    for (int i = 0; i < buffs.length; i++) {
      total += buffs[i].conStat;
    }
    return total;
  }

  int getTotalConMod() {
    int total = (((getTotalCon() - 10) / 2)).floor();
    for (int i = 0; i < buffs.length; i++) {
      total += buffs[i].conMod;
    }
    return total;
  }

  int getTotalInt() {
    int total = _baseInt;
    for (int i = 0; i < buffs.length; i++) {
      total += buffs[i].intStat;
    }
    return total;
  }

  int getTotalIntMod() {
    int total = (((getTotalInt() - 10) / 2)).floor();
    for (int i = 0; i < buffs.length; i++) {
      total += buffs[i].intMod;
    }
    return total;
  }

  int getTotalWis() {
    int total = _baseWis;
    for (int i = 0; i < buffs.length; i++) {
      total += buffs[i].wisStat;
    }
    return total;
  }

  int getTotalWisMod() {
    int total = (((getTotalWis() - 10) / 2)).floor();
    for (int i = 0; i < buffs.length; i++) {
      total += buffs[i].wisMod;
    }
    return total;
  }

  int getTotalCha() {
    int total = _baseCha;
    for (int i = 0; i < buffs.length; i++) {
      total += buffs[i].chaStat;
    }
    return total;
  }

  int getTotalChaMod() {
    int total = (((getTotalCha() - 10) / 2)).floor();
    for (int i = 0; i < buffs.length; i++) {
      total += buffs[i].chaMod;
    }
    return total;
  }

  int getTotalAttackBonus() {
    int total = _bab;
    for (int i = 0; i < buffs.length; i++) {
      total += buffs[i].attackBonus;
    }
    return total;
  }

  int getActiveStrMod() {
    int total = (((_baseStr - 10) / 2)).floor();
    for (int i = 0; i < buffs.length; i++) {
      if (buffs[i].active) {
        total += ((buffs[i].strStat / 2)).floor();
        total += buffs[i].strMod;
      }
    }
    return total;
  }

  int getActiveDexMod() {
    int total = (((_baseDex - 10) / 2)).floor();
    for (int i = 0; i < buffs.length; i++) {
      if (buffs[i].active) {
        total += ((buffs[i].dexStat) / 2).floor();
        total += buffs[i].dexMod;
      }
    }
    return total;
  }

  int getActiveConMod() {
    int total = (((_baseCon - 10) / 2)).floor();
    for (int i = 0; i < buffs.length; i++) {
      if (buffs[i].active) {
        total += ((buffs[i].conStat) / 2).floor();
        total += buffs[i].conMod;
      }
    }
    return total;
  }

  int getActiveIntMod() {
    int total = (((_baseInt - 10) / 2)).floor();
    for (int i = 0; i < buffs.length; i++) {
      if (buffs[i].active) {
        total += ((buffs[i].intStat) / 2).floor();
        total += buffs[i].intMod;
      }
    }
    return total;
  }

  int getActiveWisMod() {
    int total = (((_baseWis - 10) / 2)).floor();
    for (int i = 0; i < buffs.length; i++) {
      if (buffs[i].active) {
        total += ((buffs[i].wisStat) / 2).floor();
        total += buffs[i].wisMod;
      }
    }
    return total;
  }

  int getActiveChaMod() {
    int total = (((_baseCha - 10) / 2)).floor();
    for (int i = 0; i < buffs.length; i++) {
      if (buffs[i].active) {
        total += ((buffs[i].chaStat) / 2).floor();
        total += buffs[i].chaMod;
      }
    }
    return total;
  }

  int getActiveAttackBonus() {
    int total = _bab;
    for (int i = 0; i < buffs.length; i++) {
      if (buffs[i].active) {
        total += buffs[i].attackBonus;
      }
    }
    return total;
  }

  int getBaseStr() {
    return _baseStr;
  }

  int getBaseDex() {
    return _baseDex;
  }

  int getBaseCon() {
    return _baseCon;
  }

  int getBaseInt() {
    return _baseInt;
  }

  int getBaseWis() {
    return _baseWis;
  }

  int getBaseCha() {
    return _baseCha;
  }

  int getBAB() {
    return _bab;
  }

  int getStrMod() {
    return (((_baseStr - 10) / 2)).floor();
  }

  int getDexMod() {
    return (((_baseDex - 10) / 2)).floor();
  }

  int getConMod() {
    return (((_baseCon - 10) / 2)).floor();
  }

  int getIntMod() {
    return (((_baseInt - 10) / 2)).floor();
  }

  int getWisMod() {
    return (((_baseWis - 10) / 2)).floor();
  }

  int getChaMod() {
    return (((_baseCha - 10) / 2)).floor();
  }

  void setBaseStr(int newStat) {
    _baseStr = newStat;
  }

  void setBaseDex(int newStat) {
    _baseDex = newStat;
  }

  void setBaseCon(int newStat) {
    _baseCon = newStat;
  }

  void setBaseInt(int newStat) {
    _baseInt = newStat;
  }

  void setBaseWis(int newStat) {
    _baseWis = newStat;
  }

  void setBaseCha(int newStat) {
    _baseCha = newStat;
  }

  void setBAB(int newStat) {
    _bab = newStat;
  }
}
