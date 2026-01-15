PImage album;
PImage maskImg;

PGraphics texteLayer;

String[] mots = {
  "15 steps",
  "When I am king you will be first against the wall",
  "Karma police arrest this man",
  "Everything in its right place",
  "No alarms and no surprises",
  "Nude",
  "Weird fishes",
  "AllI Need",
  "Reckoner",
  "House of Cards",
  "Jigsaw Falling Into Place",
  "Videotape",
  "Come on and let it out",
  "She looks back and you lok back",
  "It's alright",
  "You killed the sound",
  "Kid A",
  "How to disappear Completely",
  "Optimistic",
  "Yesterday I woke up sucking a lemon",
  "OK Computer", 
  "Exit music",
  "Paranoid Android",
  "Why don't you remember my name...",
  "The Daily mail",
};

int phase = 0;
int frameCounter = 0;
float fade = 0;

// L'intervalle entre les phrases
int lastWordTime = 0;
int wordInterval = 150; 

void setup() {
  size(600, 600);
  pixelDensity(1);

  album = loadImage("inrainbows.jpg");
  maskImg = loadImage("mask2.png");

  

  album.resize(width, height);
  maskImg.resize(width, height);

  texteLayer = createGraphics(width, height);

 // Les parametres du calque texte
  texteLayer.beginDraw();
  texteLayer.background(0, 0); 
  texteLayer.textFont(createFont("Arial", 12));
  texteLayer.textAlign(LEFT, TOP);
  texteLayer.endDraw();
}

void draw() {
  background(0);

 
  if (phase == 0) {  
    tint(255, 255 - fade); // on applique le fondu
    image(album, 0, 0);
    noTint();

    fade += 0.85; 
    frameCounter++;
    if (frameCounter > 300) { // on passe a l'interaction (1=interaction et 0= la cover)
      phase = 1;
    }
  }

// phase d'interaction 
  if (phase == 1) {
    afficherTexteMasque();
  }
}

void mouseMoved() {
  if (phase != 1) return;
  if (mouseX < 0 || mouseY < 0 || mouseX >= width || mouseY >= height) return;


  if (millis() - lastWordTime < wordInterval) return;
  lastWordTime = millis();

  texteLayer.beginDraw();

  color c = album.get(mouseX, mouseY); // pour recuperer la couleur du pixel de l'album
  float b = brightness(c); //la luminosite va influencer la taille du texte 
  float ts = map(b, 0, 100, 10, 16);
  texteLayer.textSize(ts);

  String mot = mots[int(random(mots.length))];


  texteLayer.fill(c, 255);
  texteLayer.stroke(0);
  texteLayer.strokeWeight(1.2);
  texteLayer.text(mot, mouseX, mouseY);

  texteLayer.endDraw();
}


//Pour l'affichage avec le masque 
void afficherTexteMasque() {
  loadPixels();
  texteLayer.loadPixels();
  maskImg.loadPixels();

  for (int i = 0; i < pixels.length; i++) {
    if (brightness(maskImg.pixels[i]) <= 50) { // texte ecrit seulement sur les zones noires 
      pixels[i] = texteLayer.pixels[i];
    } else {
      pixels[i] = color(0); // fond noir
    }
  }

  updatePixels();
}
