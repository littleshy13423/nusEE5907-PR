% 指定要读取的文件夹路径
folderPath = '0I'; % 替换为实际文件夹路径

% 使用dir函数获取文件夹中的所有文件信息
fileList = dir(fullfile(folderPath, '*.jpg')); % 替换 '*.jpg' 为您想要读取的图片文件扩展名

% 循环读取所有图片
for i = 1:length(fileList)
    % 从fileList中获取当前文件的文件名
    filename = fullfile(folderPath, fileList(i).name);

    % 使用imread函数读取图片
    image = imread(filename);
    
    % 在这里可以对每个图片进行进一步处理，例如将其调整大小、转换为黑白等

    % 将每个图像转换为32x32的黑白图像并保存：
    resized_image = imresize(image, [32, 32]);
    bw_image = rgb2gray(resized_image);
    output_filename = ['bw_', fileList(i).name];
    imwrite(bw_image, output_filename);
end