function xprime = ExpModel(t, y, p)
xprime = zeros(10,1);
xprime(1) = y(1) * p(1);
xprime(2) = y(2) * p(2);
xprime(3) = y(3) * p(3) + p(4) * y(1);
xprime(4) = y(4) * p(5) + p(6) * y(1);
xprime(5) = y(5) * p(7) + p(8) * y(1);
xprime(6) = y(6) * p(9) + p(10) * y(1);
xprime(7) = y(7) * p(11) + p(12) * y(1) + p(13) * y(2);
xprime(8) = y(8) * p(14) + p(15) * y(2);
xprime(9) = y(9) * p(16) + p(17) * y(2);
xprime(10) = y(10) * p(18) + p(19) * y(2);

end