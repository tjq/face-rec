clc
format bank

suspect_file = input('Enter the suspect file name: ', 's');
file_path = strcat('/Users/tylercusack/Desktop/', suspect_file, '.txt');

[firstnames, lastnames, x1, x2, x3, x4, x5, y1, y2, y3, y4, y5, sumsquares] = textread('/Users/tylercusack/Desktop/facial_analysis.csv','%s%s%f%f%f%f%f%f%f%f%f%f%f', 'delimiter', ',');
[x1_s, x2_s, x3_s, x4_s, x5_s, y1_s, y2_s, y3_s, y4_s, y5_s] = textread(file_path, '%f%f%f%f%f%f%f%f%f%f', 'delimiter', '\n');

x_coords = horzcat(x1, x2, x3, x4, x5);
y_coords = horzcat(y1, y2, y3, y4, y5);

suspect_x_coords = horzcat(x1_s, x2_s, x3_s, x4_s, x5_s);
suspect_y_coords = horzcat(y1_s, y2_s, y3_s, y4_s, y5_s);

suspect_name = strcat(firstnames, {' '}, lastnames);

%finding the index of the four minimums
[~,min_index] = sort(sumsquares);
index = min_index(1:4);
x_coords(index(1),1:5);
y_coords(index(1),1:5);

figure('name','Closest Matches')

%plot first suspect
subplot(2,2,1)
plot(x_coords(index(1),1:5), y_coords(index(1),1:5),'ro', 'markers', 15);
hold on
plot(x_coords(index(1),1:5), y_coords(index(1),1:5),'b-')
hold on
plot([x_coords(index(1),1);x_coords(index(1),5)],[y_coords(index(1),1);y_coords(index(1),5)],'b-');
axis([0 5 2 5]);
sus1 = x_coords(index(1),1:5);
title(suspect_name(index(1)));
text(1.25,2.25,['score = ',num2str(sumsquares(index(1),:))]); 

%plot second suspect
subplot(2,2,2)
plot(x_coords(index(2),1:5), y_coords(index(2),1:5),'ro', 'markers', 15);
hold on
plot(x_coords(index(2),1:5), y_coords(index(2),1:5),'b-');
hold on
plot([x_coords(index(2),1);x_coords(index(2),5)],[y_coords(index(2),1);y_coords(index(2),5)],'b-');
axis([0 5 2 5]);
sus2 = x_coords(index(2),1:5);
title(suspect_name(index(2)));
text(1.25,2.25,['score = ',num2str(sumsquares(index(2),:))]);

%plot third suspect
subplot(2,2,3)
plot(x_coords(index(3),1:5), y_coords(index(3),1:5),'ro', 'markers', 15);
hold on
plot(x_coords(index(3),1:5), y_coords(index(3),1:5),'b-')
hold on
plot([x_coords(index(3),1);x_coords(index(3),5)],[y_coords(index(3),1);y_coords(index(3),5)],'b-');
axis([0 5 2 5]);
sus3 = x_coords(index(3),1:5);
title(suspect_name(index(3)));
text(1.25,2.25,['score = ',num2str(sumsquares(index(3),:))]);

%plot fourth suspect
subplot(2,2,4)
plot(x_coords(index(4),1:5), y_coords(index(4),1:5),'ro', 'markers', 15);
hold on
plot(x_coords(index(4),1:5), y_coords(index(4),1:5),'b-')
hold on
plot([x_coords(index(4),1);x_coords(index(4),5)],[y_coords(index(4),1);y_coords(index(4),5)],'b-');
axis([0 5 2 5]);
sus4 = x_coords(index(4),1:5);
title(suspect_name(index(4)));
text(1.25,2.25,['score = ',num2str(sumsquares(index(4),:))]);


figure('name', 'Overlay Comparison') %overlay of all suspects

%plot first suspect
plot(x_coords(index(1),1:5), y_coords(index(1),1:5),'ro', 'markers', 15);
hold on
line1 = plot(x_coords(index(1),1:5), y_coords(index(1),1:5),'g-');
hold on
plot([x_coords(index(1),1);x_coords(index(1),5)],[y_coords(index(1),1);y_coords(index(1),5)],'g-');
axis([0 5 2 5]);
sus1 = x_coords(index(1),1:5);

%plot second suspect
plot(x_coords(index(2),1:5), y_coords(index(2),1:5),'ro', 'markers', 15);
hold on
line2 = plot(x_coords(index(2),1:5), y_coords(index(2),1:5),'m-');
hold on
plot([x_coords(index(2),1);x_coords(index(2),5)],[y_coords(index(2),1);y_coords(index(2),5)],'m-');
axis([0 5 2 5]);
sus2 = x_coords(index(2),1:5);

%plot third suspect
plot(x_coords(index(3),1:5), y_coords(index(3),1:5),'ro', 'markers', 15);
hold on
line3 = plot(x_coords(index(3),1:5), y_coords(index(3),1:5),'y-');
hold on
plot([x_coords(index(3),1);x_coords(index(3),5)],[y_coords(index(3),1);y_coords(index(3),5)],'y-');
axis([0 5 2 5]);
sus3 = x_coords(index(3),1:5);

%plot fourth suspect
plot(x_coords(index(4),1:5), y_coords(index(4),1:5),'ro', 'markers', 15);
hold on
line4 = plot(x_coords(index(4),1:5), y_coords(index(4),1:5),'b-');
hold on
plot([x_coords(index(4),1);x_coords(index(4),5)],[y_coords(index(4),1);y_coords(index(4),5)],'b-');
axis([0 5 2 5]);
sus4 = x_coords(index(4),1:5);

legend([line1 line2 line3 line4], [suspect_name(index(1)), suspect_name(index(2)), suspect_name(index(3)), suspect_name(index(4))]);

figure('name', 'Closest Match and Suspect Side-by-Side')

%top suspect plot
subplot(3,1,1)
plot(x_coords(index(1),1:5), y_coords(index(1),1:5),'ro', 'markers', 15);
hold on
plot(x_coords(index(1),1:5), y_coords(index(1),1:5),'b-')
hold on
plot([x_coords(index(1),1);x_coords(index(1),5)],[y_coords(index(1),1);y_coords(index(1),5)],'b-');
axis([0 5 2 5]);
sus1 = x_coords(index(1),1:5);
title(suspect_name(index(1)));

%plot the actual suspect
subplot(3,1,2)
plot(suspect_x_coords(1,1:5), suspect_y_coords(1,1:5),'ro', 'markers', 15);
hold on
plot(suspect_x_coords(1,1:5), suspect_y_coords(1,1:5),'g-')
hold on
plot([suspect_x_coords(1,1);suspect_x_coords(1,5)],[suspect_y_coords(1,1);suspect_y_coords(1,5)],'g-');
axis([0 5 2 5]);
suspect = suspect_x_coords(1,1:5);
title(suspect_file)

%overlay of suspects
subplot(3,1,3)
plot(x_coords(index(1),1:5), y_coords(index(1),1:5),'ro', 'markers', 15);
hold on
comparison1 = plot(x_coords(index(1),1:5), y_coords(index(1),1:5),'b-');
hold on
plot([x_coords(index(1),1);x_coords(index(1),5)],[y_coords(index(1),1);y_coords(index(1),5)],'b-');
axis([0 5 2 5]);
sus1 = x_coords(index(1),1:5);
plot(suspect_x_coords(1,1:5), suspect_y_coords(1,1:5),'ro', 'markers', 15);
hold on
comparison2 = plot(suspect_x_coords(1,1:5), suspect_y_coords(1,1:5),'g-');
hold on
plot([suspect_x_coords(1,1);suspect_x_coords(1,5)],[suspect_y_coords(1,1);suspect_y_coords(1,5)],'g-');
axis([0 5 2 5]);
suspect = suspect_x_coords(1,1:5);

legend([comparison1, comparison2], [suspect_name(index(1)) suspect_file]);


 
 

