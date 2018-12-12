function historyGraph(app)
%Creates a bar graph of all previously used groups and whether they are
%approaching the maximum history capacity of 100 messages
ConsumerKey = 'ZoVIkp7MmCjxAG8V1rFd4h6v0';
ConsumerSecret = '98WiehGOTMpejJf69loqxIV8tU6K1XeyMyM0RzLMgxsgUZaXm5';
AccessToken = '2560721233-dI71b0HBhY2QkJ4QTIc3w3Slhd5hBKbnXhcJtGX';
AccessTokenSecret = 'SjpySq3bDCbLQinDOvNPXeMpqimJjs5kleIt54i636i37';
%Function to Create API Call Object
call = callCreator(ConsumerKey, ConsumerSecret, AccessToken, AccessTokenSecret);
fid = fopen('groups.passwords');
x = {};
y = [];
count = 0;
while feof(fid) == 0
    count = count + 1;
aline = fgetl(fid);
newlineA = strrep(aline, 'The group name is: ', '');
newline = strrep(newlineA, ' for the password:', '');
[group, password] = strtok(newline);
tweetData = search(call, password, 'count', 100);
x{count} = group;
try
    y(count) = length(tweetData.Body.Data.statuses);
catch
    y(count) = 0;
end
end
bar(app.UIAxes2,y);
app.UIAxes2.XTickLabel = x;
app.UIAxes2.XTickLabelRotation = 45;
end