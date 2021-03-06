// RACING GAME TEMPLATE
// Developed by Will McFarland, Dylan Mullins & Nathan Wolek

// variables used throughout program

int posX;
int posY;

Racer player1;
Racer player2;

boolean gameRunning = true;

// happens once at beginning

void setup() {
  size(1600, 900);
  background(0);
  player1 = new Racer(1);
  player2 = new Racer(2);
}

// happens over and over

void draw() {

  // put graphics on the screen

  background(0);

  posX = player1.getX();
  posY = player1.getY();

  image(player1.getImage(), posX, posY);

  posX = player2.getX();
  posY = player2.getY();

  image(player2.getImage(), posX, posY);

  // check for winner

  if (player1.hasWon())
  {
    gameRunning = false;
    background(0);
    fill(20, 20, 255);
    textSize(30);
    text("DONUT DESTROYER WINS", 175, 240);
  }

  if (player2.hasWon())
  {
    gameRunning = false;
    background(0);
    fill(255, 0, 0);
    textSize(30);
    text("WALRUS WHOMP WINS", 175, 240);
    
    
  }
}

// handle the keys

void keyPressed()
{

  // are we still playing?

  if (gameRunning)
  {    

    if (key == 'a') {
      player1.rightKey();
    }

    if (key == 'd') {
      player1.leftKey();
    }

    if (key == 'j') {
      player2.leftKey();
    }

    if (key == 'l') { 
      player2.rightKey();
    }
  }

  // if we are not playing...

  else
  {
    if (key == ENTER)
    {
      player1 = new Racer(1);
      player2 = new Racer(2);
      gameRunning = true;
    }
  }
}

class Racer 
{
  private PImage racerPose1;
  private PImage racerPose2;
  
  private int xLoc;
  private int yLoc;
  
  private boolean tapFlag = false;
  
  private boolean won = false;
  
  
  public Racer()
  {
  }
  
  public Racer(int player)
  {
    xLoc = 0;
    yLoc = player == 2 ? 220 : 0;
    
    if (player == 1)
    {
      racerPose1 = loadImage("donut3.png");
      racerPose1.resize(100, 0);
      racerPose2 = loadImage("donut3.png");
      racerPose2.resize(150, 0);

    }
    
    if (player >= 2)
    {
      racerPose1 = loadImage("walrus3.png");
      racerPose1.resize(50, 0);
      racerPose2 = loadImage("walrus3.png");
      racerPose2.resize(50, 0);
    }
  }
  
  public void leftKey() {
    if(tapFlag) {
      moveForward();
    } else {
      moveBackward();
    }     
    tapFlag = false;
  }
  
  public void rightKey() {
    if(!tapFlag) {
      moveForward();
    } else {
      moveBackward();
    }
    tapFlag = true;
  }
  
  private void moveForward() {
    xLoc++;
    won = xLoc >= 50;
  }
  
  private void moveBackward() {
    if (xLoc > 0)
    {
      xLoc--;
    }  
  }
  
  public int getX() {
    return (xLoc*10) + 35;
  }
  
  public int getY() {
    return yLoc + 40;
  }
  
  public boolean hasWon() {
    return won;
  }
  
  public PImage getImage() {
    if(tapFlag) {
      return racerPose1;
    } else {
      return racerPose2;
    }
  }
  
}
