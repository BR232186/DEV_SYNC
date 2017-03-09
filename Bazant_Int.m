function [P,W] = Bazant_Int(cs)

% "f" is the integrating function
% "cs" is the polynomial type chosen for the numerical integration 
% "int" is the result of the numerical integration

% The following numerical integration on the surface of a sphere is based
% on the paper "Efficient Numerical Integration on the Surface of a 
% Sphere" (Bazant, Z.P.; Oh, B.H. - Math. u. Mech. - 1986)

% cs 1 --> 42  points, 9th degree, fully symmetric formula
% cs 2 --> 66  points, 9th degree, fully symmetric formula
% cs 3 --> 74  points, 9th degree, fully symmetric formula
% cs 4 --> 42  points, 9th degree, formula without full symmetry
% cs 5 --> 122 points, 9th degree, formula without full symmetry

% P(:,1) - x values of quadrature, constrained to unit sphere
% P(:,2) - y values of quadrature, constrained to unit sphere
% P(:,3) - z values of quadrature, constrained to unit sphere
% W      - quadrature weights, normalized to $4\pi$. 

if cs == 1;
    
    P = zeros(21,3);

    P(1, :) = [1             , 0             , 0             ];
    P(2, :) = [0             , 1             , 0             ];
    P(3, :) = [0             , 0             , 1             ];
    P(4, :) = [0.707106781187, 0.707106781187, 0             ];
    P(5, :) = [0.707106781187,-0.707106781187, 0             ];
    P(6, :) = [0.707106781187, 0             , 0.707106781187];
    P(7, :) = [0.707106781187, 0             ,-0.707106781187];
    P(8, :) = [0             , 0.707106781187, 0.707106781187];
    P(9, :) = [0             , 0.707106781187,-0.707106781187];
    P(10,:) = [0.387907304067, 0.387907304067, 0.836095596749];
    P(11,:) = [0.387907304067, 0.387907304067,-0.836095596749];
    P(12,:) = [0.387907304067,-0.387907304067, 0.836095596749];
    P(13,:) = [0.387907304067,-0.387907304067,-0.836095596749];
    P(14,:) = [0.387907304067, 0.836095596749, 0.387907304067];
    P(15,:) = [0.387907304067, 0.836095596749,-0.387907304067];
    P(16,:) = [0.387907304067,-0.836095596749, 0.387907304067];
    P(17,:) = [0.387907304067,-0.836095596749,-0.387907304067];
    P(18,:) = [0.836095596749, 0.387907304067, 0.387907304067];
    P(19,:) = [0.836095596749, 0.387907304067,-0.387907304067];
    P(20,:) = [0.836095596749,-0.387907304067, 0.387907304067];
    P(21,:) = [0.836095596749,-0.387907304067,-0.387907304067];
    
    W = zeros(21,1);
    
    W(1)  = 0.0265214244093;
    W(2)  = 0.0265214244093;
    W(3)  = 0.0265214244093;
    W(4)  = 0.0199301476312;
    W(5)  = 0.0199301476312;
    W(6)  = 0.0199301476312;
    W(7)  = 0.0199301476312;
    W(8)  = 0.0199301476312;
    W(9)  = 0.0199301476312;
    W(10) = 0.0250712367487;
    W(11) = 0.0250712367487;
    W(12) = 0.0250712367487;
    W(13) = 0.0250712367487;
    W(14) = 0.0250712367487;
    W(15) = 0.0250712367487;
    W(16) = 0.0250712367487;
    W(17) = 0.0250712367487;
    W(18) = 0.0250712367487;
    W(19) = 0.0250712367487;
    W(20) = 0.0250712367487;
    W(21) = 0.0250712367487;
    
elseif cs == 2;
    
    P = zeros(33,3);

    P(1, :) = [1             , 0             , 0             ];
    P(2, :) = [0             , 1             , 0             ];
    P(3, :) = [0             , 0             , 1             ];
    P(4, :) = [0.707106781187, 0.707106781187, 0             ];
    P(5, :) = [0.707106781187,-0.707106781187, 0             ];
    P(6, :) = [0.707106781187, 0             , 0.707106781187];
    P(7, :) = [0.707106781187, 0             ,-0.707106781187];
    P(8, :) = [0             , 0.707106781187, 0.707106781187];
    P(9, :) = [0             , 0.707106781187,-0.707106781187];
    P(10,:) = [0.933898956394, 0.357537045978, 0             ];
    P(11,:) = [0.933898956394,-0.357537045978, 0             ];
    P(12,:) = [0.357537045978, 0.933898956394, 0             ];
    P(13,:) = [0.357537045978,-0.933898956394, 0             ];
    P(14,:) = [0.933898956394, 0             , 0.357537045978];
    P(15,:) = [0.933898956394, 0             ,-0.357537045978];
    P(16,:) = [0.357537045978, 0             , 0.933898956394];
    P(17,:) = [0.357537045978, 0             ,-0.933898956394];
    P(18,:) = [0             , 0.933898956394, 0.357537045978];
    P(19,:) = [0             , 0.933898956394,-0.357537045978];
    P(20,:) = [0             , 0.357537045978, 0.933898956394];
    P(21,:) = [0             , 0.357537045978,-0.933898956394];
    P(22,:) = [0.437263676092, 0.437263676092, 0.785875915868];
    P(23,:) = [0.437263676092, 0.437263676092,-0.785875915868];
    P(24,:) = [0.437263676092,-0.437263676092, 0.785875915868];
    P(25,:) = [0.437263676092,-0.437263676092,-0.785875915868];
    P(26,:) = [0.437263676092, 0.785875915868, 0.437263676092];
    P(27,:) = [0.437263676092, 0.785875915868,-0.437263676092];
    P(28,:) = [0.437263676092,-0.785875915868, 0.437263676092];
    P(29,:) = [0.437263676092,-0.785875915868,-0.437263676092];
    P(30,:) = [0.785875915868, 0.437263676092, 0.437263676092];
    P(31,:) = [0.785875915868, 0.437263676092,-0.437263676092];
    P(32,:) = [0.785875915868,-0.437263676092, 0.437263676092];
    P(33,:) = [0.785875915868,-0.437263676092,-0.437263676092];
    
    W = zeros(33,1);
    
    W(1)  = 0.00985353993433;
    W(2)  = 0.00985353993433;
    W(3)  = 0.00985353993433;
    W(4)  = 0.01629696858860;
    W(5)  = 0.01629696858860;
    W(6)  = 0.01629696858860;
    W(7)  = 0.01629696858860;
    W(8)  = 0.01629696858860;
    W(9)  = 0.01629696858860;
    W(10) = 0.01347888440080;
    W(11) = 0.01347888440080;
    W(12) = 0.01347888440080;
    W(13) = 0.01347888440080;
    W(14) = 0.01347888440080;
    W(15) = 0.01347888440080;
    W(16) = 0.01347888440080;
    W(17) = 0.01347888440080;
    W(18) = 0.01347888440080;
    W(19) = 0.01347888440080;
    W(20) = 0.01347888440080;
    W(21) = 0.01347888440080;
    W(22) = 0.01757591298800;
    W(23) = 0.01757591298800;
    W(24) = 0.01757591298800;
    W(25) = 0.01757591298800;
    W(26) = 0.01757591298800;
    W(27) = 0.01757591298800;
    W(28) = 0.01757591298800;
    W(29) = 0.01757591298800;
    W(30) = 0.01757591298800;
    W(31) = 0.01757591298800;
    W(32) = 0.01757591298800;
    W(33) = 0.01757591298800;
     
elseif cs == 3;
    
    P = zeros(37,3);

    P(1, :) = [1             , 0             , 0             ];
    P(2, :) = [0             , 1             , 0             ];
    P(3, :) = [0             , 0             , 1             ];
    P(4, :) = [0.707106781187, 0.707106781187, 0             ];
    P(5, :) = [0.707106781187,-0.707106781187, 0             ];
    P(6, :) = [0.707106781187, 0             , 0.707106781187];
    P(7, :) = [0.707106781187, 0             ,-0.707106781187];
    P(8, :) = [0             , 0.707106781187, 0.707106781187];
    P(9, :) = [0             , 0.707106781187,-0.707106781187];
    P(10,:) = [0.951077869651, 0.308951267775, 0             ];
    P(11,:) = [0.951077869651,-0.308951267775, 0             ];
    P(12,:) = [0.308951267775, 0.951077869651, 0             ];
    P(13,:) = [0.308951267775,-0.951077869651, 0             ];
    P(14,:) = [0.951077869651, 0             , 0.308951267775];
    P(15,:) = [0.951077869651, 0             ,-0.308951267775];
    P(16,:) = [0.308951267775, 0             , 0.951077869651];
    P(17,:) = [0.308951267775, 0             ,-0.951077869651];
    P(18,:) = [0             , 0.951077869651, 0.308951267775];
    P(19,:) = [0             , 0.951077869651,-0.308951267775];
    P(20,:) = [0             , 0.308951267775, 0.951077869651];
    P(21,:) = [0             , 0.308951267775,-0.951077869651];
    P(22,:) = [0.335154591939, 0.335154591939, 0.880535518310];
    P(23,:) = [0.335154591939, 0.335154591939,-0.880535518310];
    P(24,:) = [0.335154591939,-0.335154591939, 0.880535518310];
    P(25,:) = [0.335154591939,-0.335154591939,-0.880535518310];
    P(26,:) = [0.335154591939, 0.880535518310, 0.335154591939];
    P(27,:) = [0.335154591939, 0.880535518310,-0.335154591939];
    P(28,:) = [0.335154591939,-0.880535518310, 0.335154591939];
    P(29,:) = [0.335154591939,-0.880535518310,-0.335154591939];
    P(30,:) = [0.880535518310, 0.335154591939, 0.335154591939];
    P(31,:) = [0.880535518310, 0.335154591939,-0.335154591939];
    P(32,:) = [0.880535518310,-0.335154591939, 0.335154591939];
    P(33,:) = [0.880535518310,-0.335154591939,-0.335154591939];
    P(34,:) = [0.577350269190, 0.577350269190, 0.577350269190];
    P(35,:) = [0.577350269190, 0.577350269190,-0.577350269190];
    P(36,:) = [0.577350269190,-0.577350269190, 0.577350269190];
    P(37,:) = [0.577350269190,-0.577350269190,-0.577350269190];
    
    W = zeros(33,1);
    
    W(1)  = 0.01072388573030;
    W(2)  = 0.01072388573030;
    W(3)  = 0.01072388573030;
    W(4)  = 0.02114160951980;
    W(5)  = 0.02114160951980;
    W(6)  = 0.02114160951980;
    W(7)  = 0.02114160951980;
    W(8)  = 0.02114160951980;
    W(9)  = 0.02114160951980;
    W(10) = 0.00535505590837;
    W(11) = 0.00535505590837;
    W(12) = 0.00535505590837;
    W(13) = 0.00535505590837;
    W(14) = 0.00535505590837;
    W(15) = 0.00535505590837;
    W(16) = 0.00535505590837;
    W(17) = 0.00535505590837;
    W(18) = 0.00535505590837;
    W(19) = 0.00535505590837;
    W(20) = 0.00535505590837;
    W(21) = 0.00535505590837;
    W(22) = 0.01677709091560;
    W(23) = 0.01677709091560;
    W(24) = 0.01677709091560;
    W(25) = 0.01677709091560;
    W(26) = 0.01677709091560;
    W(27) = 0.01677709091560;
    W(28) = 0.01677709091560;
    W(29) = 0.01677709091560;
    W(30) = 0.01677709091560;
    W(31) = 0.01677709091560;
    W(32) = 0.01677709091560;
    W(33) = 0.01677709091560;
    W(34) = 0.01884823095080;
    W(35) = 0.01884823095080;
    W(36) = 0.01884823095080;
    W(37) = 0.01884823095080;
    
elseif cs == 4;
    
    P = zeros(21,3);

    P(1, :) = [0.187592474085, 0             , 0.982246946377];
    P(2, :) = [0.794654472292,-0.525731112119, 0.303530999103];
    P(3, :) = [0.794654472292, 0.525731112119, 0.303530999103];
    P(4, :) = [0.187592474085,-0.850650808352,-0.491123473188];
    P(5, :) = [0.794654472292, 0             ,-0.607061998207];
    P(6, :) = [0.187592474085, 0.850650808352,-0.491123473188];
    P(7, :) = [0.577350269190,-0.309016994375, 0.755761314076];
    P(8, :) = [0.577350269190, 0.309016994375, 0.755761314076];
    P(9, :) = [0.934172358963, 0             , 0.356822089773];
    P(10,:) = [0.577350269190,-0.809016994375,-0.110264089708];
    P(11,:) = [0.934172358963,-0.309016994375,-0.178411044887];
    P(12,:) = [0.934172358963, 0.309016994375,-0.178411044887];
    P(13,:) = [0.577350269190, 0.809016994375,-0.110264089708];
    P(14,:) = [0.577350269190,-0.5           ,-0.645497224368];
    P(15,:) = [0.577350269190, 0.5           ,-0.645497224368];
    P(16,:) = [0.356822089773,-0.809016994375, 0.467086179481];
    P(17,:) = [0.356822089773, 0             ,-0.934172358963];
    P(18,:) = [0.356822089773, 0.809016994375, 0.467086179481];
    P(19,:) = [0             ,-0.5           , 0.866025403784];
    P(20,:) = [0             ,-0.5           ,-0.866025403784];
    P(21,:) = [0             , 1             , 0             ];
    
    W = zeros(21,1);
    
    W(1)  = 0.0198412698413;
    W(2)  = 0.0198412698413;
    W(3)  = 0.0198412698413;
    W(4)  = 0.0198412698413;
    W(5)  = 0.0198412698413;
    W(6)  = 0.0198412698413;
    W(7)  = 0.0253968253968;
    W(8)  = 0.0253968253968;
    W(9)  = 0.0253968253968;
    W(10) = 0.0253968253968;
    W(11) = 0.0253968253968;
    W(12) = 0.0253968253968;
    W(13) = 0.0253968253968;
    W(14) = 0.0253968253968;
    W(15) = 0.0253968253968;
    W(16) = 0.0253968253968;
    W(17) = 0.0253968253968;
    W(18) = 0.0253968253968;
    W(19) = 0.0253968253968;
    W(20) = 0.0253968253968;
    W(21) = 0.0253968253968;
    
elseif cs == 5;
    
    P = zeros(21,3);

    P(1, :) = [ 1             , 0             , 0             ];
    P(2, :) = [ 0.745355992500, 0             , 0.666666666667];
    P(3, :) = [ 0.745355992500,-0.577350269190,-0.333333333333];
    P(4, :) = [ 0.745355992500, 0.577350269190,-0.333333333333];
    P(5, :) = [ 0.333333333333, 0.577350269190, 0.745355992500];
    P(6, :) = [ 0.333333333333,-0.577350269190, 0.745355992500];
    P(7, :) = [ 0.333333333333,-0.934172358963, 0.127322003750];
    P(8, :) = [ 0.333333333333,-0.356822089773,-0.872677996250];
    P(9, :) = [ 0.333333333333, 0.356822089773,-0.872677996250];
    P(10,:) = [ 0.333333333333, 0.934172358963, 0.127322003750];
    P(11,:) = [ 0.794654472292,-0.525731112119, 0.303530999103];
    P(12,:) = [ 0.794654472292, 0             ,-0.607061998207];
    P(13,:) = [ 0.794654472292, 0.525731112119, 0.303530999103];
    P(14,:) = [ 0.187592474085, 0             , 0.982246946377];
    P(15,:) = [ 0.187592474085,-0.850650808352,-0.491123473188];
    P(16,:) = [ 0.187592474085, 0.850650808352,-0.491123473188];
    P(17,:) = [ 0.934172358963, 0             , 0.356822089773];
    P(18,:) = [ 0.934172358963,-0.309016994375,-0.178411044887];
    P(19,:) = [ 0.934172358963, 0.309016994375,-0.178411044887];
    P(20,:) = [ 0.577350269190, 0.309016994375, 0.755761314076];
    P(21,:) = [ 0.577350269190,-0.309016994375, 0.755761314076];
    P(22,:) = [ 0.577350269190,-0.809016994375,-0.110264089708];
    P(23,:) = [ 0.577350269190,-0.5           ,-0.645497224368];
    P(24,:) = [ 0.577350269190, 0.5           ,-0.645497224368];
    P(25,:) = [ 0.577350269190, 0.809016994375,-0.110264089708];
    P(26,:) = [ 0.356822089773,-0.809016994375, 0.467086179481];
    P(27,:) = [ 0.356822089773, 0             ,-0.934172358963];
    P(28,:) = [ 0.356822089773, 0.809016994375, 0.467086179481];
    P(29,:) = [ 0             , 0.5           , 0.866025403784];
    P(30,:) = [ 0             ,-1             , 0             ];
    P(31,:) = [ 0             , 0.5           ,-0.866025403784];
    P(32,:) = [ 0.947273580412,-0.277496978165, 0.160212955043];
    P(33,:) = [ 0.812864676392,-0.277496978165, 0.512100034157];
    P(34,:) = [ 0.595386501297,-0.582240127941, 0.553634669695];
    P(35,:) = [ 0.595386501297,-0.770581752342, 0.227417407053];
    P(36,:) = [ 0.812864676392,-0.582240127941,-0.015730584514];
    P(37,:) = [ 0.492438766306,-0.753742692223,-0.435173546254];
    P(38,:) = [ 0.274960591212,-0.942084316623,-0.192025554687];
    P(39,:) = [-0.076926487903,-0.942084316623,-0.326434458707];
    P(40,:) = [-0.076926487903,-0.753742692223,-0.652651721349];
    P(41,:) = [ 0.274960591212,-0.637341166847,-0.719856173359];
    P(42,:) = [ 0.947273580412, 0             ,-0.320425910085];
    P(43,:) = [ 0.812864676392,-0.304743149777,-0.496369449643];
    P(44,:) = [ 0.595386501297,-0.188341624401,-0.781052076747];
    P(45,:) = [ 0.595386501297, 0.188341624401,-0.781052076747];
    P(46,:) = [ 0.812864676392, 0.304743149777,-0.496369449643];
    P(47,:) = [ 0.492438766306,-0.753742692223,-0.435173546254];
    P(48,:) = [ 0.274960591212, 0.637341166847,-0.719856173359];
    P(49,:) = [-0.076926487903, 0.753742692223,-0.652651721349];
    P(50,:) = [-0.076926487903, 0.942084316623,-0.326434458707];
    P(51,:) = [ 0.274960591212, 0.942084316623,-0.192025554687];
    P(52,:) = [ 0.947273580412, 0.277496978165, 0.160212955043];
    P(53,:) = [ 0.812864676392, 0.582240127941,-0.015730584514];
    P(54,:) = [ 0.595386501297, 0.770581752342, 0.227417407053];
    P(55,:) = [ 0.595386501297, 0.582240127941, 0.553634669695];
    P(56,:) = [ 0.812864676392, 0.277496978165, 0.512100034157];
    P(57,:) = [ 0.492438766306, 0             , 0.870347092509];
    P(58,:) = [ 0.274960591212, 0.304743149777, 0.911881728046];
    P(59,:) = [-0.076926487903, 0.188341624401, 0.979086180056];
    P(60,:) = [-0.076926487903,-0.188341624401, 0.979086180056];
    P(61,:) = [ 0.274960591212,-0.304743149777, 0.911881728046];
    
    W = zeros(21,1);
    
    W(1)  = 0.00795844204678;
    W(2)  = 0.00795844204678;
    W(3)  = 0.00795844204678;
    W(4)  = 0.00795844204678;
    W(5)  = 0.00795844204678;
    W(6)  = 0.00795844204678;
    W(7)  = 0.00795844204678;
    W(8)  = 0.00795844204678;
    W(9)  = 0.00795844204678;
    W(10) = 0.00795844204678;
    W(11) = 0.01051552428920;
    W(12) = 0.01051552428920;
    W(13) = 0.01051552428920;
    W(14) = 0.01051552428920;
    W(15) = 0.01051552428920;
    W(16) = 0.01051552428920;
    W(17) = 0.01001193642720;
    W(18) = 0.01001193642720;
    W(19) = 0.01001193642720;
    W(20) = 0.01001193642720;
    W(21) = 0.01001193642720;
    W(22) = 0.01001193642720;
    W(23) = 0.01001193642720;
    W(24) = 0.01001193642720;
    W(25) = 0.01001193642720;
    W(26) = 0.01001193642720;
    W(27) = 0.01001193642720;
    W(28) = 0.01001193642720;
    W(29) = 0.01001193642720;
    W(30) = 0.01001193642720;
    W(31) = 0.01001193642720;
    W(32) = 0.00690477957966;
    W(33) = 0.00690477957966;
    W(34) = 0.00690477957966;
    W(35) = 0.00690477957966;
    W(36) = 0.00690477957966;
    W(37) = 0.00690477957966;
    W(38) = 0.00690477957966;
    W(39) = 0.00690477957966;
    W(40) = 0.00690477957966;
    W(41) = 0.00690477957966;
    W(42) = 0.00690477957966;
    W(43) = 0.00690477957966;
    W(44) = 0.00690477957966;
    W(45) = 0.00690477957966;
    W(46) = 0.00690477957966;
    W(47) = 0.00690477957966;
    W(48) = 0.00690477957966;
    W(49) = 0.00690477957966;
    W(50) = 0.00690477957966;
    W(51) = 0.00690477957966;
    W(52) = 0.00690477957966;
    W(53) = 0.00690477957966;
    W(54) = 0.00690477957966;
    W(55) = 0.00690477957966;
    W(56) = 0.00690477957966;
    W(57) = 0.00690477957966;
    W(58) = 0.00690477957966;
    W(59) = 0.00690477957966;
    W(60) = 0.00690477957966;
    W(61) = 0.00690477957966;
    
end
    
end

