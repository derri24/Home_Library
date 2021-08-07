unit Registration;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, User, Authorization,
    System.RegularExpressions,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;

type
    TRegistrationForm = class(TForm)
        RegistrationButtonButton: TButton;
        NameLabel: TLabel;
        MailLabel: TLabel;
        LoginLabel: TLabel;
        Password1Label: TLabel;
        Password2Label: TLabel;
        NameEdit: TEdit;
        BackButton: TButton;
        MailEdit: TEdit;
        LoginEdit: TEdit;
        Password1Edit: TEdit;
        Password2Edit: TEdit;
        InfLabel: TLabel;
        CheckBox: TCheckBox;
        NameErrorLabel: TLabel;
        MailErrorLabel: TLabel;
        LoginErrorLabel: TLabel;
        Password1ErrorLabel: TLabel;
        Password2ErrorLabel: TLabel;
        MainMenu: TMainMenu;
        HelpButton: TMenuItem;
        procedure BackButtonClick(Sender: TObject);
        procedure RegistrationButtonButtonClick(Sender: TObject);
        function CheckForDublicates: Boolean;
        procedure CheckBoxClick(Sender: TObject);
        procedure DisplayErrors;
        function CheckInput: Boolean;
        procedure NameEditChange(Sender: TObject);
        procedure MailEditChange(Sender: TObject);
        procedure LoginEditChange(Sender: TObject);
        procedure Password1EditChange(Sender: TObject);
        procedure Password2EditChange(Sender: TObject);
        procedure NameEditKeyPress(Sender: TObject; var Key: Char);
        procedure MailEditKeyPress(Sender: TObject; var Key: Char);
        procedure LoginEditKeyPress(Sender: TObject; var Key: Char);
        procedure Password1EditKeyPress(Sender: TObject; var Key: Char);
        procedure Password2EditKeyPress(Sender: TObject; var Key: Char);
        procedure HelpButtonClick(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    RegistrationForm: TRegistrationForm;

implementation

{$R *.dfm}

procedure TRegistrationForm.BackButtonClick(Sender: TObject);
begin
    Self.Close();
end;

Procedure SaveAccountToFile(User: TUser);
var
    SaveFile: file of TUser;
begin
    AssignFile(SaveFile, 'passwords.dat');
    Reset(SaveFile);
    Seek(SaveFile, FileSize(SaveFile));
    Write(SaveFile, User);
    CloseFile(SaveFile);
end;

procedure TRegistrationForm.CheckBoxClick(Sender: TObject);
begin
    if CheckBox.Checked then
    begin
        Password1Edit.PasswordChar := #0;
        Password2Edit.PasswordChar := #0
    end
    else
    begin
        Password1Edit.PasswordChar := '*';
        Password2Edit.PasswordChar := '*';
    end;
end;

function TRegistrationForm.CheckForDublicates: Boolean;
var
    OpenFile: File of TUser;
    User: TUser;
    IsCorrect: Boolean;
begin
    try
        AssignFile(OpenFile, 'passwords.dat');
        if FileExists('passwords.dat') then
            Reset(OpenFile)
        else
            Rewrite(OpenFile);
        IsCorrect := True;
        while not Eof(OpenFile) do
        begin
            Read(OpenFile, User);
            if (MailEdit.Text = User.Mail) then
            begin
                IsCorrect := False;
                MessageBox(Application.Handle,
                  'Данный E-Mail уже используется.', 'Ошибка', MB_ICONERROR)
            end
            else if (LoginEdit.Text = User.Login) then
            begin
                MessageBox(Application.Handle, 'Данный логин уже используется.',
                  'Ошибка', MB_ICONERROR);
                IsCorrect := False;
            end;
        end;
        CloseFile(OpenFile);
        CheckForDublicates := IsCorrect;
    except
        MessageBox(Handle, 'Ошибка регистрации', 'Уведомленио об ошибке',
          MB_ICONERROR);
        CheckForDublicates := false;
    end;
end;

procedure TRegistrationForm.DisplayErrors;
begin
    if (NameEdit.Text = '') then
    begin
        NameErrorLabel.Visible := True;
        NameErrorLabel.Caption := 'Отсутствует имя';
    end
    else
        NameErrorLabel.Caption := '';
    if (MailEdit.Text = '') then
    begin
        MailErrorLabel.Visible := True;
        MailErrorLabel.Caption := 'Отсутствует E-Mail';
    end
    else
    begin
        if TRegEx.IsMatch(MailEdit.Text, '[\w._]+@\w+\.[a-zA-Z]+') = False then
            MailErrorLabel.Caption := 'E-Mail введен некорректно'
        else
            MailErrorLabel.Caption := '';

    end;
    if (LoginEdit.Text = '') then
    begin
        LoginErrorLabel.Visible := True;
        LoginErrorLabel.Caption := 'Отсутствует логин';
    end
    else
        LoginErrorLabel.Caption := '';
    if (Password1Edit.Text = '') then
    begin
        Password1ErrorLabel.Visible := True;
        Password1ErrorLabel.Caption := 'Отсутствует пароль'
    end
    else
    begin
        if (Length(Password1Edit.Text) < 8) then
            Password1ErrorLabel.Caption :=
              'Пароль должен содержать не менее 8 символов'
        else
        begin
            Password1ErrorLabel.Caption := '';
            if Password1Edit.Text <> Password2Edit.Text then
                Password1ErrorLabel.Caption := 'Пароли не совпадают'
            else
                Password1ErrorLabel.Caption := '';
        end;
    end;
    if (Password2Edit.Text = '') then
    begin
        Password2ErrorLabel.Visible := True;
        Password2ErrorLabel.Caption := 'Отсутствует повторный пароль'
    end
    else
    begin
        if (Length(Password2Edit.Text) < 8) then
            Password2ErrorLabel.Caption :=
              'Пароль должен содержать не менее 8 символов'
        else
            Password2ErrorLabel.Caption := '';
    end;
end;

procedure TRegistrationForm.HelpButtonClick(Sender: TObject);
begin
    MessageBox(Handle, 'Перед Вами представлена окно регистации.' + #10#13 +
      'Для того, чтобы зарегистрироваться, необходимо корректно ' + #10#13 +
      'заполнить представленные поля.' + #10#13 +
      'Рекомендуется запомнить введённые поля "Логин" и "Пароль", так как они будут нужны в дальнейшем использовании.',
      'Помощь', MB_ICONINFORMATION);
end;

function TRegistrationForm.CheckInput: Boolean;
begin
    if (NameEdit.Text = '') or (MailEdit.Text = '') or (LoginEdit.Text = '') or
      (Password1Edit.Text = '') or (Password2Edit.Text = '') or
      (Length(Password1Edit.Text) < 8) or (Length(Password2Edit.Text) < 8) or
      (Password1Edit.Text <> Password2Edit.Text) then
        CheckInput := False
    else
        CheckInput := True;
end;

procedure TRegistrationForm.LoginEditChange(Sender: TObject);
begin
    LoginErrorLabel.Caption := '';
end;

procedure TRegistrationForm.LoginEditKeyPress(Sender: TObject; var Key: Char);
begin
    if (Length(LoginEdit.Text) = 15) and not(Key in [#8]) then
        Key := #0;
end;

procedure TRegistrationForm.MailEditChange(Sender: TObject);
begin
    MailErrorLabel.Caption := '';
end;

procedure TRegistrationForm.MailEditKeyPress(Sender: TObject; var Key: Char);
begin
    if (Length(MailEdit.Text) = 25) and not(Key in [#8]) then
        Key := #0;
end;

procedure TRegistrationForm.NameEditChange(Sender: TObject);
begin
    NameErrorLabel.Caption := '';
end;

procedure TRegistrationForm.NameEditKeyPress(Sender: TObject; var Key: Char);
begin
    if (Length(NameEdit.Text) = 20) and not(Key in [#8]) then
        Key := #0;
end;

procedure TRegistrationForm.Password1EditChange(Sender: TObject);
begin
    Password1ErrorLabel.Caption := '';

end;

procedure TRegistrationForm.Password1EditKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (Length(Password1Edit.Text) = 15) and not(Key in [#8]) then
        Key := #0;
end;

procedure TRegistrationForm.Password2EditChange(Sender: TObject);
begin
    Password2ErrorLabel.Caption := '';
end;

procedure TRegistrationForm.Password2EditKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (Length(Password2Edit.Text) = 15) and not(Key in [#8]) then
        Key := #0;
end;

procedure TRegistrationForm.RegistrationButtonButtonClick(Sender: TObject);
Var
    User: TUser;
    IsCorrect: Boolean;
    AuthorizationForm: TAuthorizationForm;
begin
    if CheckInput = True then
    begin
        User := TUser.Create(NameEdit.Text, MailEdit.Text, LoginEdit.Text,
          Password1Edit.Text);
        IsCorrect := CheckForDublicates;
        if IsCorrect then
        begin
            SaveAccountToFile(User);
            Self.Hide;
            Self.Close;
            MessageBox(Application.Handle, 'Регистрация прошла успешно!',
              'Регистрация', MB_OK);
            AuthorizationForm := TAuthorizationForm.Create(Self);
            AuthorizationForm.Show;
        end;
    end
    else
        DisplayErrors;
end;

end.
