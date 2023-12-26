void drawSquid(String s, int x, int y) {
  pushMatrix();
  fill(0, 255, 0);
  noStroke();
  int[][] pixelArt = {
    {0, 0, 0, 1, 1, 0, 0, 0},
    {0, 0, 1, 1, 1, 1, 0, 0},
    {0, 1, 1, 1, 1, 1, 1, 0},
    {1, 1, 0, 1, 1, 0, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1},
    {0, 0, 1, 0, 0, 1, 0, 0},
    {0, 1, 0, 1, 1, 0, 1, 0},
    {1, 0, 1, 0, 0, 1, 0, 1}
  };
  drawPixelArt(x, y, pixelArt);
  popMatrix();
  pushMatrix();
  pixelArtText(x, y, s, pixelArt);
  popMatrix();
}

void drawOctopus(String s, int x, int y) {
  pushMatrix();
  fill(255, 255, 0);
  noStroke();
  int[][] pixelArt = {
    {0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0},
    {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0},
    {0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0},
    {1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1}
  };
  drawPixelArt(x, y, pixelArt);
  popMatrix();
  pushMatrix();
  pixelArtText(x, y, s, pixelArt);
  popMatrix();
}

void drawCrab(String s, int x, int y) {
  pushMatrix();
  fill(0, 255, 255);
  noStroke();
  int[][] pixelArt = {
    {0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
    {0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
    {0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
    {0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1},
    {1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1},
    {0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0}
  };
  drawPixelArt(x, y, pixelArt);
  popMatrix();
  pushMatrix();
  pixelArtText(x, y, s, pixelArt);
  popMatrix();
}

void drawCircle(int x, int y) {
  pushMatrix();
  noStroke();
  int[][] pixelArt = {{0, 0, 1, 1, 1, 0, 0},
    {0, 1, 0, 0, 0, 1, 0},
    {1, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 1},
    {0, 1, 0, 0, 0, 1, 0},
    {0, 0, 1, 1, 1, 0, 0}
  };
  drawPixelArt(x, y, pixelArt);
  popMatrix();
}

void drawCross(int x, int y) {
  pushMatrix();
  noStroke();
  int[][] pixelArt = {{1, 0, 0, 0, 0, 0, 1},
    {0, 1, 0, 0, 0, 1, 0},
    {0, 0, 1, 0, 1, 0, 0},
    {0, 0, 0, 1, 0, 0, 0},
    {0, 0, 1, 0, 1, 0, 0},
    {0, 1, 0, 0, 0, 1, 0},
    {1, 0, 0, 0, 0, 0, 1}
  };
  drawPixelArt(x, y, pixelArt);
  popMatrix();
}

void drawAircraft() {
  int x = mouseX;
  int y = 350;
  pushMatrix();
  fill(0, 255, 255);
  noStroke();
  int[][] pixelArt = {
    {0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0},
    {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

  };
  float halfWidth=px*pixelArt[0].length/2;
  float halfHeight=px*pixelArt[0].length/2;
  if (x-halfWidth<0)translate(0, y-halfHeight);
  else if (x+halfWidth>width)translate(width-halfWidth*2, y-halfHeight);
  else translate(x-halfWidth, y-halfHeight);
  for (int i=0; i<pixelArt.length; i++) {
    for (int j=0; j<pixelArt[i].length; j++) {
      if (pixelArt[i][j]==1)rect(j*px, i*px, px, px);
    }
  }
  popMatrix();
}

void drawPixelArt(int x, int y, int[][] pixelArt) {
  float halfWidth=px*pixelArt[0].length/2;
  float halfHeight=px*pixelArt.length/2;
  translate(x-halfWidth, y-halfHeight);
  for (int i=0; i<pixelArt.length; i++) {
    for (int j=0; j<pixelArt[i].length; j++) {
      if (pixelArt[i][j]==1)rect(j*px, i*px, px, px);
    }
  }
}

void pixelArtText(int x, int y, String s, int[][] pixelArt) {
  float halfHeight=px*pixelArt.length/2;
  translate(x, y+halfHeight+20);
  fill(255);
  text(s, 0, 0);
}
