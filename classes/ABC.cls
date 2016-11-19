public class ABC {
public static String describeRank(String rank){
String description;
if (rank == 'Initiate') {
description = 'Jedi Hopeful';
} else if (rank == 'Padawan' ) {
description = 'Apprentice of Jedi Knight';
} else if (rank == 'Knight' ) {
description = 'Completed the Jedi Trials';
} else if (rank == 'Master') {
description = 'David Liu';
}

return description;
}
public static String getJediCode() {
    String code  = 'There is no emotion, there is peace.';
           code += 'There is no ignorance, there is knowledge.';
           code += 'There is no passion, there is serenity.';
           code += 'There is no death, there is the Force.';
    return code;
  }
  public string ReturnMaster (String grade){
  String clas;
  if(grade == 'Yes') {
  clas = 'This is not a static method';
  }
  return clas;
  }
}