// http://beraebeo.futupeeps.com/webpd/demos/processing-storm/processing-storm.html
int docW = 640;
int docH = 480;
boolean gravity = true;

int rainNum = 100;
ArrayList rain = new ArrayList();
ArrayList splash = new ArrayList();
ArrayList metaSplash = new ArrayList();

void setup() {
    //noLoop();
    size(docW,docH,P3D);
    colorMode(HSB,100);
    background(0);

    rain.add(new Rain());
}
 
void draw() {
    blur(50);
    lightning();
   
    if (random(0, 10) > 9.9 && rain.size()<4) {
        rain.add(new Rain());
    }
   
    for (int i=0 ; i<rain.size() ; i++) {
        Rain rainT = (Rain) rain.get(i);
        rainT.calculate();
        rainT.draw();
        if (rainT.position.y>height) {
            //sendDrop();
            for (int k = 0 ; k<random(5,10) ; k++) {
                splash.add(new Splash(rainT.position.x,height));
            }

            rain.remove(i);
            float rand = random(0,100);
            if (rand>10&&rain.size()<150) rain.add(new Rain());
        }
    }
   
    for (int i=0 ; i<splash.size() ; i++) {
        Splash spl = (Splash) splash.get(i);
        spl.calculate();
        spl.draw();
        if (spl.position.y>height)
        splash.remove(i);
    }
    for (int q=0 ; q<metaSplash.size() ; q++) {
        Splash spl = (Splash) metaSplash.get(q);
        spl.calculate();
        spl.draw();
        if (spl.position.y>height)
        metaSplash.remove(q);
    }
            if(mousePressed){
              for (int k = 0 ; k<random(5,10) ; k++) {
                splash.add(new Splash(mouseX,mouseY));
            }
            }
                for (int i=0 ; i<splash.size() ; i++) {
        Splash spl = (Splash) splash.get(i);
        spl.calculate();
        spl.draw();
        if (spl.position.y>height){
        metaSplash.add(new Splash(spl.position.x,height));
        splash.remove(i);
        }
    }
    println(frameRate);
}

// Rain drops, splashes and other functions
void blur(float trans) {
    noStroke();
    fill(0,trans);
    rect(0,0,width,height);
}

int lightningFrame = 5;
void startLightning() {
    lightningFrame = 1;
}
void lightning() {
    if (lightningFrame < 5) {
        fill(255,255);
        rect(0,0,width,height);
        lightningFrame++;
    }
}


