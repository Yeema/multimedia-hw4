function makeHSVCylinder()
numOfVert=60;
ang=linspace(0,2*pi,numOfVert+1)';
X=cos(ang);
Y=sin(ang);
topCen=[0 0 0.5];
botCen=[0 0 -0.5];
verts = [ X(1:numOfVert),Y(1:numOfVert),ones(numOfVert,1)-0.5;X(1:numOfVert),Y(1:numOfVert),zeros(numOfVert,1)-0.5;topCen; botCen];
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
    faces=[faces;topCenIdx i mod(i,numOfVert)+1;botCenIdx i+numOfVert mod(i,numOfVert)+1+numOfVert];
end
%side
for i=1:numOfVert
    faces=[faces;numOfVert+i i mod(i,numOfVert)+1 ; mod(i,numOfVert)+1+numOfVert numOfVert+i  mod(i,numOfVert)+1];
end
trisurf(faces,verts(:,1),verts(:,2),verts(:,3),'FaceVertexCData', RGB,'FaceColor','interp','EdgeAlpha', 0);
end