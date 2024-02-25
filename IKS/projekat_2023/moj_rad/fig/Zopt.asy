import graph;
import geometry;

size(12cm, 7cm, IgnoreAspect);

// Drawing function from input csv file.
void drawCSV(string filePath, pen conturePen)
{
	file f = input(filePath).line().csv(); // .line().csv();
	string[][] s;
	while(!eof(f)) { s.push(f.line()); }
	
	real[] x;
	real[] y;

	for(int i=1; i<s.length; ++i)
	{
		real xVal = (real)s[i][0];
		real yVal = (real)s[i][1];
		
		x.push(xVal);
		y.push(yVal);
	}
	
	x = x * 20;
	y = y / max(y);
	draw(graph(x, y), conturePen);
}

string filePath_1	= "1V2_Ropt_20.csv";
string filePath_2	= "2V5_Ropt_20.csv";

pen contourPen_1 	= linewidth(1) + rgb(1, 0, 0);
pen contourPen_2 	= linewidth(1) + rgb(0, 0, 1);

drawCSV(filePath_1, contourPen_1);
drawCSV(filePath_2, contourPen_2);

xaxis("R [$\Omega$]", BottomTop, LeftTicks);
yaxis("Normalized P1dB", LeftRight, RightTicks);







