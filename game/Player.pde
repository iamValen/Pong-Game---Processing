class Player
{
  float x;
  float y;
  color c;
  
  Player(float x, float y, color c)
  {
    this.x = x;
    this.y = y;
    this.c = c;
  }
  
  void up()
  {
    if(this.y-75 > 0)
    {
      this.y -= 15;
    }
  }
  
  void down()
  {
    if(this.y+75 < 1080)
    {
      this.y += 15;
    }
  }
  
  void draw()
  {
    rectMode(CENTER);
    noStroke();
    fill(this.c);
    rect(this.x,this.y,30,150);
  }
}
