//横一列揃ったときの列の削除
void  retusorou(int array[][]) {
  for (int i=0; i<array.length-1; i++) {
    int c=0;
    for (int j=0; j<array[j].length; j++) {
      if (array[i][j]==2||array[i][j]==4) { 
        c++;
      }
      //cの値が11より大きい時、横一列揃った事になる
      if (c>11) {
        retu1=i;
        if (retu1!=0&&retu2==-30&&retu3==-30&&retu4==-30) {
          retu2=i;
        } else if (retu1!=0&&retu2!=0&&retu3==-30&&retu4==-30) {
          retu3=i;
        } else {
          retu4=i;
        }

        kirisyoukyo++;
        score++;
        vanishCount++;
        musicdrip2.play(0);
        current.retusorou(i);
        for (int k=0; k<array[i].length; k++) { //氷が消えた時HPを回復させる処理
          if (array[i][k]==4 && hp < bhp) {
            score-=1;
          }
        }
        for (int k=0; k<array[i].length; k++) {
          array[i][k]=0;
        }
        for (int k=i; k>0; k--) {
          for (int l=0; l<array[k].length; l++) {
              array[k][l]=array[k-1][l];
          }
        }
        for (int k=0; k<array[i].length; k++) {
          if (k==0||k==11) {
            array[0][k]=2;
          } else {
            array[0][k]=0;
          }
        }
      }
    }
  }
  if (vanishCount==1) {
    score+=1;
  }
  if (vanishCount==2) {
    score+=3;
  }
  if (vanishCount==3) {
    score+=4;
  }
  if (vanishCount==4) {
    score+=6;
  }
  vanishCount = 0;
}
