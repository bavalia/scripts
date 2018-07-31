#include<stdio.h>
#include<math.h>
#include<fstream>
#include<iostream>

using namespace std;

int main()
{
	float D=0.0089,theta,L1,L2,coord[17][3],deg=16,r=2;
	theta=(3.1414*deg)/180.0;
	ofstream outfile;  
   	outfile.open("coordinate16.dat"); 
	L2=(3*D)-((0.5*D)/tan(theta));
	L1=L2+(D/tan(theta));
	coord[0][0]=0; 
	coord[0][1]=0;
	coord[0][2]=0;
	coord[1][0]=0;
	coord[1][1]=-D;
	coord[1][2]=0;
	outfile<< r <<"\n";
	for(int i=0;i<2;i++)
	{
		for(int j=0;j<3;j++)
			outfile << coord[i][j] << "\t";	
		outfile<< endl;  //end line
	}
	coord[1][0]=0;
	coord[1][1]=-D;
	coord[1][2]=0;
	coord[2][0]=L2;
	coord[2][1]=-D;
	coord[2][2]=0;
	outfile<< r <<"\n";
	for(int i=1;i<3;i++)
	{
		for(int j=0;j<3;j++)
			outfile << coord[i][j] << "\t";	
		outfile<< endl;  //end line
	}
	coord[2][0]=L2;
	coord[2][1]=-D;
	coord[2][2]=0;
	coord[3][0]=L1;
	coord[3][1]=0;
	coord[3][2]=0;
	outfile<< r <<"\n";
	for(int i=2;i<4;i++)
	{
		for(int j=0;j<3;j++)
			outfile << coord[i][j] << "\t";	
		outfile<< endl;  //end line
	}
	coord[3][0]=L1;
	coord[3][1]=0;
	coord[3][2]=0;
	coord[4][0]=9*D;
	coord[4][1]=0;
	coord[4][2]=0;
	outfile<< r <<"\n";
	for(int i=3;i<5;i++)
	{
		for(int j=0;j<3;j++)
			outfile << coord[i][j] << "\t";	
		outfile<< endl;  //end line
	}
	coord[4][0]=9*D;
	coord[4][1]=0;
	coord[4][2]=0;
	coord[5][0]=9*D;
	coord[5][1]=4*D/5;
	coord[5][2]=0;
	outfile<< r <<"\n";
	for(int i=4;i<6;i++)
	{
		for(int j=0;j<3;j++)
			outfile << coord[i][j] << "\t";	
		outfile<< endl;  //end line
	}
	coord[5][0]=9*D;
	coord[5][1]=4*D/5;
	coord[5][2]=0;
	coord[6][0]=9*D;
	coord[6][1]=4*D;
	coord[6][2]=0;
	outfile<< r <<"\n";
	for(int i=5;i<7;i++)
	{
		for(int j=0;j<3;j++)
			outfile << coord[i][j] << "\t";	
		outfile<< endl;  //end line
	}
	coord[6][0]=9*D;
	coord[6][1]=4*D;
	coord[6][2]=0;
	coord[7][0]=L1;
	coord[7][1]=4*D;
	coord[7][2]=0;
	outfile<< r <<"\n";
	for(int i=6;i<8;i++)
	{
		for(int j=0;j<3;j++)
			outfile << coord[i][j] << "\t";	
		outfile<< endl;  //end line
	}		
	coord[7][0]=L1;
	coord[7][1]=4*D;
	coord[7][2]=0;
	coord[8][0]=L2;
	coord[8][1]=4*D;
	coord[8][2]=0;
	outfile<< r <<"\n";
	for(int i=7;i<9;i++)
	{
		for(int j=0;j<3;j++)
			outfile << coord[i][j] << "\t";	
		outfile<< endl;  //end line
	}
	coord[8][0]=L2;
	coord[8][1]=4*D;
	coord[8][2]=0;
	coord[9][0]=0;
	coord[9][1]=4*D;
	coord[9][2]=0;
	outfile<< r <<"\n";
	for(int i=8;i<10;i++)
	{
		for(int j=0;j<3;j++)
			outfile << coord[i][j] << "\t";	
		outfile<< endl;  //end line
	}
	coord[9][0]=0;
	coord[9][1]=4*D;
	coord[9][2]=0;
	coord[10][0]=-3*D;
	coord[10][1]=4*D;
	coord[10][2]=0;
	outfile<< r <<"\n";
	for(int i=9;i<11;i++)
	{
		for(int j=0;j<3;j++)
			outfile << coord[i][j] << "\t";	
		outfile<< endl;  //end line
	}
	coord[11][0]=0;
	coord[11][1]=4*D;
	coord[11][2]=0;
	coord[12][0]=0;
	coord[12][1]=0;
	coord[12][2]=0;
	outfile<< r <<"\n";
	for(int i=11;i<13;i++)
	{
		for(int j=0;j<3;j++)
			outfile << coord[i][j] << "\t";	
		outfile<< endl;  //end line
	}
	coord[13][0]=-3*D;
	coord[13][1]=4*D;
	coord[13][2]=0;
	coord[14][0]=-3*D;
	coord[14][1]=0;
	coord[14][2]=0;
	outfile<< r <<"\n";
	for(int i=13;i<15;i++)
	{
		for(int j=0;j<3;j++)
			outfile << coord[i][j] << "\t";	
		outfile<< endl;  //end line
	}
	coord[15][0]=-3*D;
	coord[15][1]=0;
	coord[15][2]=0;
	coord[16][0]=0;
	coord[16][1]=0;
	coord[16][2]=0;
	outfile<< r <<"\n";
	for(int i=15;i<17;i++)
	{
		for(int j=0;j<3;j++)
			outfile << coord[i][j] << "\t";	
		outfile<< endl;  //end line
	}
	
	return 0;
}
