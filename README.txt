Face-Rec uses five pre-determined data points that define the x- and y-coordinates of the outsides of the eyes, bridge of the nose, and outsides of the mouth. The following is done in C++ and Matlab respectively:

C++
 •Reads the number of matches, names, and coordinates from the input file
 •Stores these numbers and names in an array 
 •Calculates the distances between ten pairs of the coordinates 
 •Outputs to a .CSV file for use in Matlab

Matlab
 •Creates a matrix based on the .CSV file, storing names and coordinate pairs
 •Sorts matches based on “score” - i.e. how close they are to the suspect
 •Plots the closest four matches overlaid on the suspect to show accuracy

This is essentially a rather primitive version of FaceBook’s DeepFace algorithm that is used to auto-tag photos uploaded to their site. 

Plans to develop this code further for multi-purpose uses are in progress.

