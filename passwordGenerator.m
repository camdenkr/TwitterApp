function pass = passwordGenerator()
%Calls an API to generate a random password
pass = webread("http://www.passwordrandom.com/query?command=password");
fprintf("Password is: %s\n", pass);
end