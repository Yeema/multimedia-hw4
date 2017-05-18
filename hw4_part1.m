
clear all; close all; clc;

rbImage = im2double(imread('icon_back.png'));
[h, w, ~] = size(rbImage);
imshow(rbImage);

%% Mouse input
xlabel ('Select at most 100 points along the outline', 'FontName', '微軟正黑體', 'FontSize', 14);
[ ctrlPointX, ctrlPointY ] = ginput(100);
ctrlPointList = [ctrlPointX ctrlPointY];
clickedN = size(ctrlPointList,1);

promptStr = sprintf('%d points selected', clickedN);
xlabel (promptStr, 'FontName', '微軟正黑體', 'FontSize', 14);

%% Calculate Bazier Curve (Your efforts here)
outlineVertexList = ctrlPointList; %Enrich outlineVertexList
%figure; result = drawAndFillPolygon( rbImage, ctrlPointList, outlineVertexList, true, true, true );
%imwrite(result, 'controlPointOnly.png');
sampleLow = 6;
sampleHigh=101;
t_low = linspace(0, 1, sampleLow); 
t_high = linspace(0, 1, sampleHigh);
M = [-1 3 -3 1; 3 -6 3 0; -3 3 0 0; 1 0 0 0];

outlineVertexList = [];
ctrlPointListLow=[];
for I = 1:3:40
    G = zeros(4, 2);
    for J = 0:3
        idx=mod(floor(2.5*(I+J)),100)+1;
        G(J+1, :) = ctrlPointList(idx, :);
    end
    for K = 1:sampleLow
        ctrlPointListLow=[ctrlPointListLow ;G];
        T = [t_low(K).^3, t_low(K).^2, t_low(K), 1];
        outlineVertexList = [outlineVertexList; T*M*G];
    end
end
%% Draw and fill the polygon  Last 3 input arguments: (ctrlPointScattered, polygonPlotted, filled)

figure; result = drawAndFillPolygon( rbImage, ctrlPointListLow, outlineVertexList, true, true, true );
imwrite(result, 'low-low.png');

outlineVertexList = [];
T=[];
for I = 1:3:40
    G = zeros(4, 2);
    for J = 0:3
        idx=mod(floor(2.5*(I+J)),100)+1;
        G(J+1, :) = ctrlPointList(idx, :);
    end
    for K = 1:sampleHigh
        ctrlPointListLow=[ctrlPointListLow; G];
        T = [t_high(K).^3, t_high(K).^2, t_high(K), 1];
        outlineVertexList = [outlineVertexList; T*M*G];
    end
end
figure; result = drawAndFillPolygon( rbImage, ctrlPointListLow, outlineVertexList, true, true, true );
imwrite(result, 'low-high.png');

outlineVertexList = [];
T=[];
for I = 1:3:100
    G = zeros(4, 2);
    for J = 0:3
        idx=mod(I+J,100)+1;
        G(J+1, :) = ctrlPointList(idx, :);
    end
    for K = 1:sampleLow
        T = [t_low(K).^3, t_low(K).^2, t_low(K), 1];
        outlineVertexList = [outlineVertexList; T*M*G];
    end
end
figure; result = drawAndFillPolygon( rbImage, ctrlPointList, outlineVertexList, true, true, true );
imwrite(result, 'high-low.png');

outlineVertexList = [];
T=[];
for I = 1:3:100
    G = zeros(4, 2);
    for J = 0:3
        idx=mod(I+J,100)+1;
        G(J+1, :) = ctrlPointList(idx, :);
    end
    for K = 1:sampleHigh
        T = [t_high(K).^3, t_high(K).^2, t_high(K), 1];
        outlineVertexList = [outlineVertexList; T*M*G];
    end
end
figure; result = drawAndFillPolygon( rbImage, ctrlPointList, outlineVertexList, true, true, true );
imwrite(result, 'high-high.png');

% Part 1 (b)
rbImage4 = imresize(result, 4, 'nearest');
figure;
imshow(rbImage4);
imwrite(rbImage4, '1b_1.png');

rbImage4 = imresize(rbImage, 4, 'nearest');
ctrlPointList4 = ctrlPointList * 4;
outlineVertexList4 = [];
T=[];
for I = 1:3:100
    G = zeros(4, 2);
    for J = 0:3
        idx=mod(I+J,100)+1;
        G(J+1, :) = ctrlPointList4(idx, :);
    end
    for samK = 1:sampleHigh
        T = [t_high(samK).^3, t_high(samK).^2, t_high(samK), 1];
        outlineVertexList4 = [outlineVertexList4; T*M*G];
    end
end
figure; result =drawAndFillPolygon( rbImage4, ctrlPointList4, outlineVertexList4, false, true, true ); 
imwrite(result, '1b_2.png');
