class Mino {
  int block;  //ミノの種類と色の種類
  int time;
  boolean drop=false;

  int [][] colorArray = new int[21][12];

  //ミノの形を定義する
  void Imino(int ax, int ay, int array[][]) {
    array[ay][ax-2]=1;
    array[ay][ax-1]=1;
    array[ay][ax]=1;
    array[ay][ax+1]=1;
  }
  void Omino(int ax, int ay, int array[][]) {  
    array[ay-1][ax-1]=1;
    array[ay-1][ax]=1;
    array[ay][ax-1]=1;
    array[ay][ax]=1;
  }
  void Tmino(int ax, int ay, int array[][]) {

    array[ay-1][ax]=1;
    array[ay][ax-1]=1;
    array[ay][ax]=1;
    array[ay][ax+1]=1;
  }
  void Smino(int ax, int ay, int array[][]) {
    array[ay-1][ax]=1;
    array[ay-1][ax+1]=1;
    array[ay][ax-1]=1;
    array[ay][ax]=1;
  }
  void Zmino(int ax, int ay, int array[][]) {
    array[ay-1][ax-1]=1;
    array[ay-1][ax]=1;
    array[ay][ax]=1;
    array[ay][ax+1]=1;
  }
  void Lmino(int ax, int ay, int array[][]) {
    array[ay-1][ax-1]=1;
    array[ay][ax-1]=1;
    array[ay][ax]=1;
    array[ay][ax+1]=1;
  }
  void Jmino(int ax, int ay, int array[][]) {
    array[ay-1][ax+1]=1;
    array[ay][ax-1]=1;
    array[ay][ax]=1;
    array[ay][ax+1]=1;
  }
  //numberでミノの種類、ax,ayで配列上のミノの生成位置,array[][]で生成する2次元配列をそれぞれ指定
  void minono(int number, int ax, int ay, int array[][]) {
    block=number;
    if (number==0) {
      Imino(ax, ay, array);
    }
    if (number==1) {
      Omino(ax, ay, array);
    }
    if (number==2) {
      Tmino(ax, ay, array);
    }
    if (number==3) {
      Smino(ax, ay, array);
    }
    if (number==4) {
      Zmino(ax, ay, array);
    }
    if (number==5) {
      Lmino(ax, ay, array);
    }
    if (number==6) {
      Jmino(ax, ay, array);
    }
  }
  //移動の可、不可の判定　rで右方向,dで下方向,lで左方向それぞれに触れているブロックがあるとfalseを返す
  boolean hantei(String direction) {
    for (int i=0; i<base.length; i++) {
      for (int j=0; j<base[i].length; j++) {
        if (base[i][j]==1) {
          if (direction =="r"&&((base[i][j+1]==2)||(base[i][j+1]==4)||(base[i][j+1]==3))) {
            return false;
          }
          if (direction =="d"&&((base[i+1][j]==2)||(base[i+1][j]==4)||(base[i+1][j]==3))) {
            return false;
          }
          if (direction =="l"&&((base[i][j-1]==2)||(base[i][j-1]==4)||(base[i][j-1]==3))) {
            return false;
          }
        }
      }
    }
    return true;
  }
  //ブロックの移動
  //右移動
  void right() {
    for (int i=0; i<base.length; i++) {
      for (int j=10; j>0; j--) {
        if (base[i][j]==1) {
          base[i][j+1]=1;
          base[i][j]=0;
        }
      }
    }
  }
  //左移動
  void left() {
    for (int i=0; i<base.length; i++) {
      for (int j=0; j<base[i].length; j++) {
        if (base[i][j]==1) {
          base[i][j-1]=1;
          base[i][j]=0;
        }
      }
    }
  }
  //下移動
  void down() {
    for (int i=20; i>=0; i--) {
      for (int j=0; j<base[i].length; j++) {
        if (base[i][j]==1) {
          base[i+1][j]=1;
          base[i][j]=0;
        }
      }
    }
  }
  //ハードドロップ
  void harddrop() {
    for (int i=0; i<base.length; i++) {
      if (hantei("d")) {
        down();
        time=58;
      }
    }
  }
  //一定時間ごとに徐々に下に移動させる処理
  void sizenrakka() {
    if (time>=(8+(5*(hp/bhp)))) {
      if (hantei("d")&&y<19) {
        down();
        y++;
        time=0;
      }
    }
    //下にブロックがあり、timeが60以上だとブロックが固定される
    if (hantei("d")==false&&time>=60) {
      for (int i=0; i<base.length; i++) {
        for (int j=0; j<base[j].length; j++) {
          if (base[i][j]==1) {
            base[i][j]=2;
            colorArray[i][j] = block;
            musicfall.setGain(50);
            musicfall.play(0);
          }
        }
      }
      drop=false;
      print2();
      println("こてい");
    }
  }
  //回転
  void spin() {
    if (block!=0&&block!=1) {
      int p=0;
      int buf[][]= new int [21][12];

      //回転する先にブロックが無い事を確認し、buf[][]に
      if (base[y-1][x-1]==1&&base[y-1][x+1]!=2&&base[y-1][x+1]!=3&&base[y-1][x+1]!=3) {
        buf[y-1][x-1]=1;
        p++;
      }
      if (base[y-1][x]==1&&base[y][x+1]!=2&&base[y][x+1]!=3&&base[y][x+1]!=4) {
        buf[y-1][x]=1;
        p++;
      }
      if (base[y-1][x+1]==1&&base[y+1][x+1]!=2&&base[y+1][x+1]!=3&&base[y+1][x+1]!=4) {
        buf[y-1][x+1]=1;
        p++;
      }
      if (base[y][x+1]==1&&base[y+1][x]!=2&&base[y+1][x]!=3&&base[y+1][x]!=4) {
        buf[y][x+1]=1;
        p++;
      }
      if (base[y+1][x+1]==1&&base[y+1][x-1]!=2&&base[y+1][x-1]!=3&&base[y+1][x-1]!=4) {
        buf[y+1][x+1]=1;
        p++;
      }
      if (base[y+1][x]==1&&base[y][x-1]!=2&&base[y][x-1]!=3&&base[y][x-1]!=4) {
        buf[y+1][x]=1;
        p++;
      }
      if (base[y+1][x-1]==1&&base[y-1][x-1]!=2&&base[y-1][x-1]!=3&&base[y-1][x-1]!=4) {
        buf[y+1][x-1]=1;
        p++;
      }
      if (base[y][x-1]==1&&base[y-1][x]!=2&&base[y-1][x]!=3&&base[y-1][x]!=4) {
        buf[y][x-1]=1;
        p++;
      }
      if (p==3) {
        erase(base);
        if (buf[y-1][x-1]==1) {
          base[y-1][x+1]=1;
        }
        if (buf[y-1][x]==1) {
          base[y][x+1]=1;
        }
        if (buf[y-1][x+1]==1) {
          base[y+1][x+1]=1;
        }
        if (buf[y][x+1]==1) {
          base[y+1][x]=1;
        }
        if (buf[y+1][x+1]==1) {
          base[y+1][x-1]=1;
        }
        if (buf[y+1][x]==1) {
          base[y][x-1]=1;
        }
        if (buf[y+1][x-1]==1) {
          base[y-1][x-1]=1;
        }
        if (buf[y][x-1]==1) {
          base[y-1][x]=1;
        }
        base[y][x]=1;
      }
    }
    //Iミノの回転(大きさが他と違う為別で処理する)
    if (block==0&&x>2&&y<19) {
      int p=0;
      int buf[][]= new int [21][12];
      if ((base[y][x-2]==1&&base[y][x-1]==1&&base[y][x+1]==1)&&(base[y-1][x]!=2&&base[y+1][x]!=2&&base[y+2][x]!=2)&&(base[y-1][x]!=3&&base[y+1][x]!=3&&base[y+2][x]!=3)&&(base[y-1][x]!=4&&base[y+1][x]!=4&&base[y+2][x]!=4)) {
        buf[y][x-2]=1;
        buf[y][x-1]=1;
        buf[y][x+1]=1;
        p+=3;
      }
      if ((base[y-1][x]==1&&base[y+1][x]==1&&base[y+2][x]==1)&&(base[y][x-2]!=2&&base[y][x-1]!=2&&base[y][x+1]!=2)&&(base[y][x-2]!=3&&base[y][x-1]!=3&&base[y][x+1]!=3)&&(base[y][x-2]!=4&&base[y][x-1]!=4&&base[y][x+1]!=4)) {
        buf[y-1][x]=1;
        buf[y+1][x]=1;
        buf[y+2][x]=1;
        p+=3;
      }
      if (p==3) {
        erase(base);
        if (buf[y][x-2]==1&&buf[y][x-1]==1&&buf[y][x+1]==1) {
          base[y-1][x]=1;
          base[y+1][x]=1;
          base[y+2][x]=1;
        }
        if (buf[y-1][x]==1&&buf[y+1][x]==1&&buf[y+2][x]==1) {
          base[y][x-2]=1;
          base[y][x-1]=1;
          base[y][x+1]=1;
        }
        base[y][x]=1;
      }
    }
  }

  //配列にある１(操作可能)ブロックを全て0にする
  void erase(int array[][]) {
    for (int i=0; i<array.length; i++) {
      for (int j=0; j<array[j].length; j++) {
        if (base[i][j]==1) {
          base[i][j]=0;
        }
      }
    }
  }

  //ミノの描画
  void setcolor(int array[][]) {
    for (int i=0; i<array.length; i++) {
      for (int j=0; j<array[j].length; j++) {
        //0が何もない、2が壁・動かなくなった
        if (array[i][j]==1) {
          if (block==0) {
            image(mizuiroImage, j*side-(side-490), i*side+(60));
          } else
            if (block==1) {
              image(kiImage, j*side-(side-490), i*side+(60));
            } else
              if (block==2) {
                image(murasakiImage, j*side-(side-490), i*side+(60));
              } else
                if (block==3) {
                  image(midoriImage, j*side-(side-490), i*side+(60));
                } else
                  if (block==4) {
                    image(akaImage, j*side-(side-490), i*side+(60));
                  } else
                    if (block==5) {
                      image(pinkuImage, j*side-(side-490), i*side+(60));
                    } else
                      if (block==6) {
                        image(aoImage, j*side-(side-490), i*side+(60));
                      }
        } else if (array[i][j]==2 && i!=20&&j!=11&&j!=0) {
          if (colorArray[i][j]==0) {
            image(mizuiroImage, j*side-(side-490), i*side+(60));
          } else
            if (colorArray[i][j]==1) {
              image(kiImage, j*side-(side-490), i*side+(60));
            } else
              if (colorArray[i][j]==2) {
                image(murasakiImage, j*side-(side-490), i*side+(60));
              } else
                if (colorArray[i][j]==3) {
                  image(midoriImage, j*side-(side-490), i*side+(60));
                } else
                  if (colorArray[i][j]==4) {
                    image(akaImage, j*side-(side-490), i*side+(60));
                  } else
                    if (colorArray[i][j]==5) {
                      image(pinkuImage, j*side-(side-490), i*side+(60));
                    } else
                      if (colorArray[i][j]==6) {
                        image(aoImage, j*side-(side-490), i*side+(60));
                      }
        }
      }
    }
  }
  void retusorou(int i) {
    for (int k=0; k<10; k++) {
      colorArray[i][k]=0;
    }
    for (int k=i; k>0; k--) {
      for (int l=0; l<colorArray[k].length; l++) {
        colorArray[k][l]=colorArray[k-1][l];
      }
    }
    print2();
    println("さくじょ");
  }
  void print1() {
    for (int i=0; i<colorArray.length; i++) {
      for (int j=0; j<colorArray[j].length; j++) {
        print(colorArray[i][j]);
      }
      println();
    }
    println();
  }
  void print2() {
    for (int i=0; i<colorArray.length; i++) {
      for (int j=0; j<colorArray[j].length; j++) {
        print(colorArray[i][j]);
      }
      print("     ");
      for (int j=0; j<colorArray[j].length; j++) {
        print(base[i][j]);
      }
      println();
    }
    println();
  }
  public void colorArraySetup() {
    for(int i=0;i<colorArray.length;i++){
      for(int j=0;j<colorArray[i].length;j++){
        colorArray[i][j]=0;
      }
    }
  }
}
