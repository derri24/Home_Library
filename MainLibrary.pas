unit MainLibrary;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, Registration,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Imaging.jpeg,
    Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Themes, Authorization;

type
    TMainForm = class(TForm)
        MainMenu1: TMainMenu;
        HelpButton: TMenuItem;
        InformationButton: TMenuItem;
        AuthorButton: TMenuItem;
        Image: TImage;
        AccountButton: TButton;
        SettingsButton: TMenuItem;
        ChangeStyleButton: TMenuItem;
        AddAccountButton: TButton;
        procedure AuthorButtonClick(Sender: TObject);
        procedure InformationButtonClick(Sender: TObject);
        procedure AccountButtonClick(Sender: TObject);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure ChangeStyleButtonClick(Sender: TObject);
        procedure AddAccountButtonClick(Sender: TObject);

    private
        { Private declarations }
    public
        { Public declarations }
    end;

Const
    INFO_MESSAGE = 'Приветствую!' + #10#13 +
      'Перед Вами предсталено программное средство "Домашняя' + #10#13 +
      'библиотека".' + #10#13 + '' + #10#13 +
      'Данное программное средство предполагает собой содержание' + #10#13 +
      'домашней литературы в стуктурированном виде, обеспечивает' + #10#13 +
      'удобную фиксацию информации о литературе.' + #10#13 + '' + #10#13 +
      'Для того, чтобы войти в программное средство, Вам необходимо' + #10#13 +
      'пройти пользовательскую аутентификацию. Для этого следует' + #10#13 +
      'кликнуть на кнопку "Войти в учётную запись" и заполнить тре-' + #10#13 +
      'буемые поля, также предусмотрена возможность регистрации.' + #10#13 + ''
      + #10#13 + 'Для того, чтобы сменить тему необходимо нажать на кнопку' +
      #10#13 + '"Настройки" -> "Изменить тему".';

var
    MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.AddAccountButtonClick(Sender: TObject);
var
    RegistrationForm: TRegistrationForm;
begin
    RegistrationForm := TRegistrationForm.Create(Self);
    RegistrationForm.ShowModal;
end;

procedure TMainForm.AuthorButtonClick(Sender: TObject);
begin
    MessageBox(Application.Handle, 'Автор: Герасимович Дарья.' + #10#13 +
      'Группа: 051007.', 'Об авторе', MB_USERICON);
end;

procedure TMainForm.ChangeStyleButtonClick(Sender: TObject);
begin
    if TStyleManager.ActiveStyle.Name = 'Windows' then
        TStyleManager.TrySetStyle('Windows10 Dark')
    else
        TStyleManager.TrySetStyle('Windows');

end;

procedure TMainForm.AccountButtonClick(Sender: TObject);
var
    AuthorizationForm: tauthorizationForm;
begin
    AuthorizationForm := tauthorizationForm.Create(Self);
    AuthorizationForm.ShowModal;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    CanClose := MessageBox(Handle,'Вы уверены, что хотите выйти из программы?' + #10#13
      + 'Все несохранённые данные будут утеряны.','Уведомление о выходе',MB_YESNO)=mrYes;
end;

procedure TMainForm.InformationButtonClick(Sender: TObject);
begin
    MessageBox(Application.Handle, INFO_MESSAGE, 'Справка', MB_ICONINFORMATION);
end;

end.
