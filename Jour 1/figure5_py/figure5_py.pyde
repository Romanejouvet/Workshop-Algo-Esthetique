def setup():
    size(640, 400)
#figure 5


    background(0)
    stroke(255)
    noFill()
    noLoop()


def setup():
    size(800, 600)
    background(0)
    stroke(255)
    noFill()

    A=width/2
    B=height/2

    for I in range(11):
        R=height*0.7

# Pour la spirale !
        W=PI/4
        while W<=3.6:
            X=R*cos(W)
            Y=R*sin(W)

            line(A+X,B-Y,A-Y,B-X)
            line(A-Y,B-X,A-X,B+X)
            line(A-X,B+Y,A+X,B-Y)
            line(A-X,B+Y,A+Y,B+X)
            line(A+Y,B+X,A+X,B-Y)

            R*=0.94
            W+=0.05

    noLoop()
