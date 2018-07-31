name = ['/home/patel/knowledge/swaayatt/code/kunal/SLAM_sync/feature_matching_cpp/bin/img_26822.png'];
% name = ['/home/patel/knowledge/swaayatt/code/kunal/SLAM_sync/feature_matching_cpp/bin/img_30230.png'];

img = imread(name);
figure(1), hold off, imshow(img), hold on;

CC = bwconncomp(img)
N_objects = size(CC.PixelIdxList,2)

%figure(1)
mask = uint8(zeros(size(img)));
%imshow(mask), hold on

for i = 1:N_objects
    i
  object = CC.PixelIdxList{i};
  tempImg = uint8(zeros(size(img)));
  tempImg(object)=255;
  [H,T,R] = hough(tempImg);
  peaks = houghpeaks(H,1)
  lines = houghlines(tempImg,T,R,peaks)
  if length(lines) > 0
    xy = [lines(1).point1; lines(1).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','red');
  end
end

