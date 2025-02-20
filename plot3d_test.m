x = linspace(0, 2*pi, 100);
y = linspace(0, 2*pi, 100);

[X, Y] = meshgrid(x, y);

Z = cos(X) + sin(Y);

%% pcolor(X, Y, Z)
pcolor(X, Y, Z)
xlabel('X')
ylabel('y')
zlabel('z')

colorbar;
shading interp;

%% mesh
mesh(X, Y, Z)
xlabel('X')
ylabel('y')
zlabel('z')

colorbar;

%% contourf
contourf(X, Y, Z, 100)
xlabel('X')
ylabel('y')
zlabel('z')

colorbar;

colormap("gray");