function vol= plotDiamond(dia)
plot3(dia(:,1),dia(:,2),dia(:,3),'c.')
% xlabel('X-axis');
% ylabel('Y-axis');
% zlabel('Z-axis');
% xlim([0 15]);
% ylim([0 15]);
% zlim([0 15]);
[k,vol] = boundary(dia);
hold on;
grid on;

trisurf(k,dia(:,1),dia(:,2),dia(:,3),'Facecolor','blue','FaceAlpha',0.5);
end

