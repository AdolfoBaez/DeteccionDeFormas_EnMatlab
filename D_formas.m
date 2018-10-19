clear all
close all
im = imread('d_f.png');
img = rgb2gray(im);
BW = im2bw(img);
stats = regionprops(BW,'Perimeter','Area','Centroid','BoundingBox');
figure, imshow(BW)
hold on
for k=1;length(stats)
    thisboundingbox = stats(k).BoundingBox;
    if stats(k).Area>10000
        rectangle('Position',[thisboundingbox(1), thisboundingbox(2), thisboundingbox(3), thisboundingbox(4)], 'EdgeColor','r','LineWidth','2');
    else 
    rectangle('Position',[thisboundingbox(1), thisboundingbox(2), thisboundingbox(3), thisboundingbox(4)], 'EdgeColor','b','LineWidth','2');
    end   
    if stats(k).Perimeter^2/stats(k).Area>18
       text(stats(k).Centroid(1),stats(k).Centroid(2), 'Triangulo', 'Color','r'); 
    elseif stats(k).Perimeter^2/stats(k).Area>14.3
        text(stats(k).Centroid(1),stats(k).Centroid(2), 'Circulo', 'Color','g');
    else 
        text(stats(k).Centroid(1),stats(k).Centroid(2), 'Cuadrado', 'Color','b');
    end    
end    