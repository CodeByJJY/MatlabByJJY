% Google에 MATLAB textread 라고 검색해보기!!
[a, b, c] = textread("C:\Users\SAMSUNG\OneDrive\Desktop\test.txt", '%u %u %c', ...
                        'headerlines', 1, 'delimiter', '.')
% headerlines 옵션 : csv 파일의 해당 행을 읽어들이지 않는다.
% delimeter 옵션 : 구분자