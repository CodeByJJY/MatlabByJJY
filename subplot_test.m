x = linspace(0, 10*pi, 1000);
y = cos(x);

for (i = 1:1:6)
    subplot(2, 3, i)
    plot(x(100*i:100+i*100), y(100*i:100+i*100))
    xlabel('x')
    ylabel('y')
    title(sprintf('%d초 후 그래프', i))
end