#include <iostream>
#include <cmath>
#include <iomanip>
#include <cstdlib>
#include <fstream>

using namespace std;

double facelines(double x[], double y[], double x_s[], double y_s[]);
double dist(double x1, double x2, double y1, double y2);
double min_4_vals(double z[]);

int main() {
	
	int suspect_num, k = 0, i = 0, j = 0, b = 0, num_suspects;
	double x_values[5], y_values[5], distance[10];
	double x_suspect[5], y_suspect[5], d_suspect[10], sumsquares[num_suspects];
	string suspect, first_name[100], last_name[100];

	cout << "Enter name of suspect file: ";
	cin >> suspect;
	
	ifstream suspect_n;
	suspect_n.open("/Users/tylercusack/Desktop/" + suspect + ".txt");
	
	for (int x_k = 0; x_k < 5; x_k++) {
		suspect_n >> x_suspect[x_k];
		//cout << x_suspect[x_k] << endl;
	}
		
	//cout << endl;	
	for(int y_k = 0; y_k < 5; y_k++) {
		suspect_n >> y_suspect[y_k];
		//cout << y_suspect[y_k] << endl;

	}
	
	ofstream facial_analysis; 
	facial_analysis.open("/Users/tylercusack/Desktop/facial_analysis.csv"); 
	ofstream  suspect_names;
	suspect_names.open("/Users/tylercusack/Desktop/suspect_names.txt");
	
	ifstream face_data;
	face_data.open("/Users/tylercusack/Desktop/face_data.txt");
	face_data >> num_suspects;
	cout << "There are " << num_suspects << " suspects in this file." << endl;
	
	
	while (k < num_suspects) {
		
		face_data >> first_name[k] >> last_name[k];
		facial_analysis << first_name[k] << "," << last_name[k] << ",";
		suspect_names << first_name[k] << " " << last_name[k] << endl;

		//cout << first_name[k] << " " << last_name[k] << endl;
		for (int x_k = 0; x_k < 5; x_k++) {
			face_data >> x_values[x_k];
			facial_analysis << x_values[x_k] << ",";
		}
		
		for(int y_k = 0; y_k < 5; y_k++) {
			face_data >> y_values[y_k];
			facial_analysis << y_values[y_k] << ",";
		}
		
		sumsquares[k] = facelines(x_values, y_values, x_suspect, y_suspect);
		
		facial_analysis << sumsquares[k] << endl;
		//cout << sumsquares[k] << endl; 
		k++;
	}		
	
	
 	cout << "All suspects information successfully read.\n\n";
	
	facial_analysis.close(); 
		
	return 0;	
	
	}



double dist(double x1, double x2, double y1, double y2) {
	
	double d = sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2));
	return d;
}


double facelines(double x[], double y[], double x_s[], double y_s[]) {
	
	int i = 0, k;
	double d_suspect[10], distance[10], sumsquares[25], sums;

	
	distance[0] = dist(x[0], x[1], y[0], y[1]);
	distance[1] = dist(x[1], x[2], y[1], y[2]);
	distance[2] = dist(x[2], x[3], y[2], y[3]);
	distance[3] = dist(x[3], x[4], y[3], y[4]);
 	distance[4] = dist(x[4], x[0], y[4], y[0]);	
	distance[5] = dist(x[0], x[2], y[0], y[2]);
	distance[6] = dist(x[0], x[3], y[0], y[3]);
	distance[7] = dist(x[1], x[3], y[1], y[3]);
	distance[8] = dist(x[1], x[4], y[1], y[4]);
	distance[9] = dist(x[2], x[4], y[2], y[4]);

	d_suspect[0] = dist(x_s[0], x_s[1], y_s[0], y_s[1]);
	d_suspect[1] = dist(x_s[1], x_s[2], y_s[1], y_s[2]);
	d_suspect[2] = dist(x_s[2], x_s[3], y_s[2], y_s[3]);
	d_suspect[3] = dist(x_s[3], x_s[4], y_s[3], y_s[4]);
 	d_suspect[4] = dist(x_s[4], x_s[0], y_s[4], y_s[0]);
	d_suspect[5] = dist(x_s[0], x_s[2], y_s[0], y_s[2]);
	d_suspect[6] = dist(x_s[0], x_s[3], y_s[0], y_s[3]);
	d_suspect[7] = dist(x_s[1], x_s[3], y_s[1], y_s[3]);
	d_suspect[8] = dist(x_s[1], x_s[4], y_s[1], y_s[4]);
	d_suspect[9] = dist(x_s[2], x_s[4], y_s[2], y_s[4]);
	
	while (i <= 10) {
		
		sums += pow(distance[i] - d_suspect[i], 2);
		i++;
	}
	
	sumsquares[i] = sums;
	
	return sumsquares[i];
}
	


/*

1-2
2-3
3-4
4-5
5-1
1-3
1-4
2-4
2-5
3-5

*/