public class XWing{
// Attributes - define variables
String name; Integer protonTorpedoes; Integer deathStarsDestroyed; Decimal powerRemaining;
User pilot; Account manufacturer;
//LaserCannon lasers; HyperdriveEngine engine; DeflectorShield shield; AstromechDroid droid;

// Create constructors
public XWing(String nickname, User myUser){
name = nickname; protonTorpedoes = 2; deathStarsDestroyed = 0; powerRemaining = 1.00; pilot = myUser;

}
public void shootLasers(Integer numberOfShots){
for (Integer i = 0; i < numberOfShots; i++){
System.debug('PEW!');
}

}
public Boolean initiateHyperdrive(){
Boolean isSuccess = false;
if(powerRemaining > 0.10){
System.debug('Zoom zoom, WEEEEE!');
powerRemaining = powerRemaining - 0.10;
isSuccess = True;

}
return isSuccess;
}
public void fireProtonTorpedo(){
if(protonTorpedoes > 0){
System.debug('KABOOM!!!!!!');
protonTorpedoes--; deathStarsDestroyed ++;
Boolean X = initiateHyperdrive();
System.debug(X);
}
}

public  integer minFunction(integer n1, integer n2) {
      integer min;
      if (n1 > n2)
         min = n2;
      else
         min = n1;

      return min; 
}}