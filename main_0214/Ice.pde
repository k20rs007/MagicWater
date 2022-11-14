PImage ice1Image, ice2Image; //<>// //<>//
public class Ice extends Mino {
  int time;
  int gene=400;
  int fro=0;
  boolean ice=false;
  void ice() {
    ice1Image=loadImage("ice1.png");
    ice1Image.resize(side, side);
    ice2Image=loadImage("ice2.png");
    ice2Image.resize(side, side);
    //current.print2();
    generate();
    freeze();
    sizenrakka();
    setcolor();
    gene++;
    time++;
  }
  void freeze() {
    for (int i=19; i>1; i--) {
      for (int j=1; j<base[i].length-1; j++) {
        if (base[i][j]==3) {
          if (base[i+1][j]==1||base[i-1][j]==1||base[i][j+1]==1||base[i][j-1]==1) {
            kooru();
          }
          if (fro>1) {
            hold3=true;
          }
        }
      }
    }
  }

  void kooru() {
    for (int m=0; m<base.length; m++) {
      for (int n=0; n<base[m].length; n++) {
        if (base[m][n]==1) {
          base[m][n]=3;
          fro++;
          ice=true;
        }
      }
    }
  }

  //下移動
  void down(int i, int j) {
    base[i+1][j]=3;
    base[i][j]=0;
  }

  //一定時間ごとに徐々に下に移動させる処理
  void sizenrakka() {
    if (ice==true) {
      time+=45;
    }
    if (time>=60) {
      int iti=0;
      for (int i=20; i>=0; i--) {
        for (int j=0; j<base[j].length; j++) {
          if (base[i][j]==3&&((base[i+1][j]==2)||(base[i+1][j]==4))) {
            base[i][j]=4;
            fro--;
          }
          if (base[i][j]==1) {
            iti++;
          }
        }
      }
      for (int i=20; i>=0; i--) {
        for (int j=0; j<base[i].length; j++) {
          if (base[i][j]==3) {
            if (hanteiNEO("d", i, j)) {
              down(i, j);
            }
          }
        }
      }
      if (iti==0&&fro==0) {             
        current.drop=false;
        ice=false;
        fro=0;
        gene=300;
        iti=0;
      }
      iti=0;
      time=0;
    }
  }

  void generate() {
    if (gene>1000) {
      int ran = (int)random(1, 11);
      if (base[3][ran]!=0) {
        generate();
      }
      if (fro==0) {
        base[3][ran]=3;
        fro++;
        gene=0;
      }
    }
  }
  //ミノの描画
  void setcolor() {
    for (int i=0; i<base.length; i++) {
      for (int j=0; j<base[i].length; j++) {
        if (base[i][j]==3) {
          image(ice1Image, j*side-(side-490), i*side+(60));
        }
        if (base[i][j]==4) {
          image(ice2Image, j*side-(side-490), i*side+(60));
        }
      }
    }
  }
  void GameOver() {
    for (int i=0; i<base[0].length; i++) {
      if (base[0][i]==3) {
        scene=3;
      }
    }
  }
  boolean hantei(String direction) {
    for (int i=0; i<base.length; i++) {
      for (int j=0; j<base[i].length; j++) {
        if (base[i][j]==3) {
          if (direction =="r"&&(base[i][j+1]==2)) {
            return false;
          }
          if (direction =="d"&&((base[i+1][j]==4)||(base[i+1][j]==2))) {
            return false;
          }
          if (direction =="l"&&base[i][j-1]==2) {
            return false;
          }
        }
      }
    }
    return true;
  }
  boolean hanteiNEO(String direction, int y, int x) {
    if (base[y][x]==3) {
      if (direction =="d"&&((base[y+1][x]==4)||(base[y+1][x]==2))) {
        return false;
      }
    }
    return true;
  }
}

void print0123() {
  for (int i=0; i<base.length; i++) {  
    for (int j=0; j<base[i].length; j++) {
      print(base[i][j]);
    }
    println();
  }
  println();
}
