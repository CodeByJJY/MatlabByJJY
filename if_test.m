a = [1 2 3 1 0 1];

for i=1:1:length(a)
    if a(i) == 1
        disp('a는 1입니다.')
    elseif a(i) == 2
        disp('a는 2입니다.')
    else
        disp('a는 1이나 2가 아닙니다.')
    end
end