fileName = 'Gogh';
extension = '.png';
img = imread(strcat(fileName, extension));

figure(1);
imshow(img);

%{
rotate_90 = rot90(img);
figure(2);
imshow(rotate_90);

flip_1 = flip(img, 3);
figure(3);
imshow(flip_1);
%}

%{
for i = 1:size(img,1)/3
    for j = 1:size(img,2)/2
        temp = img(i, j, :);
        img(i, j, :) = img(i, size(img,2) - j, :);
        img(i, size(img,2) - j, :) = temp;
    end
end

for k = 1 : 20
    for i = 1 : size(img,1)/3
        temp = img(i, size(img,2), :);
        for j = size(img,2) :-1 :2
            img(i, j, :) = img(i, j - 1, :);
        end
        img(i, 1, :) = temp;
    end
end
figure(2);
imshow(img);
%}

%reset image
img = imread(strcat(fileName, extension));

i_start = round(size(img,1)/3) - 28;
i_end = round(size(img,1)/3) - 10;
j_start = round(size(img,2)/4) + 78;
j_end = round(size(img,2)/4 + 115);


for j = j_start : j_end
    i_count = 1;
    for i = i_start : i_end
        temp = img(i_end + i_count, j, :);
        img(i_end + i_count, j, :) = img(i, j, :);
        img(i, j, :) = temp;
        
        i_count = i_count + 1;
    end
end

imshow(img);
