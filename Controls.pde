void keyPressed(){
  if(key==' ') background(0);
  if(key=='g'||key=='G') gravity = !gravity;
}

void mousePressed() {
  gravity = false;
}

void mouseReleased() {
  gravity = true;
}
