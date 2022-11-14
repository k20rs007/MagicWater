Charactermove c1 = new Charactermove();
Charactermove c2 = new Charactermove();

void charactersetup() {
  ownImage=loadImage("game_sister1.png");
  ownImage.resize(ownImage.width/2, ownImage.height/2);
  enemyImage=loadImage("game_setumeitekikai1.png");
  enemyImage.resize(enemyImage.width/2, enemyImage.height/2);
  ownImage1=loadImage("game_sister1.png");
  ownImage1.resize(ownImage1.width/2, ownImage1.height/2);
  ownImage2=loadImage("game_sister2.png");
  ownImage2.resize(ownImage2.width/2, ownImage2.height/2);
  ownImage3=loadImage("game_sister3.png");
  ownImage3.resize(ownImage3.width/2, ownImage3.height/2);
  enemyImage1=loadImage("game_setumeitekikai1.png");
  enemyImage1.resize(enemyImage1.width/2, enemyImage1.height/2);
  enemyImage2=loadImage("game_setumeitekikai2.png");
  enemyImage2.resize(enemyImage2.width/2, enemyImage2.height/2);
  enemyImage3=loadImage("game_setumeitekikai3.png");
  enemyImage3.resize(enemyImage3.width/2, enemyImage3.height/2);

  c1.setCharactermove(100, 240, 80, 50, 200, 150);
  c2.setCharactermove(950, 240, 880, 50, 180, 150);
}

class Charactermove {
  float characterx, charactery;
  float minX, maxX, minY, maxY;
  float xnoise = random(1);
  float ynoise = random(1);
  float addNoise = 0.00455;

  void setCharactermove(float characterx, float charactery, float minX, float maxX, float minY, float maxY) {
    this.characterx = characterx; 
    this.charactery = charactery;
    this.minX = minX;
    this.maxX = maxX;
    this.minY = minY;
    this.maxY = maxY;
  }

  void printCharacter(PImage image, float characterx, float charactery) {
    characterx = noise(xnoise) * maxX + minX;
    charactery = noise(ynoise) * maxY + minY;
    image(image, characterx, charactery);
    xnoise += addNoise;
    ynoise += addNoise;
  }
}

float scoreB = 0;

int characterchangecount=0;
int kirifudacharacterchangecount=0;
void characterChange() {
  
  if(score>scoreB){
    characterchangecount=100;   //<>//
  }
  if(characterchangecount>0){
    characterchangecount--; //<>//
    ownImage=ownImage3;
    enemyImage=enemyImage2;    
  } else {
    ownImage=ownImage1;
    enemyImage=enemyImage1;
  }
  
  if(hp<=bhp*0.2){
    kirifudacharacterchangecount=200;
  }
  if(kirifudacharacterchangecount>0){
    kirifudacharacterchangecount--;
    ownImage=ownImage2;
    enemyImage=enemyImage3;    
  } 
  
  scoreB = score;
  
}
