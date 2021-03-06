pay_mat = [5 -6; -5 6];

% p1 - probability for Blue to penetrate the habitat without winning over
% p2 - probability of Infiltrator's visit

syms p1 q1 temp;

p(1) = p1;
p(2) = 1-p1;
q(1) = q1;
q(2) = 1-q1;

value = temp;

for i=1:2
    for j=1:2
        value = value + p(i)*q(j)*pay_mat(i,j);
    end
end
value = simplify(value-temp);

e(1) = double(solve(diff(value,p1)));
e(2) = double(solve(diff(value,q1)));

p1 = e(1);
q1 = e(2);
plot(1-q1,p1,'hb');
xlabel('Probability of nature of message intented by Ambusher(G)')
ylabel('Probability of nature of message assumed by Evader(P)')
axis([0 1 0 1])
hold on

value1 = zeros(1,101*101);
k = 1;
for i = 0:0.01:1
    for j = 0:0.01:1
        value1(k) = 11*i+(12*(1-j))-(22*i*(1-j));
        if (value1(k)<-3)
            plot(j,i,'*r');
        elseif (value1(k)>3)
            plot(j,i,'*c');
        elseif (value1(k)<-2)
            plot(j,i,'*m');
        elseif (value1(k)>2)
            plot(j,i,'*b');
        elseif (abs(value1(k))<0.5)
            plot(j,i,'*y')
        elseif (value1(k)<1 && value1(k)>0.5)
            plot(j,i,'*g')
        elseif (value1(k)>-1 && value1(k)<-0.5)
            plot(j,i,'*k')
        else
            plot(j,i,'*w')
        end
        k = k+1;
    end
end
legend('Equilibrium Point','Worst for Evader', 'Bad for Evader', 'Less acceptable for Evader', 'Acceptable for both', 'More acceptable for Evader','Good for Evader','Best for Evader', 'Location', 'EastOutside')
plot(1-q1,p1,'hb');