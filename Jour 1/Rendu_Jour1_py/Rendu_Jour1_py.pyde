# Exo laisse laisse parler ta créativité!

def setup():
    size(650, 400)
    colorMode(HSB,360,100,100)
    noFill()

# Pour le brin d'ADN central:
def draw_middle_helix(cx):
    r=40
    y=0
    p1=p2=None

    while y<height:
        a=y*0.05+frameCount*0.05

        x1=cx+r*cos(a)
        x2=cx-r*cos(a)
        z=r*sin(a)

        d1=0.5+(z+r)*1.5/(2*r)
        d2=0.5+(-z+r)*1.5/(2*r)

        if p1:
            stroke(180,80,100)
            strokeWeight(2*d1)
            line(p1[0],p1[1],x1,y)

        if p2:
            stroke(300,80,100)
            strokeWeight(2*d2)
            line(p2[0],p2[1],x2,y)

        h = 180+y*120/height
        stroke(h,80,100)
        strokeWeight(2)
        line(x1,y,x2,y)

        stroke((h+60)%360,100,100)
        strokeWeight(4*d1)
        point(x1,y)

        strokeWeight(4*d2)
        point(x2,y)

        p1,p2=(x1,y),(x2,y)
        y+=12

# Pour les brins latéraux: 
def draw_side_helix(cx, rev):
    amp=80
    y=0

    while y<height:
        a=0.15*y+frameCount*0.02*(-1 if rev else 1)

        x1=cx+amp*cos(a)
        x2=cx-amp*cos(a)
        z=amp*sin(a)

        d1=0.5 +(z+amp)*1.5/(2*amp)
        d2=0.5+(-z+amp)*1.5/(2*amp)

        h=180+y*120/height

        stroke(h,80,100)
        strokeWeight(2)
        line(x1,y,x2,y)

        stroke((h+60)%360,100,100)
        strokeWeight(4*d1)
        point(x1,y)

        strokeWeight(4*d2)
        point(x2,y)

        y+=12

def draw():
    background(0)
    draw_middle_helix(width/2)
    draw_side_helix(120,True)
    draw_side_helix(width-120,False)
