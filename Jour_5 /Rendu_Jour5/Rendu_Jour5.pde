
class LineSegment {   //pour stocker les traits des lettres
  float x1,y1,x2,y2;
  LineSegment(float a,float b,float c,float d){ 
    x1=a; y1=b; x2=c; y2=d;  
  }
}

class Drip { //pour gérer les gouttes de peinture 
  float x,y=0, speed,w,h;
  Drip(float x){
    this.x=x;
    speed=random(0.7,1.5);
    w=random(5,10); //largeur de la goutte 
    h=random(30,80); //hauteur de la goutte
  }
  void update(){
    y+=speed; 
    h+=speed*0.7;
    speed*=1.01;
  }
  void display(int c){
    noStroke();
    fill(c,100);
    rect(x-w/2,y-h,w,h);
    ellipse(x,y,w,w);
  }
}


//Variables

ArrayList<LineSegment> lines = new ArrayList<LineSegment>(); //le texte (les segments) du texte principal 
ArrayList<LineSegment> signature = new ArrayList<LineSegment>(); // les segments de mon nom 
ArrayList<Drip> drips = new ArrayList<Drip>(); // les gouttes qui bougent 

int currentLine = 0;
float t = 0; // progression du segment (0=debut et 1=fin)
float speed = 0.04; //vitesse d'écriture du texte 
boolean writingFinished = false; // vrai seulement si tout le texte est ecrit 
float redToBlack = 0;
float blackFill = 0;
int sigLine = 0;
float sigT = 0;
float sigSpeed = 0.07; // signature plus rapide 




void setup() {
  size(1600, 400);
  background(255);
  frameRate(60);
  strokeWeight(2);
  noFill();



//Création du texte principal 
  float s = 20; //taille des lettres 
  float spacing = 15;
  float wordSpacing = 90;
  float textWidth =
    (3*s + 2*spacing) + wordSpacing +
    (2*s + spacing) + wordSpacing +
    (9*s + 8*spacing);
  float x = width/2 - textWidth/2;
  float y = height/2;


//on ajoute les lettres 
  addF(x,y,s); x+=s+spacing;
  addI(x,y,s); x+=s+spacing;
  addN(x,y,s); x+=s+wordSpacing;

  addD(x,y,s); x+=s+spacing;
  addU(x,y,s); x+=s+wordSpacing;

  addW(x,y,s); x+=s*2+spacing;
  addO(x,y,s); x+=s+spacing;
  addR(x,y,s); x+=s+spacing;
  addK(x,y,s); x+=s+spacing;
  addS(x,y,s); x+=s+spacing;
  addH(x,y,s); x+=s+spacing;
  addO(x,y,s); x+=s+spacing;
  addP(x,y,s);

  buildSignature();
}



void draw() {

//Pour les gouttes 
  if (!writingFinished && frameCount % 3 == 0) { //on crée une goutte toutes les 3 frames tant que le texte n'est pas fini
    drips.add(new Drip(random(width)));
  }
  int dripColor = lerpColor(color(160,0,0), color(0), redToBlack);
  for (Drip d : drips) {
    d.update();
    d.display(dripColor);
  }

//Ecriture du texte 
  if (currentLine < lines.size()) {
    LineSegment seg = lines.get(currentLine);
    float px = lerp(seg.x1, seg.x2, t);
    float py = lerp(seg.y1, seg.y2, t);
    stroke(0);
    line(seg.x1, seg.y1, px, py);

    t += speed;
    if (t >= 1) {
      t = 0;
      currentLine++;
    }
  } else {
    writingFinished = true;
  }

//transi fondu rouge et noire 
  if (writingFinished) {
    redToBlack = min(redToBlack + 0.001, 1);
    blackFill = min(blackFill + 0.001, 1);
    noStroke();
    fill(0,255*blackFill);
    rect(0,0,width,height);

   
    stroke(255);
    for(LineSegment seg : lines){ // pour réafficher le texte au premier plan 
      line(seg.x1,seg.y1,seg.x2,seg.y2); 
    }
  }

// Pour réafficher mon nom devant
  if (writingFinished) {
    stroke(255);
    for(int i=0; i<sigLine; i++){
      LineSegment s = signature.get(i);
      line(s.x1,s.y1,s.x2,s.y2);
    }

    if(sigLine < signature.size()){
      LineSegment s = signature.get(sigLine);
      float px = lerp(s.x1, s.x2, sigT);
      float py = lerp(s.y1, s.y2, sigT);
      line(s.x1,s.y1,px,py);

      sigT += sigSpeed;
      if(sigT>=1){
        sigT=0;
        sigLine++;
      }
    }
  }
}

//Les lettres 
void addF(float x,float y,float s){ lines.add(new LineSegment(x,y-s,x,y+s)); lines.add(new LineSegment(x,y-s,x+s,y-s)); lines.add(new LineSegment(x,y,x+s*0.7,y)); }
void addI(float x,float y,float s){ lines.add(new LineSegment(x+s/2,y-s,x+s/2,y+s)); }
void addN(float x,float y,float s){ lines.add(new LineSegment(x,y+s,x,y-s)); lines.add(new LineSegment(x,y-s,x+s,y+s)); lines.add(new LineSegment(x+s,y+s,x+s,y-s)); }
void addD(float x,float y,float s){ lines.add(new LineSegment(x,y-s,x,y+s)); for(int i=0;i<6;i++){ float a1=PI/2-PI*i/6; float a2=PI/2-PI*(i+1)/6; lines.add(new LineSegment(x+cos(a1)*s,y+sin(a1)*s,x+cos(a2)*s,y+sin(a2)*s)); } }
void addU(float x,float y,float s){ lines.add(new LineSegment(x,y-s,x,y+s)); lines.add(new LineSegment(x,y+s,x+s,y+s)); lines.add(new LineSegment(x+s,y+s,x+s,y-s)); }
void addW(float x,float y,float s){ lines.add(new LineSegment(x,y-s,x+s/2,y+s)); lines.add(new LineSegment(x+s/2,y+s,x+s,y-s)); lines.add(new LineSegment(x+s,y-s,x+s*1.5,y+s)); lines.add(new LineSegment(x+s*1.5,y+s,x+s*2,y-s)); }
void addO(float x,float y,float s){ lines.add(new LineSegment(x,y-s,x+s,y-s)); lines.add(new LineSegment(x+s,y-s,x+s,y+s)); lines.add(new LineSegment(x+s,y+s,x,y+s)); lines.add(new LineSegment(x,y+s,x,y-s)); }
void addR(float x,float y,float s){ lines.add(new LineSegment(x,y+s,x,y-s)); lines.add(new LineSegment(x,y-s,x+s,y-s)); lines.add(new LineSegment(x+s,y-s,x+s,y)); lines.add(new LineSegment(x,y, x+s, y+s)); } 
void addK(float x,float y,float s){ lines.add(new LineSegment(x,y+s,x,y-s)); lines.add(new LineSegment(x,y,x+s,y-s)); lines.add(new LineSegment(x,y,x+s,y+s)); }
void addS(float x,float y,float s){ lines.add(new LineSegment(x+s,y-s,x,y-s)); lines.add(new LineSegment(x,y-s,x,y)); lines.add(new LineSegment(x,y,x+s,y)); lines.add(new LineSegment(x+s,y,x+s,y+s)); lines.add(new LineSegment(x+s,y+s,x,y+s)); }
void addH(float x,float y,float s){ lines.add(new LineSegment(x,y-s,x,y+s)); lines.add(new LineSegment(x+s,y-s,x+s,y+s)); lines.add(new LineSegment(x,y,x+s,y)); }
void addP(float x,float y,float s){ lines.add(new LineSegment(x,y+s,x,y-s)); lines.add(new LineSegment(x,y-s,x+s,y-s*0.5)); lines.add(new LineSegment(x+s,y-s*0.5,x,y)); }


//Pour la signature

void buildSignature() {
  float sx = width - 350; //signature un peu plus vers la gauche
  float sy = height - 40;
  float s = 10;
  float sp = 8;


//Les lettres de la signature 

// R
  signature.add(new LineSegment(sx,sy+s,sx,sy-s));
  signature.add(new LineSegment(sx,sy-s,sx+s,sy-s));
  signature.add(new LineSegment(sx+s,sy-s,sx+s,sy));
  signature.add(new LineSegment(sx,sy,sx+s,sy+s));
  sx+=s+sp;

// o
  signature.add(new LineSegment(sx,sy-s,sx+s,sy-s));
  signature.add(new LineSegment(sx+s,sy-s,sx+s,sy+s));
  signature.add(new LineSegment(sx+s,sy+s,sx,sy+s));
  signature.add(new LineSegment(sx,sy+s,sx,sy-s));
  sx+=s+sp;

// m
  signature.add(new LineSegment(sx,sy+s,sx,sy-s));
  signature.add(new LineSegment(sx,sy-s,sx+s/2,sy+s/2));
  signature.add(new LineSegment(sx+s/2,sy+s/2,sx+s,sy-s));
  signature.add(new LineSegment(sx+s,sy-s,sx+s,sy+s));
  sx+=s+sp;

// a
  signature.add(new LineSegment(sx,sy+s,sx+s/2,sy-s));
  signature.add(new LineSegment(sx+s/2,sy-s,sx+s,sy+s));
  sx+=s+sp;

// n
  signature.add(new LineSegment(sx,sy+s,sx,sy-s));
  signature.add(new LineSegment(sx,sy-s,sx+s,sy+s));
  signature.add(new LineSegment(sx+s,sy+s,sx+s,sy-s));
  sx+=s+sp;

// e
signature.add(new LineSegment(sx, sy - s, sx, sy + s));       
signature.add(new LineSegment(sx, sy - s, sx + s, sy - s));   
signature.add(new LineSegment(sx, sy, sx + s*0.8, sy));       
signature.add(new LineSegment(sx, sy + s, sx + s, sy + s));   
sx+=s+sp+15;

// J
  signature.add(new LineSegment(sx+s/2,sy-s, sx+s/2,sy+s));
  signature.add(new LineSegment(sx+s/2,sy+s, sx,sy+s));
  sx+=s+sp;

// o
  signature.add(new LineSegment(sx,sy-s,sx+s,sy-s));
  signature.add(new LineSegment(sx+s,sy-s,sx+s,sy+s));
  signature.add(new LineSegment(sx+s,sy+s,sx,sy+s));  
  signature.add(new LineSegment(sx,sy+s,sx,sy-s));
  sx+=s+sp;

// u
  signature.add(new LineSegment(sx,sy-s,sx,sy+s));
  signature.add(new LineSegment(sx,sy+s,sx+s,sy+s));
  signature.add(new LineSegment(sx+s,sy+s,sx+s,sy-s));
  sx+=s+sp;

// v
  signature.add(new LineSegment(sx,sy-s,sx+s/2,sy+s));
  signature.add(new LineSegment(sx+s/2,sy+s,sx+s,sy-s));
  sx+=s+sp;

// e
signature.add(new LineSegment(sx, sy - s, sx, sy + s));     
signature.add(new LineSegment(sx, sy - s, sx + s, sy - s));   
signature.add(new LineSegment(sx, sy, sx + s*0.8, sy));       
signature.add(new LineSegment(sx, sy + s, sx + s, sy + s));   
sx+=s+sp;   


// t
signature.add(new LineSegment(sx, sy - s, sx + s, sy - s));  
signature.add(new LineSegment(sx + s/2, sy - s, sx + s/2, sy + s));

}    
