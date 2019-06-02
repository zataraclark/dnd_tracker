import '../Models/buff.dart';

List<Buff> misc_buffs = [
  Buff.attackBonus("Flanking", 4, false),
  Buff.attackBonus("Partial Cover", -2, false),
  Buff.attackBonus("3/4 Cover", -4, false),
];

int getMiscMod() {
  int total = 0;
  for(int i = 0; i < misc_buffs.length; i++) {
    total += misc_buffs[i].active ? misc_buffs[i].getTotalMod() : 0;
  }
  return total;
}