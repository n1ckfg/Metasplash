class Rain {

  PVector position,pposition,speed;
  float col;

  Rain() {
    position = new PVector(random(0,width),0);
    pposition = position;
    speed = new PVector(0,0);
    col = random(30,100);
  }

  void draw() {
    tex.stroke(0,50,100,col);
    tex.strokeWeight(2);
    tex.line(position.x,position.y,pposition.x,pposition.y);
  }

  void calculate() {
    pposition = new PVector(position.x,position.y);
    gravity();
  }

  void gravity() {
    speed.y += .5;
    speed.x += .01;
    position.add(speed);
  }
  
}
 
