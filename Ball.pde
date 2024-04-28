class Ball
{
  PVector pos;
  float d;
  PVector linearV;
  
  Ball(PVector pos, float d)
  {
    this.pos = pos;
    this.d = d;
    int ry = random(2) < 0.5 ? -1 : 1;
    int rx = random(2) < 0.5 ? -1 : 1;
    this.linearV = new PVector(rx*8,ry*8);
  }
  
  PVector Collisions(PVector linearV)
  {
    if((player1.x+40 >= this.pos.x && player1.x+30 <= this.pos.x && this.pos.y<player1.y+90 && this.pos.y>player1.y-90) ||
       (player2.x-40 <= this.pos.x && player2.x-30 >= this.pos.x && this.pos.y<player2.y+90 && this.pos.y>player2.y-90))
    {
      if (this.linearV.x < 0) 
      {
        this.linearV.x = abs(this.linearV.x);
        //acceleration <-
        if(abs(this.linearV.x) < 20)
        {
          this.linearV.x = this.linearV.x +1.5;
        }
      } 
      else 
      {
        this.linearV.x = -abs(this.linearV.x);
        //acceleration ->
        if(abs(this.linearV.x) < 20)
        {
          this.linearV.x = this.linearV.x -1.5;
        }
      }
      
      println("X Velocity: "+abs(this.linearV.x));
 
    }
    if(this.pos.y + this.d > height || this.pos.y - this.d < 0 )
    {
      this.linearV.y = -this.linearV.y;
    }
    
    return linearV;
  }
  
  void lost()
  {
    if(this.pos.x<-30)
    {
      blueScore++;
      start = false;
      resetBall();
    }
    if(this.pos.x>WIDTH+30)
    {
      redScore++;
      start = false;
      resetBall();
    }
  }
  
  void resetBall()
  {
    this.pos.x = WIDTH/2;
    this.pos.y = HEIGHT/2;
    int ry = random(2) < 0.5 ? -1 : 1;
    int rx = random(2) < 0.5 ? -1 : 1;
    this.linearV = new PVector(rx*-5,ry*-5);
  }
  
  void update()
  {
    linearV = Collisions(linearV);
    lost();
    this.pos.x += this.linearV.x;
    this.pos.y += this.linearV.y;
  }
  
  void draw()
  {
    noStroke();
    fill(WHITE);
    circle(this.pos.x,this.pos.y,this.d);
  }
}
