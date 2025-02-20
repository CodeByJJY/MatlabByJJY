x = linspace(0, 4*pi, 1000);
y = cos(x);

plot(x,y,'r:', 'LineWidth',5)
xlabel('x축', 'FontSize', 20)
ylabel('y축')
title('xy그래프')
hold on

y2 = sin(x);
plot(x, y2, 'b:', 'LineWidth',5)

hold off

xlim([0, 4*pi])