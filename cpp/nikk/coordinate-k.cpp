#include<stdio.h>
#include<math.h>
#include<fstream>
#include<iostream>

using namespace std;

float D=0.0089,theta,L1,L2,deg=16,r=2;
//float (*coord)[3];  //error: to initialize multidimentional array
//int (*geometry)[2];
float coord[12][3];
int geometry[13][2];
char filename[] = "k.dat";
ofstream outfile; 

int writeEdges()
{
  outfile.open(filename); 

  for (int e=0; e<(sizeof(geometry)/sizeof(*geometry)); e++)
  {
    outfile << r <<"\n";
    for(int i=0; i<2; i++)
    {
      for(int j=0; j<3; j++)
        outfile << coord[geometry[e][i]][j]<< "\t";
      outfile << endl;
    }
  }
  outfile.close();
  return 0;
}

int constructGeometry()
{
  //geometry is constructed by defining edges between two vertices
  //geometry = new int[13][2] {0}; //error to initialize multidimentional array
  geometry[0][0]= 0;  geometry[0][1]= 1; //edge 1, vertex 0 to vertex 1
  geometry[1][0]= 1;  geometry[1][1]= 2;
  geometry[2][0]= 2;  geometry[2][1]= 3;
  geometry[3][0]= 3;  geometry[3][1]= 4;
  geometry[4][0]= 4;  geometry[4][1]= 5;
  geometry[5][0]= 5;  geometry[5][1]= 6;
  geometry[6][0]= 6;  geometry[6][1]= 7;
  geometry[7][0]= 7;  geometry[7][1]= 8;
  geometry[8][0]= 8;  geometry[8][1]= 9;
  geometry[9][0]= 9;  geometry[9][1]= 10;
  geometry[10][0]= 9;  geometry[10][1]= 0;
  geometry[11][0]= 10;  geometry[11][1]= 11;
  geometry[12][0]= 11;  geometry[12][1]= 0;

  return 0;
}

int initializeVertices()
{
  theta=(3.1414*deg)/180.0; 
  L2=(3*D)-((0.5*D)/tan(theta));
  L1=L2+(D/tan(theta));

  //coord = new float[12][3] {0}; //error:cannot initialize multi-dimensional array with initializer
  // all coordinates are by default initialised to 0, except changed.

  coord[0][0]=  0;  coord[0][1]=  0; // 0 -- 0,0,0
                    coord[1][1]= -D; // 1
  coord[2][0]= L2;  coord[2][1]= -D; // 2
  coord[3][0]= L1;
  coord[4][0]=9*D;
  coord[5][0]=9*D;  coord[5][1]=4*D/5;
  coord[6][0]=9*D;  coord[6][1]=4*D;
  coord[7][0]= L1;  coord[7][1]=4*D;
  coord[8][0]= L2;  coord[8][1]=4*D;
                    coord[9][1]=4*D;
  coord[10][0]=-3*D;coord[10][1]=4*D;
  coord[11][0]=-3*D;

  return 0;
}

int main()
{
	// initialize all vertices 
  initializeVertices();

  // construct geometry by defining edges
  constructGeometry();

  // write Geometry to file
  writeEdges();

  return 0;
}
