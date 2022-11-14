void set2() {
  for (int i=19; i>15; i--) {
    for (int j=1; j<base[i].length-1; j++) {
      if (((i+j)%10)!=0) {
        base[i][j]=4;
      }
    }
  }
}
void set1(){
  for (int i=19; i>10; i--) {
    for (int j=1; j<base[i].length-1; j++) {
      if (j!=5&&j!=6) {
        base[i][j]=4;
      }
    }
  }
}
