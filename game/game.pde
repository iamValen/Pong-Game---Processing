
final color BLACK = color(0,0,0);
final color DARK_GREY = color(30,30,30);
final color RED = color(200,0,0);
final color BLUE = color(0,50,200);
final color WHITE = color(255,255,255);

public final int WIDTH = 1920;
public final int HEIGHT = 1080;

public Player player1 = new Player(20, HEIGHT/2, RED);
public Player player2 = new Player(WIDTH-20, HEIGHT/2, BLUE);
public Ball ball = new Ball(new PVector(WIDTH/2,HEIGHT/2),50);

boolean start = false, w = false, s = false, down = false, up = false;

boolean PlayerCollision = false;
boolean Collision = false;



public int redScore = 0;
public int blueScore = 0;

void settings()
{
  size(WIDTH, HEIGHT); 
}

void draw()
{ 
  background(BLACK);
  rectMode(CENTER);
  fill(DARK_GREY);
  rect(WIDTH/2,HEIGHT-30,200,100);
  
  
  fill(RED);
  textSize(50);
  text(redScore,WIDTH/2-70,HEIGHT-20);
  fill(BLUE);
  textSize(50);
  text(blueScore,WIDTH/2+40,HEIGHT-20);
  player1.draw();
  player2.draw();
  ball.draw();
  
  if(w == true) player1.up();
  if(s == true) player1.down();
  if(up == true) player2.up();
  if(down == true) player2.down();
  if(start == true)
  {
    ball.update();
  }
}

void keyReleased()
{
  if (key == 'W' || key == 'w') w = false;
  if (key == 'S' || key == 's') s = false;
  if (keyCode == UP) up = false;
  if (keyCode == DOWN) down = false;
}

void keyPressed() 
{
  if (key == ' ') start = true;
  if (key == 'W' || key == 'w') w = true;
  if (key == 'S' || key == 's') s = true;
  if (keyCode == UP) up = true;
  if (keyCode == DOWN) down = true;
}
