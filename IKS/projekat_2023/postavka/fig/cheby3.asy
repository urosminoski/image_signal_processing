import geometry;
size(10cm);

real Z0=50;

defaultpen(fontsize(9));

void constMatchCircle(pair s22, real gl, pen cpen)
{
pair cl=(gl*conj(s22))/(1-(1-gl)*abs(s22)^2);
real rl=((1-gl)^0.5*(1-abs(s22)^2))/(1-(1-gl)*abs(s22)^2);    
draw(circle(cl,rl),cpen);
}

real rtos(real r, real Z0) {
 real gamma;
 gamma=(r-Z0)/(r+Z0);
 return gamma;
}

pair ztos(pair r, real Z0) {
 pair gamma;
 pair z=(Z0,0);
 gamma=(r-z)/(r+z);
 return gamma;
}

pair stoz(pair s, real Z0) {
 pair zz; 
 pair z=(Z0,0);
 zz=z*(1+s)/(1-s);
 return zz;
}

pair addy(pair z, pair y) {
 pair yrp=1/z+y;
 return (1/yrp);
}

// Constant susceptance circle
void constB(real B, pen tpen)
{
  pair center=(-1,-1/B);
  real radi=abs(1/B);
  path c=circle(center,radi);
  draw(c,tpen);
  clip(unitcircle);

}

// Constant resistance circle
void constR(real R, pen tpen)
{
  pair center=(1-1/(1+R),0);
  real radi=abs(1/(1+R));
  path c=circle(center,radi);
  draw(c,tpen);
}

// Constant impedance circle
void constX(real X, pen tpen)
{
  pair center=(1,1/X);
  real radi=abs(1/X);
  path c=circle(center,radi);
  draw(c,tpen);
  clip(unitcircle);

}

// Constant conductance circle
void constG(real G, pen tpen)
{
  pair center=(-1+1/(1+G),0);
  real radi=abs(1/(1+G));
  path c=circle(center,radi);
  draw(c,tpen);
}

// Draw S parameters from file
// File is in format freq real_part imaginary_part
void drawSP(string fileName, pen contourPen)
{
    file in=input(fileName);
    
    while(!eof(in))
    {
        // ignore first line of the file
        string l=in;
        string[] s=split(l);
        
        guide points;
        //path points;
        while(true)
        {
            string l=in;
            string[] s;
            s=split(l, ",");
            if (s.length !=3) break;
            real re=(real)s[1];
            real im=(real)s[2];
            pair point=(re,im);
            //points=points..point;
            points=points--point;
        }
            draw(points,contourPen);
    }
    close(in);
}

// Draw baseline

pen cpen=linewidth(0.5)+gray(0.5);
pen ccpen=linewidth(0.25)+gray(0.5);
pen bpen=linewidth(1);
pen thickpen=linewidth(0.7);
pen tthickpen=linewidth(2);
pen contourpen=linewidth(1);



void drawSmith()
{
constR(4, ccpen);
constR(2, ccpen);
constR(1, ccpen);
constR(0.33, ccpen);
//constR(0.125, ccpen);

constX(0.2,ccpen);
constX(0.5,ccpen);
constX(1,ccpen);
constX(2,ccpen);
constX(4,ccpen);


constX(-0.2,ccpen);
constX(-0.5,ccpen);
constX(-1,ccpen);
constX(-2,ccpen);
constX(-4,ccpen);


// Draw 50 Ohm circle
pen lpen=linewidth(0.5);
lpen=gray(0.8);

pair center=(0,0);
real r=1;
path c;

// Draw unit circle
c=circle(center,r);
draw(c,bpen);

// Draw real axis
draw((-1,0)--(1,0), ccpen);
}

drawSmith();


pen lpen=linewidth(0.25)+rgb(0,0,1)+dashed;

pen contourPen=linewidth(1)+rgb(1,0,0);
pen contourPen2=linewidth(1)+rgb(0,0,1);
//string filename=stdin;
//drawSP(filename, contourPen);
drawSP("cheby3_1G-8G.csv", contourPen);
drawSP("cheby3_3G-6G.csv", contourPen2);

clip(unitcircle);

