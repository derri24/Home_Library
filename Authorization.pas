unit Authorization;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, User,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus,
    ListBooks;

type
    TAuthorizationForm = class(TForm)
        LoginEdit: TEdit;
        PasswordEdit: TEdit;
        LoginLabel: TLabel;
        PasswordLabel: TLabel;
        EntryButton: TButton;
        MainMenu: TMainMenu;
        HelpButton: TMenuItem;
        CheckBox: TCheckBox;
        LoginErrorLabel: TLabel;
        PasswordErrorLabel: TLabel;
        procedure LoginEditChange(Sender: TObject);
        procedure PasswordEditChange(Sender: TObject);
        procedure HelpButtonClick(Sender: TObject);
        procedure EntryButtonClick(Sender: TObject);
        Procedure CheckInput();
        function CheckAccountInformation: Boolean;
        procedure CheckBoxClick(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    AuthorizationForm: TAuthorizationForm;

implementation

{$R *.dfm}

procedure TAuthorizationForm.CheckBoxClick(Sender: TObject);
begin
    if CheckBox.Checked then
        PasswordEdit.PasswordChar := #0
    else
        PasswordEdit.PasswordChar := '*';
end;

Procedure TAuthorizationForm.CheckInput();
Begin
    if (LoginEdit.Text = '') then
    begin
        LoginErrorLabel.Visible := True;
        LoginErrorLabel.Caption := 'Отсутствует логин'
    end
    else
        LoginErrorLabel.Caption := '';
    if (PasswordEdit.Text = '') then
    begin
        PasswordErrorLabel.Visible := True;
        PasswordErrorLabel.Caption := 'Отсутствует пароль'
    end
    else
        PasswordErrorLabel.Caption := '';
End;

function TAuthorizationForm.CheckAccountInformation: Boolean;
var
    PasswordsFile: File of TUser;
    ListBooks: TBooksForm;
    User: TUser;
    IsCorrect: Boolean;
begin
    try
        if FileExists('passwords.dat') then
        begin
            AssignFile(PasswordsFile, 'passwords.dat');
            Reset(PasswordsFile);
            IsCorrect := False;
            while not Eof(PasswordsFile) do
            begin
                Read(PasswordsFile, User);
                if (LoginEdit.Text = User.Login) and
                  (PasswordEdit.Text = User.Password) then
                    IsCorrect := True;
            end;
            CloseFile(PasswordsFile);
            CheckAccountInformation := IsCorrect;
        end
        else
            IsCorrect := False;
        if IsCorrect = False then
            MessageBox(Application.Handle, 'Не удаётся войти.' + #10#13 +
              'Пожалуйста, проверьте правильность написания логина и пароля.',
              'Ошибка', MB_ICONERROR);
        CheckAccountInformation := IsCorrect;
    except
        MessageBox(Handle, 'Ошибка авторизации', 'Уведомленио об ошибке',
          MB_ICONERROR);
        CheckAccountInformation := False;
    end;
end;

procedure TAuthorizationForm.EntryButtonClick(Sender: TObject);
var
    ListBooks: TBooksForm;
begin
    if CheckAccountInformation then
    begin
        self.Hide;
        ListBooks := TBooksForm.Create(self);
        ListBooks.LoadUser(LoginEdit.Text);
        self.Show;
        LoginEdit.Text := '';
        PasswordEdit.Text := '';
    end
    else
    begin
        CheckInput;

    end;
end;

procedure TAuthorizationForm.HelpButtonClick(Sender: TObject);
begin
    MessageBox(Handle, 'Перед Вами представлен вход в учётную запись.' + #10#13
      + 'Для входа Вам необходимо заполнить поля "Логин" и "Пароль".', 'Помощь',
      MB_ICONINFORMATION);
end;

procedure TAuthorizationForm.LoginEditChange(Sender: TObject);
begin
    LoginErrorLabel.Caption := '';
end;

procedure TAuthorizationForm.PasswordEditChange(Sender: TObject);
begin
    PasswordErrorLabel.Caption := '';
end;

end.
