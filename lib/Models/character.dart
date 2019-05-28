import './stat_buff.dart';
import './attack.dart';

class Character {
  Character();

  String name = 'New Character';

  int _base_str = 10;
  int _base_dex = 10;
  int _base_con = 10;
  int _base_int = 10;
  int _base_wis = 10;
  int _base_cha = 10;

  int _bab = 0;

  List<StatBuff> buffs = [];
  List<Attack> attacks = [];

  void addBuff(StatBuff newBuff) {
    if(newBuff.ability == null) {
      newBuff.ability = Ability.str;
    }
    buffs.add(newBuff);
  }

  void addAttack(Attack newAttack) {
    attacks.add(newAttack);
  }

  int getTotalStr() {
    int total = _base_str;
    for (int i = 0; i < buffs.length; i++) {
      if (buffs[i].ability == Ability.str) {
        total += buffs[i].buffStat;
      }
    }
    return total;
  }

  int getTotalStrMod() {
    int total = (((getTotalStr() - 10) / 2)).floor();
    for (int i = 0; i < buffs.length; i++) {
      if (buffs[i].ability == Ability.str) {
        total += buffs[i].buffMod;
      }
    }
    return total;
  }

  int getTotalDex() {
    int total = _base_dex;
    for (int i = 0; i < buffs.length; i++) {
      if (buffs[i].ability == Ability.dex) {
        total += buffs[i].buffStat;
      }
    }
    return total;
  }

  int getTotalDexMod() {
    int total = (((getTotalDex() - 10) / 2)).floor();
    for (int i = 0; i < buffs.length; i++) {
      if (buffs[i].ability == Ability.dex) {
        total += buffs[i].buffMod;
      }
    }
    return total;
  }

  int getTotalCon() {
    int total = _base_con;
    for (int i = 0; i < buffs.length; i++) {
      if (buffs[i].ability == Ability.con) {
        total += buffs[i].buffStat;
      }
    }
    return total;
  }

  int getTotalConMod() {
    int total = (((getTotalCon() - 10) / 2)).floor();
    for (int i = 0; i < buffs.length; i++) {
      if (buffs[i].ability == Ability.con) {
        total += buffs[i].buffMod;
      }
    }
    return total;
  }

  int getTotalInt() {
    int total = _base_int;
    for (int i = 0; i < buffs.length; i++) {
      if (buffs[i].ability == Ability.intel) {
        total += buffs[i].buffStat;
      }
    }
    return total;
  }

  int getTotalIntMod() {
    int total = (((getTotalInt() - 10) / 2)).floor();
    for (int i = 0; i < buffs.length; i++) {
      if (buffs[i].ability == Ability.intel) {
        total += buffs[i].buffMod;
      }
    }
    return total;
  }

  int getTotalWis() {
    int total = _base_wis;
    for (int i = 0; i < buffs.length; i++) {
      if (buffs[i].ability == Ability.wis) {
        total += buffs[i].buffStat;
      }
    }
    return total;
  }

  int getTotalWisMod() {
    int total = (((getTotalWis() - 10) / 2)).floor();
    for (int i = 0; i < buffs.length; i++) {
      if (buffs[i].ability == Ability.wis) {
        total += buffs[i].buffMod;
      }
    }
    return total;
  }

  int getTotalCha() {
    int total = _base_cha;
    for (int i = 0; i < buffs.length; i++) {
      if (buffs[i].ability == Ability.cha) {
        total += buffs[i].buffStat;
      }
    }
    return total;
  }

  int getTotalChaMod() {
    int total = (((getTotalCha() - 10) / 2)).floor();
    for (int i = 0; i < buffs.length; i++) {
      if (buffs[i].ability == Ability.cha) {
        total += buffs[i].buffMod;
      }
    }
    return total;
  }

  int getBaseStr() {
    return _base_str;
  }

  int getBaseDex() {
    return _base_dex;
  }

  int getBaseCon() {
    return _base_con;
  }

  int getBaseInt() {
    return _base_int;
  }

  int getBaseWis() {
    return _base_wis;
  }

  int getBaseCha() {
    return _base_cha;
  }

  int getBAB() {
    return _bab;
  }

  int getStrMod() {
    return (((_base_str - 10) / 2)).floor();
  }

  int getDexMod() {
    return (((_base_dex - 10) / 2)).floor();
  }

  int getConMod() {
    return (((_base_con - 10) / 2)).floor();
  }

  int getIntMod() {
    return (((_base_int - 10) / 2)).floor();
  }

  int getWisMod() {
    return (((_base_wis - 10) / 2)).floor();
  }

  int getChaMod() {
    return (((_base_cha - 10) / 2)).floor();
  }

  void setBaseStr(int newStat) {
    _base_str = newStat;
  }

  void setBaseDex(int newStat) {
    _base_dex = newStat;
  }

  void setBaseCon(int newStat) {
    _base_con = newStat;
  }

  void setBaseInt(int newStat) {
    _base_int = newStat;
  }

  void setBaseWis(int newStat) {
    _base_wis = newStat;
  }

  void setBaseCha(int newStat) {
    _base_cha = newStat;
  }

  void setBAB(int newStat) {
    _bab = newStat;
  }
}
