
from plotSettings import *
import sys
import numpy as np

if len(sys.argv) != 4:
    print("Usage : python plotgraph.py file.csv ylabel xlabel")
    print("First line of CSV file is ignored")
    print("Other files are in format:")
    print("freq_HZ,value")

def readCSV(fileName):
    inFile = open(fileName, 'r')
    x = []
    y = []
    firstLine = True
    for line in inFile:
        if firstLine:
            firstLine = False
            continue
        line = line.strip()
        if line=="":
            continue
        tmpx, tmpy = line.split(',')
        x.append( float(tmpx) )
        y.append( float(tmpy) )
    x = np.array(x)
    y = np.array(y)
    inFile.close()
    return [x, y]

inputFileName = sys.argv[1]
x, y = readCSV(inputFileName)

ystr = '$'+sys.argv[2]+'$'
xstr = '$'+sys.argv[3]+'$'

plot(x/1e9, y, 'k', linewidth=1.5, aa=True)


xlabel(xstr)
ylabel(ystr)

outFileName = inputFileName.split('.')[0]

tight_layout()
exportGraphics(outFileName)
show()


