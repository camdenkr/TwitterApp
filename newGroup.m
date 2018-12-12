function newGroup(app)
    %Writes to the groups/passwords file the random password and user
    %defined group from the app
    fid = fopen('groups.passwords','a');
    fprintf(fid, 'The group name is: %s for the password: %s\n', app.TextArea_3.Value{1}, app.NewRandomPasswordTextArea.Value{1});
    fclose(fid);
end