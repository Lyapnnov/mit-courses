mu_range = 0:0.01:5.3;
transient = 500;
iterations = 540;
initial_values = 8;


result = zeros(iterations, length(mu_range));
%popmap = @(x, mu) mu*x*(1 - x);
popmap = @(x, mu) x*exp((mu/2)*(1 - x));


% Find Period Doubling Values
mu = 5.369;
currentx = 1.5;
vector = zeros(iterations - transient - 1, 1);
plotx = [1:1:(iterations - transient - 1)];
for i = 1:(iterations - 1)
    currentx = popmap(currentx, mu);
    if i > transient
        vector(i - transient) = currentx;
    end
end
b = unique(vector);
mu
b
length(b)


% startvector = [0.01:3:2.01];
% 
% for s = 1:length(startvector)
%     for m = 1:length(mu_range)
%         currentx = startvector(s);
%         mu = mu_range(m);
%         vector = zeros(iterations - transient - 1, 1);
%         for i = 1:(iterations - 1)
%             currentx = popmap(currentx, mu);
%             if i > transient
%                 vector(i - transient) = currentx;
%             end
%         end
%         plot(mu,vector,'r.','MarkerSize',3)
%         hold on
%     end
% end
% 
% xlabel('$$\mu$$','FontSize',16,'interpreter','latex')
% ylabel('$$x$$', 'Fontsize',16,'interpreter','latex')
% title('Bifurcation Diagram of Population Map')

