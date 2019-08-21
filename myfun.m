function f = myfun(x)
ddd=createDiamond(x(1),x(2:4),x(5),x(6),x(7));
global FV
global x0
global F_flag
IN = inpolyhedron(FV,ddd);
s=sum(IN==0);
if(s==0)
f = -x(1);
else
    if(F_flag==0)
        x=x0;
        f = -x(1);
        F_flag=1;
    end
    f=100000;
end