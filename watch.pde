PImage anzu,conoha1,conoha2,pronama,query,unity,cloudia;
int pic = 0,cF = 0;

void setup(){
  size(350,350);
  frameRate(60);
  smooth();
  anzu = loadImage("anzu.png");
  conoha1 = loadImage("conoha_1.png");
  conoha2 = loadImage("conoha_2.png");
  pronama = loadImage("pronama.JPG");
  query = loadImage("query.png");
  unity = loadImage("unity.png");
  cloudia = loadImage("cloudia.png");
}

void draw(){
  background(255);
  tint(255,120);
  switch(pic){
    case 0:
      image(anzu,0,0,width,height);
      break;
    case 1:
      image(unity,0,0,width,height);
      break;
    case 2:
      image(pronama,0,0,width,height);
      break;
    case 3:
      image(query,0,0,width,height);
      break;
    case 4:
      if(second() % 2 == 0)
        image(conoha1,0,0,width,height);
      else
        image(conoha2,0,0,width,height);
      break;
    case 5:
      image(cloudia,0,0,width,height);
      break;
  }
  noTint();
  fill(0);
  String time = hour() + " : " + minute() + " : " + second();
  text(time,width / 2 - textWidth(time) / 2 + textWidth(" ") * 2,height - 15);
  // button("切り替え",width - 75,height - 35,70,30);
  ellipseMode(RADIUS);
  int watchSize = 0;
  if(width <= height){
    watchSize = width / 2 - 25;
  }else{
    watchSize = height / 2 - 25;
  }
  
  translate(width / 2,height / 2 - 15);
  noFill();
  strokeWeight(1);
  ellipse(0,0,watchSize,watchSize);
  strokeWeight(10);
  point(0,0);
  // 秒針
  pushMatrix();
  rotate(radians(second() * (360 / 60)));
  strokeWeight(2);
  line(0,0,0,-140);
  popMatrix();
  // 分針
  pushMatrix();
  rotate(radians((minute() + second() / 60.0) * (360 / 60.0)));
  strokeWeight(3);
  line(0,0,0,-100);
  popMatrix();
  // 時針
  pushMatrix();
  rotate(radians((hour() + minute() / 60.0) * (360 / 12.0)));
  strokeWeight(6);
  line(0,0,0,-70);
  popMatrix();
}

void mouseReleased(){
  if(pic != 5){
    pic += 1;
  }else{
    pic = 0;
  }
}

