clear all
close all
%% show the obj file at 3D figure
al = fopen('al7KC.obj');

vertex_al = fscanf(al,'v %f %f %f %f %f %f\n',[6, Inf])';
faces_al = fscanf(al,'f %f %f %f\n',[3, Inf])';

fclose(al);

vertex = vertex_al(:,1:3);
allface = faces_al;
colors = vertex_al(:,4:6);
obCen=(max(vertex)+min(vertex))./2;
vertex=[vertex(:,1)-obCen(1) vertex(:,2)-obCen(2) vertex(:,3)-obCen(3)];
%trisurf(faces,vertex(:,1),vertex(:,2),vertex(:,3),'FaceVertexCData', colors,'FaceColor','interp', 'EdgeAlpha', 0);

%% Adding the HSV color cylinder onto the same world space as al7KC.obj, and then do some transformation
% (Hint) You can try to combine 2 objects' vertices, faces together
numOfVert=60;
ang=linspace(0,2*pi,numOfVert+1)';
X=cos(ang);
Y=sin(ang);
topCen=[0 0 0.5]+[0 2.5 -2.5];
botCen=[0 0 -0.5]+[0 2.5 -2.5];
verts = [ X(1:numOfVert),Y(1:numOfVert)+2.5,ones(numOfVert,1)-0.5-2.5;X(1:numOfVert),Y(1:numOfVert)+2.5,zeros(numOfVert,1)-0.5-2.5;topCen; botCen];
faces=[];
topCenIdx=2*numOfVert+1;
botCenIdx=2*numOfVert+2;
vertColors=[];
colorPar=linspace(0,1,numOfVert+1)';
%top color
vertColors=[vertColors;colorPar(1:numOfVert),ones(numOfVert,1),ones(numOfVert,1)];
%down color
vertColors=[vertColors;colorPar(1:numOfVert),zeros(numOfVert,1),zeros(numOfVert,1)];
%top cen bot cen color
vertColors=[vertColors;0,0,1;1,0,0];
RGB=hsv2rgb(vertColors); 
figure;
%top&down
for i=1:numOfVert
    faces=[faces;mod(i,numOfVert)+1 i topCenIdx;mod(i,numOfVert)+1+numOfVert i+numOfVert botCenIdx];
end
%side
for i=1:numOfVert
    faces=[faces;numOfVert+i i mod(i,numOfVert)+1 ; mod(i,numOfVert)+1+numOfVert numOfVert+i  mod(i,numOfVert)+1];
end
faces=faces+size(vertex,1);
allface=[allface ;faces];
vertex=[vertex; verts];
colors=[colors;RGB];
%trisurf(faces,verts(:,1),verts(:,2),verts(:,3),'FaceVertexCData', RGB,'FaceColor','interp','EdgeAlpha', 0);
trisurf(allface,vertex(:,1),vertex(:,2),vertex(:,3),'FaceVertexCData', colors,'FaceColor','interp', 'EdgeAlpha', 0);
%% Lighting (You may need to modify the lighting here)
figure;
trisurf(allface,vertex(:,1),vertex(:,2),vertex(:,3),'FaceVertexCData', colors,'FaceColor','interp', 'EdgeAlpha', 0);
light('Position',[0.0,0.0,5.0]);
lighting phong;
figure;
trisurf(allface,vertex(:,1),vertex(:,2),vertex(:,3),'FaceVertexCData', colors,'FaceColor','interp', 'EdgeAlpha', 0);
%plot with a light source located at infinity and oriented along the direction defined by the vector [-3 -3 -3]
light('Position',[0.0,0.0,5.0],'Style','infinite');
lighting phong;
figure;
trisurf(allface,vertex(:,1),vertex(:,2),vertex(:,3),'FaceVertexCData', colors,'FaceColor','interp', 'EdgeAlpha', 0);
light('Position',[-3 -3 -3],'Style','infinite');
lighting phong;
material([1.0, 0.0, 0.0]);
figure;
trisurf(allface,vertex(:,1),vertex(:,2),vertex(:,3),'FaceVertexCData', colors,'FaceColor','interp', 'EdgeAlpha', 0);
light('Position',[-3 -3 -3],'Style','infinite');
lighting phong;
material([0.1, 1.0, 0.0]);
figure;
trisurf(allface,vertex(:,1),vertex(:,2),vertex(:,3),'FaceVertexCData', colors,'FaceColor','interp', 'EdgeAlpha', 0);
light('Position',[-3 -3 -3],'Style','infinite');
lighting phong;
material([0.1, 0.1, 1.0]);
figure;
trisurf(allface,vertex(:,1),vertex(:,2),vertex(:,3),'FaceVertexCData', colors,'FaceColor','interp', 'EdgeAlpha', 0);
light('Position',[-3 -3 -3],'Style','infinite');
lighting phong;
material([0.1, 0.8, 1.0]);