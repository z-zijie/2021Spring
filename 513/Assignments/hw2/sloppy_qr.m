%this routine performs qr factorization using householder matrices
%it is correct, but highly inefficient. cs513 students
%will examine its inefficiency and will improve it.
  [m,n]=size(A);               % n is defined as the order of A;
  R=A;                    %the original matrix A is stored
			  %in order to check at the end
			  %that the QR factorization was performed correctly
  Q=eye(m);
  for i=1:n,

%i is a running index for the elimination step. entering
%the i'th step, we have in hand a factroization
%Q*R, with Q the product of the previous Householder
%matrices we used, and R the partially processed matrix (i.e., A_i in the
%notations used in class). During the ith step,
%we generate a new householder matrix H and rewrite Q*R as
%(Q*H)*(H*R). We then replace R H*R and Q by Q*H.
%Initially R is the given matrix, and Q is the identity matrix
     x=R(:,i);                       % `x' is the current i'th column of R
                                     %
     a=norm(x(i:m),2);               % each execution of this line is n 
                                     % operations
				     %
     y=[x(1:i-1)' a zeros(1,m-i)]';  % `y' is the desired i'th column of R
                                     %
     w=x-y;                          % `w' is the vector that determines H
                                     % execution ofabove line is n operation
     if norm(w)~=0,             
        w=w/norm(w);                 % execution ofthis line is n operation
     end			     
                                     
     H=eye(m)-2*w*w';
     Q=Q*H; R=H*R;                   % each execution of this line is 2n^3
                                     % operations
  end
  norm(A-Q*R), norm(eye(m)-Q'*Q)
