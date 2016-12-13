function r = coutFromLine(lineStart,lineEnd,nPart,antennaPoint)
% lengthOfLine = sqrt(sum((lineStart-lineEnd).^2));
if nargin<3
    nPart = 16;
elseif nargin<4
    nPart = 16;
    antennaPoint = {[1,0,0],[0,1,0],[0,0,1]};
end

%get the measure point sites
linePoint={};
for i = 1:3
    linePoint{i} = linspace(lineStart(i),lineEnd(i),nPart);
end

% count Rs from line to antenna X 
r={};
for i = 1:3
    for j = 1:nPart
        r{i}(j) = sqrt(sum(([linePoint{1}(j),linePoint{2}(j),linePoint{3}(j)]-antennaPoint{i}).^2));
    end
end
