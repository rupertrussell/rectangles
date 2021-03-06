int x1 = 0;
int y1 = 0;
int x2 = 0;
int y2 = 0;
int margin = 600;
int maxWidth = 600;
int maxHeight = 600;
int randomWidth;
int randomHeight;
int xPosition = 0;
int yPosition = 0;
int gap = 10;
int y2Max;
int countX;
int Y_AXIS = 1;
int X_AXIS = 2;
color b1, b2, c1, c2, c3, c4;
String fileName = "default.png";

boolean drawRectangle = false;

color yellow = color(255, 255, 0);
color black = color(0);

void setup() {
  noLoop();
  strokeWeight(3);

// 2875 x 3900 T-Shirt


// 2344 x 2467 poster 
// 2940 x 2940 clock


// 7632 x 6480 Tapestries
// 2376 x 2024 Travel Mug
// 2700 x 1624 Tall Mug
// 9144 x 6096 extra large print
// 2875 x 3900 Long T-Shirt
// 2696 x 3305 iPad Case
// 4600 x 3000 Phone Cases & Skins
// 2950 × 2950 Large tote bag


// size (4020,6090); // Womens Graphic Dress
// fileName = "4020×6090-Womens_Graphic_Dress.png";

// size (2875, 3900); // Graphics T Shirt
// String fileName = "2875x3900-Graphics_T_Shirt.png";

// size (2875, 3900); // Graphics T Shirt
// fileName = "2875x3900-Graphics_T_Shirt.png";

//size (4625,4625); // Floor Pillow
//fileName = "4625×4625-Floor_Pillow.png";
  
//size (6310, 6230); // A-Line Dress
//fileName = "6310x6230-A-Line_Dress.png";

//size (2788, 2788); // Pillow
//fileName = "2788×2788-Pillow.png";

//size (7632, 6480); // Duvet Covers
//fileName = "7632x6480-Duvet_Covers.png";

//size (4600, 3000); // Laptop Skin
//fileName = "4600x3000-Laptop_Skin.png";

//size (2800, 2800); // Sticker
//fileName = "2800x2800-Sticker.png";

//size (3502, 2385); // Journal
//fileName = "3502x2385-Journal.png";

//size (1765, 2481); // Notebook
//fileName = "1765x2481-Notebook.png";

//size (4350, 4032); // Leggings
//fileName = "4350x4032-Leggings.png";
 
//size (5748, 5748); // scarves
//fileName = "5748x5748-scarves.png";

//size (4535, 5480); // Canvas_Print
//fileName = "4535x5480-Canvas_Print.png";

//size (7632, 6480); // Throw
//fileName = "7632x6480-Throw.png";

//size (2280, 2760); // Tote
//fileName = "2280x2760-Tote.png";
 
 
//size (9075, 6201); // Jigsaw 
//fileName = "9075x6201-Jigsaw.png";
 
size (9075, 6201); // Jigsaw 
fileName = "9075x6201-Jigsaw.png";

  
  rectMode(CORNERS);  // Set rectMode to CORNERS
  stroke(255);

  // Define colors
  b1 = color(255,255,0);
  b2 = color(0);
}

void draw() {
  background(255,255,0); // for clock  (0) otherwise
  while (yPosition + margin <  height  ) {
    while (x2 < width - maxWidth  ) {
      //println("x2 = " + x2);
      //println("countX = " + countX);
      //println("xPosition = " + xPosition);
      //println("y2Max = " + y2Max);
      randomWidth = int(random(maxWidth));
      randomHeight = int(random(maxHeight));

      x1 = xPosition + gap + int(random(5));
      x2 = x1 + randomWidth;

      y1 = yPosition + int(random(5));
      y2 = y1 + randomHeight;

      fill(random(255) + 50);

      if ((x2 < width + margin)) {

        //  rect(x1, y1, x2, y2);

      //  setGradient(x1, y1, x2, y2, b1, b2, Y_AXIS);
      }
      xPosition = x2;
      if (y2 > y2Max) {
        y2Max = y2;
      }
      countX ++;
    }
    xPosition = 0;
    x1 = 0;
    x2 = 0;
    yPosition = y2Max + gap;
  }

  // add random rectangles

  for (int c = 0; c < 30000; c++) {
    drawRectangle = true;
    stroke(0);
    noStroke();
    //  println("c = " + c);
    x1 = int(random(width));
    y1 = int(random(height));

    x2 = x1 + int(random(maxWidth));
    y2 = y1 + int(random(maxHeight)); 

    c1 = get(x1, y1);
    c2 = get(x2, y2);

    // test every pixel in the random rectangle 
    // if any pixel is not black do not draw that rectangle
    for (int i = x1; i < x2; i ++) {
      for (int j = y1; j < y2; j++) {

        c1 = get(i, j);
        // set(i, j, yellow);

        if (c1 != black) {
          drawRectangle = false;
          // println("drawRectangle = false");
        }
      }
    }

    if (drawRectangle == true) {
      fill(255, random(230), random(30));
      stroke(0);
      rect(x1, y1, x2, y2);
    }
  }
  
  save(fileName);
  println("saved = " + fileName);
  exit();
}


void setGradient(int x, int y, float w, float h, color c3, color c4, int axis ) {
  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c3, c4, inter);
      stroke(c4);
      line(x, i, x+w, i);
      
    }
  } else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c3, c4, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
