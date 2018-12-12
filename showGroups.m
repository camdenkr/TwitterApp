function showGroups(app)
%Prints group and password pairs into text box when button is pressed from
%group.passwords file
fid = fopen('groups.passwords');
            print = '';
            while feof(fid) ~= 1
                aline = fgetl(fid);
                print = sprintf('%s \n %s', print, aline);
            end
            app.PreviousGroupsPasswordsTextArea.Value = print;
end