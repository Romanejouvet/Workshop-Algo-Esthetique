#figure 1
def setup():
    size(640, 400)

def draw():

    N=0
    D=0

    X=width
    Y=height

    while N<Y: 
        D+=1
        strokeWeight(D)
        N=N+D+1
        X=X-D-10
        Y=Y-D-10

        rect(N,N,X-N,Y-N)
