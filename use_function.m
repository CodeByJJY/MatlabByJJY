a = [1 2 3; 4 5 6; 7 8 9; 10 11 12] % A 만들기

% reshape 함수 : 1열씩 읽어들여서 행렬형태 변환
b = reshape(a, 1, 12)
c = reshape(a, 3, 4)

% 위 아래 변환
d = flipud(a)

% 좌우 반전
e = fliplr(a)

% Transpose Matrix
f = a'

% 행렬 크기
g = size(a)

% 행렬의 가장 큰 길이
h = length(a)