[number, yy, mm, dd, hh, mmm, temp, psu] = textread("C:\Users\SAMSUNG\OneDrive\Desktop\2018-01-01_2018-01-31_인천.txt", ...
                                                    '%u %u %u %u %u %u %f %f', 'headerlines', 1, ...
                                                    'delimiter', '/:-');

temp = flipud(temp);
psu = flipud(psu);

plotyy(1:314, temp, 1:314, psu)
legend('temp', 'psu')