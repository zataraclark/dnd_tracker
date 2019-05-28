import 'character.dart';

class Attack {
  Attack(this._character, this.attack_name, this.str_mod, this.dex_mod, this.misc_mod) {
  }

  Character _character;
  String attack_name = "";
  bool str_mod = true;
  bool dex_mod = false;

  int misc_mod = 0;

  int getAttackMod() {
    int total = _character.getBAB() + misc_mod;
    if(str_mod) {
      total += _character.getTotalStrMod();
    }
    if(dex_mod) {
      total += _character.getTotalDexMod();
    }
    return total;
  }
}