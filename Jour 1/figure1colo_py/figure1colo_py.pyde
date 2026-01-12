def setup():
    size(640, 400)
    background(0)
    colorMode(HSB,360,100,100)
    noFill()

def draw():
    global N,D,X,Y
    N=0
    D=0

    X=width
    Y=height
    hue=0;

    while N<Y: 
        D+=1
        strokeWeight(D)
        stroke(hue%360,100,100)
        hue+=20

        
        N=N+D+1
        X=X-D-10
        Y=Y-D-10

        rect(N,N,X-N,Y-N)
        
        
