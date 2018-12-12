function personalPass(app)
    %Writes to the groups.passwords file a user defined password/group name
    %combination from the app
    fid = fopen('groups.passwords','a');
    fprintf(fid, 'The group name is: %s for the password: %s\n',app.EnterPersonalGroupNameTextArea.Value{1}, app.EnterDesiredPasswordEditField.Value);
    fclose(fid);
end