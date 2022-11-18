%AUFGABE 3
function u = sigma(x);
u = zeros(1, length(x));
for i = 1:length(x)
  if x(i) >= 0
      u(i) = 1;
  end
end 