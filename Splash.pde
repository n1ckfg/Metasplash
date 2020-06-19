class Splash {
    PVector position,speed;

    Splash(float x,float y) {
        float angle = random(PI,TWO_PI);
        float distance = random(1,5);
        float xx = cos(angle)*distance;
        float yy = sin(angle)*distance;
        position = new PVector(x,y);
        speed = new PVector(xx,yy);
    }

    void draw() {
        strokeWeight(1);
        stroke(100,50);
        fill(100,100);
        ellipse(position.x,position.y,2,2);
    }

    void calculate() {
        if(gravity) gravity();
        speed.x*=0.98;
        speed.y*=0.98;
                
        position.add(speed);
    }

    void gravity() {
        speed.y+=0.2;
    }

}
