function checkColdPlateGeometry(cpLength, cpWidth, cpThickness, channelWidth, channelHeight, channelMargin, channelPitch)
% checkInputs Validate required geometric parameters.
% Throws an error if validation fails.

% Common scalar positive numeric check
scalarPos = ["real", "finite", "positive", "scalar"];

validateattributes(cpLength,     "numeric",scalarPos, mfilename, 'cpLength',    1);
validateattributes(cpWidth,      "numeric",scalarPos, mfilename, 'cpWidth',     2);
validateattributes(cpThickness,  "numeric",scalarPos, mfilename, 'cpThickness', 3);
validateattributes(channelWidth, "numeric",scalarPos, mfilename, 'channelWidth',4);
validateattributes(channelHeight,"numeric",scalarPos, mfilename, 'channelHeight',5);
validateattributes(channelMargin,"numeric",scalarPos, mfilename, 'channelMargin',6);
validateattributes(channelPitch, "numeric",scalarPos, mfilename, 'channelPitch',7);

% Specific logical check: channelWidth must be smaller than channelPitch
if ~(channelWidth < channelPitch)
    error('checkInputs:InvalidGeometry', ...
        'channelWidth (%.5g) must be smaller than channelPitch (%.5g).', ...
         channelWidth, channelPitch);
end

end