import processing.sound.*;

// Pour le son 
FFT fft;
SoundFile player;
int fftSize = 1024;



// Pour que visuellement ca soit pas trop rapide
int fractalTimer = 0;
int fractalInterval = 6;

int noiseTimer = 0;
int noiseInterval = 10;

void setup() {
  size(850, 850);
  colorMode(HSB, 360, 100, 100);
  frameRate(60);
  background(0);

  player = new SoundFile(this, "Everything In Its Right Place.mp3");
  player.loop();
  fft = new FFT(this, fftSize);
  fft.input(player);

//Les branches de base dans les coins 
  branches.add(new Branch(-width/2, -height/2, PI/4, 0));
  branches.add(new Branch(width/2, -height/2, 3*PI/4, 0));
  branches.add(new Branch(-width/2, height/2, -PI/4, 0));
  branches.add(new Branch(width/2, height/2, -3*PI/4, 0));
}

void draw() {
  translate(width/2, height/2);

  fft.analyze();
  float bass = calcAvgFreq(20, 140);
  float mid = calcAvgFreq(140, 2500);
  float treble = calcAvgFreq(2500, 10000);

  drawSpeaker();

//Pour les cercles interieurs
  fractalTimer++;
  if (fractalTimer >= fractalInterval) {
    drawFractalWave(bass, mid, treble);
    fractalTimer = 0;
  }

//Pour le bruit
  noiseTimer++;
  if (noiseTimer >= noiseInterval) {
    drawSketchLines();
    noiseTimer = 0;
  }

//Pour les branches 
  ArrayList<Branch> newBranches = new ArrayList<Branch>();
  for (Branch b : branches) {
    b.update();
    Branch[] children = b.tryBranch();
    for (Branch c : children) {
      if (c != null) newBranches.add(c);
    }
    b.display();
  }
  branches.addAll(newBranches);
}

// Les parametres du systeme fractal 
ArrayList<Branch> branches = new ArrayList<Branch>();
float branchSpeed = 0.6;     // vitesse initiale
int maxDepth = 6;
float angle = PI/6;
float branchLength = 60;

// Tout ce qui est structure de données d'une branche 
class Branch {
  float x, y;
  float dir;
  int depth;
  float len = 0;
  boolean branched = false;
  ArrayList<PVector> history = new ArrayList<PVector>();

  Branch(float startX, float startY, float dir, int depth) {
    x = startX;
    y = startY;
    this.dir = dir;
    this.depth = depth;
    history.add(new PVector(x, y));
  }

  void update() {
    // vitesse qui ralentit avec la longueur
    float speed = branchSpeed / (1 + len * 0.02);
    speed = max(speed, 0.03); // jamais totalement immobile

    len += speed;
    float x2 = x + cos(dir) * len;
    float y2 = y + sin(dir) * len;
    history.add(new PVector(x2, y2));
  }

  Branch[] tryBranch() {
    Branch[] children = new Branch[2];
    if (!branched && len >= branchLength && depth < maxDepth) {
      PVector end = history.get(history.size()-1);
      children[0] = new Branch(end.x, end.y, dir - angle, depth + 1);
      children[1] = new Branch(end.x, end.y, dir + angle, depth + 1);
      branched = true;
    }
    return children;
  }

  void display() {
    stroke(0, 0, 100);
    strokeWeight(map(depth, 0, maxDepth, 3, 1));
    for (int i = 0; i < history.size()-1; i++) {
      PVector p1 = history.get(i);
      PVector p2 = history.get(i+1);
      line(p1.x, p1.y, p2.x, p2.y);
    }
  }
}

// Pour le visuel !
void drawSpeaker() {
  noFill();
  stroke(0, 0, 100);
  strokeWeight(6);
  ellipse(0, 0, 500, 500);
  strokeWeight(3);
  ellipse(0, 0, 320, 320);
  fill(0, 0, 100);
  ellipse(0, 0, 20, 20);
  fill(0, 100, 100);
  ellipse(0, 0, 10, 10);
}

void drawFractalWave(float bass, float mid, float treble) {
  int layers = (int)map(bass, 0, 0.1, 3, 8);
  float maxRadius = map(bass, 0, 0.1, 120, 240);

  for (int l = 0; l < layers; l++) {
    float rBase = map(l, 0, layers, 60, maxRadius);
    strokeWeight(map(mid, 0, 0.05, 1, 4));
    stroke(0, 0, 100, 70);
    noFill();

    beginShape();
    for (int a = 0; a < 360; a += 6) {
      float n = noise(cos(radians(a)) * 0.8 + l * 10,
                      sin(radians(a)) * 0.8 + frameCount * 0.02);
      float deform = map(n, 0, 1, -25, 60)
                     * map(treble, 0, 0.02, 0.6, 1.5);
      float r = rBase + deform;
      vertex(cos(radians(a)) * r, sin(radians(a)) * r);
    }
    endShape(CLOSE);
  }
}

void drawSketchLines() {
  stroke(0, 0, 100, 25);
  strokeWeight(1);
  for (int i = 0; i < 25; i++) {
    line(random(-450, 450), random(-450, 450),
         random(-450, 450), random(-450, 450));
  }
}

//Pour les FFT 
float calcAvgFreq(float freqStart, float freqEnd) {
  int startBin = (int)(freqStart / (44100.0/2) * fftSize);
  int endBin = (int)(freqEnd / (44100.0/2) * fftSize);

  float sum = 0;
  int count = 0;
  for (int i = startBin; i <= endBin; i++) {
    sum += fft.spectrum[i];
    count++;
  }
  return count > 0 ? sum / count : 0;
}
