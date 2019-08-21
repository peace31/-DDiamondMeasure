function newDia=createDiamond(diameter,avg,degreeX,degreeY,degreeZ)
crown_angle=36.41;%input('Enter Crown Angle in Degrees: ');
crown_heiPer=14.0;%input('Enter %age of Crown Height : ');
gri_thicknessPer=4.8;%input('Enter %age of gridle Thickness : ');
pav_depPer=42.8;%input('Enter %age of Pavilion depth : ');
% crown_angle=34.78;%input('Enter Crown Angle in Degrees: ');

% crown_heiPer=13.2;%input('Enter %age of Crown Height : ');
crown_hei=diameter.*[crown_heiPer/100];

% gri_thicknessPer=4.8;%input('Enter %age of gridle Thickness : ');
gri_thickness=diameter.*[gri_thicknessPer/100];

% pav_depPer=42.8;%input('Enter %age of Pavilion depth : ');
pav_dep=diameter.*[pav_depPer/100];


r1=diameter/2;
tab=r1-(crown_hei./(tand(crown_angle)));

cr=tab+(r1-tab)*0.55;
z1=0;
z2=z1-crown_hei.*0.55;
z3=z1-crown_hei;
z4=z3-gri_thickness;
% z5=z4-0.8*pav_dep;
z6=z4-pav_dep;

dia=zeros(50,3);
dia(:,1)=[0 tab tab.*cosd(45) 0 -tab.*cosd(45) -tab -tab.*cosd(45) 0 tab.*cosd(45) ...
    cr.*cosd(22.5) cr.*cosd(67.5) -cr.*cosd(67.5) -cr.*cosd(22.5) -cr.*cosd(22.5) -cr.*cosd(67.5) cr.*cosd(67.5) cr.*cosd(22.5) ...
    r1 r1.*cosd(45) 0 -r1.*cosd(45) -r1 -r1.*cosd(45) 0 r1.*cosd(45) ...
    r1.*cosd(22.5) r1.*cosd(67.5) -r1.*cosd(67.5) -r1.*cosd(22.5) -r1.*cosd(22.5) -r1.*cosd(67.5) r1.*cosd(67.5) r1.*cosd(22.5) ...
    r1 r1.*cosd(45) 0 -r1.*cosd(45) -r1 -r1.*cosd(45) 0 r1.*cosd(45) ...
    r1.*cosd(22.5) r1.*cosd(67.5) -r1.*cosd(67.5) -r1.*cosd(22.5) -r1.*cosd(22.5) -r1.*cosd(67.5) r1.*cosd(67.5) r1.*cosd(22.5) ...
    0];


dia(:,2)=[0 0 tab.*sind(45) tab tab.*sind(45) 0 -tab.*sind(45) -tab -tab.*sind(45) ...
    cr*sind(22.5) cr.*sind(67.5) cr.*sind(67.5) cr.*sind(22.5) -cr.*sind(22.5) -cr.*sind(67.5) -cr.*sind(67.5) -cr.*sind(22.5) ...
    0 r1.*sind(45) r1 r1.*sind(45) 0 -r1.*sind(45) -r1 -r1.*sind(45) ...
    r1.*sind(22.5) r1.*sind(67.5) r1.*sind(67.5) r1.*sind(22.5) -r1.*sind(22.5) -r1.*sind(67.5) -r1.*sind(67.5) -r1.*sind(22.5) ...
    0 r1.*sind(45) r1 r1.*sind(45) 0 -r1.*sind(45) -r1 -r1.*sind(45) ...
    r1.*sind(22.5) r1.*sind(67.5) r1.*sind(67.5) r1.*sind(22.5) -r1.*sind(22.5) -r1.*sind(67.5) -r1.*sind(67.5) -r1.*sind(22.5) ...
    0];



dia(:,3)=[z1 z1 z1 z1 z1 z1 z1 z1 z1 ...
    z2 z2 z2 z2 z2 z2 z2 z2 ...
    z3 z3 z3 z3 z3 z3 z3 z3 ...
    z3 z3 z3 z3 z3 z3 z3 z3 ...
    z4 z4 z4 z4 z4 z4 z4 z4 ...
    z4 z4 z4 z4 z4 z4 z4 z4 ...
    z6];

MatrixX=[1 0 0;0 cosd(degreeX) -sind(degreeX);0 sind(degreeX) cosd(degreeX)];%rotx(degreeX);
MatrixY=[cosd(degreeY) 0 sind(degreeY);0 1 0; -sind(degreeY) 0 cosd(degreeY)];%roty(degreeY);
MatrixZ=[cosd(degreeZ) -sind(degreeZ) 0; sind(degreeZ) cosd(degreeZ) 0;0 0 1];%rotx(degreeZ);

% RotDia=zeros(50,3);

% for k=1:50
%     TEMP=dia(k,:);
TEMP2=dia';
newX=MatrixX*TEMP2;
newY=MatrixY*newX;
newZ=MatrixZ*newY;
RotDia=newZ';
% end
%  plot3(RotDia(:,1),RotDia(:,2),RotDia(:,3),'b*');
centroid=sum(RotDia)./size(RotDia,1);
zzz=unique(RotDia(:,3));
centroid(:,3)=sum(zzz)/size(zzz,1);

diff=bsxfun(@minus,avg,centroid);
%FINDING DIFFERENCE BETWEEN XYZ COORDINATES OF CENTROID
% diff(:,1)=(avg(:,1)-centroid(1,1));
% diff(:,2)=(avg(:,2)-centroid(1,2));
% diff(:,3)=(avg(:,3)-centroid(1,3));
newDia=zeros(50,3);
newDia=bsxfun(@plus,RotDia,diff);
% ADDING THOSE DIFFERENCES TO ALL ELEMNTS OF DIAMOND
% newDia(:,1)=RotDia(:,1)+diff(:,1);%*ones(50,1);
% newDia(:,2)=RotDia(:,2)+diff(:,2);%*ones(50,1);
% newDia(:,3)=RotDia(:,3)+diff(:,3);%*ones(50,1);
end

