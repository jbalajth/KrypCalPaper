%Extract values from S1aS1b v Field plot

h=gcf;
axesObjs = get(h, 'Children');  %axes handles
dataObjs = get(axesObjs, 'Children');
objTypes = get(dataObjs{1}, 'Type');
xdata = get(dataObjs{2}, 'XData');
ydata = get(dataObjs{2}, 'YData');

%fit data
xfit_2015=xdata{1}; yfit_2015=ydata{1};

%Data points
xdata_points_2015=xdata{2}; ydata_points_2015=ydata{2};
ydata_err_xval_2015=xdata{3}; ydata_err_yval_2015=ydata{3}; 
ydata_err_2015=abs(ydata_err_yval_2015(1:3:end)-ydata_points_2015);

xdata_err_xval_2015=xdata{4}; xdata_err_yval_2015=ydata{4}; 
xdata_err_2015=abs(xdata_err_xval_2015(1:3:end)-xdata_points_2015);

%% Second line

%fit data
xfit_2014=xdata{5}; yfit_2014=ydata{5};

%Data points
xdata_points_2014=xdata{6}; ydata_points_2014=ydata{6};
ydata_err_xval_2014=xdata{7}; ydata_err_yval_2014=ydata{7}; 
ydata_err_2014=abs(ydata_err_yval_2014(1:3:end)-ydata_points_2014);

xdata_err_xval_2014=xdata{8}; xdata_err_yval_2014=ydata{8}; 
xdata_err_2014=abs(xdata_err_xval_2014(1:3:end)-xdata_points_2014);

%% Remove NaN
cut_2014=~isnan(xdata_points_2014);
cut_2015=~isnan(ydata_points_2015);

xdata_points_2014=xdata_points_2014(cut_2014);
ydata_points_2014=ydata_points_2014(cut_2014);
xdata_err_2014=xdata_err_2014(cut_2014);
ydata_err_2014=ydata_err_2014(cut_2014);

xdata_points_2015=xdata_points_2015(cut_2015);
ydata_points_2015=ydata_points_2015(cut_2015);
xdata_err_2015=xdata_err_2015(cut_2015);
ydata_err_2015=ydata_err_2015(cut_2015);

%Print to text file

fid=fopen('S1aS1b_v_Field_2014.txt','w');
for i=1:length(xdata_points_2014)
    fprintf(fid,'%d %d %d %d \n', xdata_points_2014(i),ydata_points_2014(i),xdata_err_2014(i),ydata_err_2014(i));
end

fclose('all');

fid=fopen('S1aS1b_v_Field_2015.txt','w');
for i=1:length(xdata_points_2015)
    fprintf(fid,'%d %d %d %d \n', xdata_points_2015(i),ydata_points_2015(i),xdata_err_2015(i),ydata_err_2015(i));
end

fclose('all');

%% Get fit values

xfit