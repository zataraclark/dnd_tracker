enum Ability { str, dex, con, intel, wis, cha }

class StatBuff {
  StatBuff(this.buffName, this.buffStat, this.buffMod, this.ability) {
    if (buffMod == null) {
      buffMod = 0;
    }
    if (buffStat == null) {
      buffStat = 0;
    }
  }

  String buffName = "";
  int buffStat = 0;
  int buffMod = 0;
  var ability = Ability.str;
}
