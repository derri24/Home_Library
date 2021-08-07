unit User;

interface

type
    TUser = record
        Name: String[20];
        Mail: String[25];
        Login: String[15];
        Password: String[15];
        constructor Create(Name, Mail, Login, Password: String);
    end;

implementation

constructor TUser.Create(Name, Mail, Login, Password: String);
begin
    Self.Name := Name;
    Self.Mail := Mail;
    Self.Login := Login;
    Self.Password := Password;
end;

end.
