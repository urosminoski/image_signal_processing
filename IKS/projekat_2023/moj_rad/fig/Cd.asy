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
		real xVal = (real)s[i][0] * 1e-9;
		real yVal = (real)s[i][1] * 1e15;
		
		//if(filePath == "2V5_Cd.csv"){ yVal = yVal * 1.289; }
		
		x.push(xVal);
		y.push(yVal);
	}
	
	y = y / max(y);
	draw(graph(x, y), conturePen);
}

string filePath_1	= "1V2_Cd.csv";
string filePath_2	= "2V5_Cd.csv";

pen contourPen_1 	= linewidth(1) + rgb(1, 0, 0);
pen contourPen_2 	= linewidth(1) + rgb(0, 0, 1);

drawCSV(filePath_1, contourPen_1);
drawCSV(filePath_2, contourPen_2);

xaxis("f [$GHz$]", BottomTop, LeftTicks);
yaxis("Nomralized C", LeftRight, RightTicks);







