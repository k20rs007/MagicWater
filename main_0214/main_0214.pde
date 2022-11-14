import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


//import controlP5.*;

//ControlP5 Button;

PImage akaImage, aoImage, kiImage, midoriImage, mizuiroImage, murasakiImage, pinkuImage, 
  maxHpImage, enemyImage, backImage, fieldImage, titleImg, select,ownImage, ownImage1, ownImage2, ownImage3,
  bn, bt, bc, start, start2, b21, b22,b23, gameOver, hukidashi, hukidashi1, hukidashi2, hukidashi3, opt, chr, sldber, back, timeImage, 
  time2Image, timehaikeiImage, hp1Image, hp6Image, hp16Image, kiri190, kiri195, kiri1100, 
  kiri290, kiri295, kiri2100, kirifuda1, kirifuda2, kirifuda3, kirifuda4, gameClear,ema,sara,lilly,emily,getDispImage,
  hpbackImage, enemyImage1, enemyImage2, enemyImage3,effect1, effect2, effect3, effect4, effect5;;


Minim minim = new Minim(this);
AudioPlayer musicdrip2;
AudioPlayer musicbgm;
AudioPlayer musictime;
AudioPlayer musickiri;
AudioPlayer musictitle;
AudioPlayer musicwin;
AudioPlayer musiclose;
AudioPlayer musicbgm2;
AudioPlayer musictitlestart;
AudioPlayer musicfall;
int gameCount = 0;
float starttm = 0.0;
int scene = 0;
int pause = 0;
int c = 0;
int base[][]=new int[21][12]; //実際にミノが生成されるメインの配列,0で何も無い状態、1が動かせるミノ、2が壁、地面、下に落ちて固定されたミノを表す
int jun1[]=new int[7];//ミノの順番を格納する配列
int jun2[]=new int[7];//jun2と同じ役割
int jn1=7, jn2=7; //jun1[]とjun2[]に格納される数の種類を定義
//int time; //ミノが一定時間で1ブロックずつ降りてくる時間を管理する変数
int side = 30; //ミノの一ブロックの縦横のサイズ
int x=0, y=0; //ミノの位置
int mScene;//画面遷移前の変数sceneを記憶
int level = 0;//ゲームのステージクリア数
boolean hold2=false; //未だホールドをしていない場合にfalseとなる
boolean hold3=false;//1度ホールドを使うとtrueになり何度もホールドを使う事防ぐ
float score;//スコア
float bhp=15, hp;//bhpはHPの最大値、hpは実際のHPを表す
//boolean drop=false;//動かせるミノがある時はtrue、無い時はtrueを表す
boolean bgm = true;
boolean title = true;
boolean title2 = false;
boolean win = true;
boolean lose = true;
boolean bgm2 = true;
boolean titlestart = true;
Mino current =new Mino();//動かせるミノの生成
Hold holds= new Hold();//ホールドに表示させるミノの生成
Next next1=new Next();//ネクストに表示させるミノの生成
Next next2=new Next();//ネクストに表示させるミノの生成
Next next3=new Next();//ネクストに表示させるミノの生成
Next next4=new Next();//ネクストに表示させるミノの生成
Ice ice = new Ice();


int timeLimit = 180;
int countDown;

int vanishCount = 0;
int kirishoukyo = 0;
Button person[] = new Button[4];

void setup() {
  frameRate(60);
  size(1280, 720);
  PFont font = createFont("Meiryo", 50);
  textFont(font);
  musicdrip2 = minim.loadFile("drip2.mp3");
  musicbgm = minim.loadFile("battleBGM.mp3");
  musictime = minim.loadFile("time.mp3");
  musickiri = minim.loadFile("kiri.mp3");
  musictitle = minim.loadFile("title.mp3");
  musicwin = minim.loadFile("win.mp3");
  musiclose = minim.loadFile("lose.mp3");
  musicbgm2 = minim.loadFile("bgm2.mp3");
  musicfall = minim.loadFile("fall.mp3");
  musictitlestart = minim.loadFile("titlestart.mp3");
  gameClear = loadImage("gameClear.jpg");
  akaImage=loadImage("aka.png");
  akaImage.resize(side, side);
  aoImage=loadImage("ao.png");
  aoImage.resize(side, side);
  kiImage=loadImage("ki.png");
  kiImage.resize(side, side);
  midoriImage=loadImage("midori.png");
  midoriImage.resize(side, side);
  mizuiroImage=loadImage("mizuiro.png");
  mizuiroImage.resize(side, side);
  murasakiImage=loadImage("murasaki.png");
  murasakiImage.resize(side, side);
  pinkuImage=loadImage("pinku.png");
  pinkuImage.resize(side, side);
  backImage=loadImage("haikei.png");
  backImage.resize(width, height);
  fieldImage=loadImage("field.png");
  fieldImage.resize(300, 600);
  enemyImage=loadImage("lilly.png");
  ownImage=loadImage("emily.png");
  getDispImage = ownImage.get(50,0,180,200);
  titleImg = loadImage("title.jpg");
  titleImg.resize(width, height);
  select = loadImage("select.png");
  titleImg.resize(width, height);

  bn = loadImage("buttona.png");
  bt = loadImage("buttonb.png");

  bn.resize(140, 70);
  bt.resize(140, 70);

  start = loadImage("start.png");
  start2 = loadImage("start2.png");

  start.resize(400, 80);
  start2.resize(400, 80);

  b21 = loadImage("ao.png");
  b22 = loadImage("aka.png");
  b23 = loadImage("kuro.png");

  gameOver = loadImage("gameover.jpg");
  hukidashi = loadImage("hukidashi.png");
  hukidashi1 = loadImage("hukidashi1.png");
  hukidashi2 = loadImage("hukidashi2.png");
  hukidashi3 = loadImage("hukidashi3.png");


  opt = loadImage("opt.png");
  chr = loadImage("chr.png");

  opt.resize(110, 100);
  chr.resize(110, 100);

  sldber = loadImage("option.png");
  back = loadImage("back.png");

  sldber.resize(width, height + 100);
  back.resize(110, 100);

  timeImage = loadImage("time.png");
  timeImage.resize(50, 50);
  time2Image = loadImage("time2.png");
  time2Image.resize(50, 50);
  timehaikeiImage = loadImage("timehaikei.png");
  hpbackImage = loadImage("hpback.png");
  hp1Image = loadImage("hp1.png");
  hp1Image.resize(50, 50);
  hp6Image = loadImage("hp6.png");
  hp6Image.resize(50, 50);
  hp16Image = loadImage("hp16.png");
  hp16Image.resize(50, 50);
  sara = loadImage("sara.png");
  ema = loadImage("ema.png");
  emily = loadImage("emily.png");
  lilly = loadImage("lilly.png");
  kirisetup();

  k1.setKiri(0, 0, 350, 370, 60, 600);
  k2.setKiri(0, 0, 350, 370, 60, 600);
  k3.setKiri(0, 0, 350, 370, 60, 600);
  k4.setKiri(0, 0, 350, 370, 60, 600);
  k5.setKiri(0, 0, 350, 370, 60, 600);
  k6.setKiri(0, 0, 350, 370, 60, 600);
  k7.setKiri(0, 0, 350, 370, 60, 600);
  k8.setKiri(0, 0, 350, 370, 60, 600);
  k9.setKiri(0, 0, 350, 370, 60, 600);
  k10.setKiri(0, 0, 350, 370, 60, 600);
  k11.setKiri(0, 0, 350, 370, 60, 600);
  k12.setKiri(0, 0, 350, 370, 60, 600);
  k13.setKiri(0, 0, 350, 370, 60, 600);
  k14.setKiri(0, 0, 350, 370, 60, 600);
  k15.setKiri(0, 0, 350, 370, 60, 600);
  k16.setKiri(0, 0, 350, 370, 60, 600);
  k17.setKiri(0, 0, 350, 370, 60, 600);
  k18.setKiri(0, 0, 350, 370, 60, 600);
  k19.setKiri(0, 0, 760, 30, 30, 0); //kirifuda
  k20.setKiri(0, 0, 760, 30, 90, 70); //kirifuda
  k21.setKiri(0, 0, 760, 30, 190, 40); //kirifuda
  k22.setKiri(0, 0, 760, 30, 270, 60); //kirifuda
  charactersetup();
  effectsetup();
  Button p1 = new Button(25, 100, 325, 500, emily, "Emily");
  PImage sara2 = loadImage("game_setumeitekikai1.png");
  sara2.resize(sara2.width/3 + 50, sara2.height/3 + 50);
  Button p2 = new Button(325, 100, 625, 500, sara2, "Sara");
  PImage lilly2 = loadImage("lilly.png");
  lilly2.resize(lilly2.width/3 + 50, lilly2.height/3 + 50);
  Button p3 = new Button(655, 100, 955, 500, lilly2, "Lilly");
  PImage ema2 = loadImage("ema.png");
  ema2.resize(ema2.width/3 + 50, ema2.height/3 + 50);
  Button p4 = new Button(955, 100, 1255, 500, ema2, "Ema");

  person[0] = p1;
  person[1] = p2;
  person[2] = p3;
  person[3] = p4;

  score=0;
  bhp=15;
  hp=bhp;
  for (int i=0; i<base.length; i++) {
    for (int j=0; j<base[j].length; j++) {
      if (i==20||j==0||j==11) {
        base[i][j]=2;
      } else {
        base[i][j]=0;
      }
    }
  }
  image(backImage, 0, 0);

}

/*void buttonSetup() {
 Button = new ControlP5(this);
 Button.addButton("startGame")
 .setLabel("game start")
 .setPosition(width/2 - 100, height/2 - 20)
 .setSize(200, 40);
 
 Button.addButton("exit")
 .setLabel("exit")
 .setPosition(width/2 - 100, height/2 + 40)
 .setSize(200, 40);
 } */


void gameSetup() {
  current.drop = false;
  score=0;
  starttm = 0;
  bhp=15;
  hp=bhp;
  for (int i=0; i<base.length; i++) {
    for (int j=0; j<base[j].length; j++) {
      if (i==20||j==0||j==11) {
        base[i][j]=2;
      } else {
        base[i][j]=0;
      }
    }
  }
}

void pause() {
  if (scene == 1) {
    if (key == 'q' && pause == 0) {
      pause = 1;
      fill(0);
      textSize(40);
      text("PAUSE", width/2, height/2);
      noLoop();
    } else if (key == 'q' && pause == 1) {
      pause = 0;
      loop();
    }
  }
}

void draw() {
  println("score" + score);
  println("vanish" + vanishCount);
  int mScene = 0;//画面遷移前の変数sceneを記憶
  if (mousePressed) {
    mScene = scene;
  }
  if (keyPressed == true && key == 'q') {
    scene = mScene;
  }
  switch(scene) {
  case 0:
    title();
    break;
  case 1:
    gameStart();
    break;
  case 2:
    option();
    break;
  case 3:
    gameOver();
    break;
  case 4:
    map1();
    break;
  case 5:
    gameClear();
    break;
  case 6:
    story();
    break;
  case 7:
    charaSelect();
    break;
  default:
    break;
  }
}
//scene = 0
void title() {  
  image(titleImg, 0, 0);
  fill(0);
  textSize(30);
  starttm = millis()/1000;
  startButton();
  exitButton();
  optButton();
  if (title == true) {
    musictitle.setGain(20);
    musictitle.loop();
    title = false;
  }
}

//scene = 1
void gameStart() {
  if(starttm == 0 ){
    starttm = millis()/1000;  
  }
  if(mousePressed) {
    score++;
  }
  image(backImage, 0, 0);
  image(fieldImage, 490, 60);
  //println("x:"+x+"y:"+y);
  if (scene == 1) {
    musictitle.close();
        musictitle = minim.loadFile("title.mp3");
  
  }
  if (bgm == true) {
    musicbgm.setGain(0);
    musicbgm.loop();
    bgm = false;
  }
  lose = true;
  win = true;
  image(backImage, 0, 0);
  image(fieldImage, 490, 60);
  time();
  hp();
  //ブロック生成座標が2（青色）の時ゲームオーバー
  if (base[1][4]==2) {
    println("GAME OVER");
    scene=3;
  }
  characterChange();
  c1.printCharacter(ownImage, 100, 240);
  c2.printCharacter(enemyImage, 950, 240);
  //操作可能ブロックの生成と落下処理
  if (current.drop==false) {
    junjun();
    if (jun==true) {
      current.block=jun1[jn1];
      jn1++;
      //print("1:");
    } else {
      current.block=jun2[jn2];
      jn2++;
      //print("2:");
    }
    x=5;
    y=1;
    current.minono(current.block, x, y, base);
    //println(current.block);
    current.drop =true;
    hold3=false;
  }
  ice.ice();
  current.time++;
  current.sizenrakka();
  //HPはbhp(初期HP)-score
  hp=(bhp-score);
  retusorou(base);
  current.setcolor(base);
  holds.hold();
  nyuryoku();
  next1.next();
  //面の描画
  /*for (int i=0; i<base.length; i++) {  
   for (int j=1; j<base[j].length-1; j++) {
   if (base[i][j]==0) {
   fill(255);
   rect(j*side-(side-490), i*side+(60), side, side);
   }
   }
   }
   */
  gameCount++;
  effect();
  for (int i=0; i<base.length; i++) {  
    for (int j=0; j<base[i].length; j++) {
      print(base[i][j]);
    }
    println();
  }
  println();
  //println("time:" );
  fill(0);
  if (gameCount > 300&&score<1) {
    kiriDraw();
  }
  //霧が発動したときの音
  if (gameCount == 300 && scene == 1) {
    musickiri.setGain(20);
    musickiri.loop();
  }
  //ステージが変わったら音を止める
  int ms = millis()/1000;
  println(ms);
  countDown = timeLimit - ms;
  if (countDown==0) {
    scene = 3;
  }
  if (hp <= bhp*0.2) {
    musicbgm.close();
    musicbgm = minim.loadFile("battleBGM.mp3");
    if (bgm2 == true) {
      musicbgm2.setGain(10);
      musicbgm2.loop();
      bgm2 = false;
    }
    k19.kirifuda(kirifuda1, 0, 0);
    k20.kirifuda(kirifuda2, 0, 0);
    k21.kirifuda(kirifuda3, 0, 0);
    k22.kirifuda(kirifuda4, 0, 0);
  }
  if(scene != 1) {
    musicbgm2.close();
    musicbgm2 = minim.loadFile("bgm2.mp3");
  }
}

//scene = 2
void option() {
  background(255);
  image(sldber, 0, 0);
}

//scene = 3
void gameOver() {
  image(gameOver, 0, 0);
  continueButton();
  menuButton();
  musickiri.close();
  musickiri = minim.loadFile("kiri.mp3");
  musicbgm.close();
  musicbgm = minim.loadFile("battleBGM.mp3");
  if (lose == true) {
    musiclose.setGain(0);
    musiclose.loop();
    lose = false;
  }
}

//scene = 4
void map1() {
  background(255);
  image(select, 0, 0);
  textAlign(CENTER);
  fill(255);
  //dispCharacter();
  selChr();
  stage1();
  stage2();
  stage3();
  win = true;
  lose = true;
  if(titlestart == true){
    musictitlestart.setGain(30);
    musictitlestart.play(0);
    titlestart = false;
  }
   if (title2 == true) {
    musictitle.setGain(20);
    
    musictitle.loop();
    title2 = false;
  }
}

//scene = 5
void gameClear() { 
  musickiri.close();
  musickiri = minim.loadFile("kiri.mp3");
  musicbgm.close();
  musicbgm = minim.loadFile("battleBGM.mp3");
  if (win == true) {
    musicwin.setGain(0);
    musicwin.loop();
    win = false;
    level ++;
  }
  
  image(gameClear, 0, 0);
  textSize(60);
  //text("Game Clear!", 100, 100);
  menuButton();
  gameSetup();
}

//scene = 6
void story() {
  float mss = millis()/1000 - starttm;
  background(0);
  textSize(35);
  fill(255);
  text("ある日突然不思議な水が降ってきた！",300,280);
  text("このままでは島が沈んでしまう・・・",300,350);
  text("仲間と共に水を消して世界を救おう",300,420);
  if(mss > 3) {
    scene = 4;
  }
  
}

//scene = 7
void charaSelect() {
  image(select, 0, 0);
  selectButton();
}
