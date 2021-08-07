unit AddBook;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin, Book,
    Vcl.Menus;

type
    TAddBookForm = class(TForm)
        NameBookEdit: TEdit;
        AuthorBookEdit: TEdit;
        YearPublBookEdit: TEdit;
        ShelfNumberEdit: TSpinEdit;
        AddBookButton: TButton;
        CloseButton: TButton;
        NameBookLabel: TLabel;
        AuthorBookLabel: TLabel;
        YearPublBookLabel: TLabel;
        BookGenreLabel: TLabel;
        ShelfNumberLabel: TLabel;
        TextLabel: TLabel;
        GenreBookEdit: TComboBox;
        NameErrorLabel: TLabel;
        AuthorErrorLabel: TLabel;
        YearPublErrorLabel: TLabel;
        GenreErrorLabel: TLabel;
        MainMenu: TMainMenu;
        HelpButton: TMenuItem;
        procedure AddBookButtonClick(Sender: TObject);
        procedure YearPublBookEditKeyPress(Sender: TObject; var Key: Char);
        procedure AuthorBookEditKeyPress(Sender: TObject; var Key: Char);
        procedure GenreBookEditKeyPress(Sender: TObject; var Key: Char);
        procedure NameBookEditKeyPress(Sender: TObject; var Key: Char);
        procedure FillEdit(BookToEdit: TBook);
        procedure CloseButtonClick(Sender: TObject);
        procedure DisplayErrors;
        function CheckInput: Boolean;
        procedure HelpButtonClick(Sender: TObject);
        procedure NameBookEditChange(Sender: TObject);
        procedure AuthorBookEditChange(Sender: TObject);
        procedure YearPublBookEditChange(Sender: TObject);
        procedure GenreBookEditChange(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
        Book: TBook;
    end;

var
    AddBookForm: TAddBookForm;

implementation

{$R *.dfm}

procedure TAddBookForm.FillEdit(BookToEdit: TBook);
begin
    Caption := 'Редактирование книги';
    AddBookButton.Caption := 'Редактировать';
    NameBookEdit.Text := BookToEdit.Name;
    AuthorBookEdit.Text := BookToEdit.Author;
    YearPublBookEdit.Text := IntToStr(BookToEdit.YearPubl);
    GenreBookEdit.Text := BookToEdit.Genre;
    ShelfNumberEdit.Value := BookToEdit.ShelfNumber;

end;

procedure TAddBookForm.CloseButtonClick(Sender: TObject);
begin
    Self.Close();
end;

procedure TAddBookForm.DisplayErrors;
begin
    if (NameBookEdit.Text = '') then
    begin
        NameErrorLabel.Visible := True;
        NameErrorLabel.Caption := 'Отсутствует название книги'
    end
    else
        NameErrorLabel.Visible := False;
    if (AuthorBookEdit.Text = '') then
    begin
        AuthorErrorLabel.Visible := True;
        AuthorErrorLabel.Caption := 'Отсутствует автор книги'
    end
    else
        AuthorErrorLabel.Visible := False;

    if (YearPublBookEdit.Text = '') then
    begin
        YearPublErrorLabel.Visible := True;
        YearPublErrorLabel.Caption := 'Год издания книги должен иметь вид ХХХХ'
    end
    else
        YearPublErrorLabel.Visible := False;
    if (GenreBookEdit.Text = '') then
    begin
        GenreErrorLabel.Visible := True;
        GenreErrorLabel.Caption := 'Отсутствует жанр книги'
    end
    else
        GenreErrorLabel.Visible := False;
end;

function TAddBookForm.CheckInput: Boolean;
begin
    if (NameBookEdit.Text = '') or (AuthorBookEdit.Text = '') or
      (YearPublBookEdit.Text = '') or (GenreBookEdit.Text = '') then
        CheckInput := False
    else
        CheckInput := True;
end;

procedure TAddBookForm.AddBookButtonClick(Sender: TObject);
var
    IsCorrect: Boolean;
begin
    IsCorrect := CheckInput;
    if IsCorrect = False then
        DisplayErrors
    else
    begin
        Book := TBook.Create(NameBookEdit.Text, AuthorBookEdit.Text,
          GenreBookEdit.Text, StrToInt(YearPublBookEdit.Text),
          ShelfNumberEdit.Value);
        Self.Close();
    end;

end;

procedure TAddBookForm.AuthorBookEditChange(Sender: TObject);
begin
    AuthorErrorLabel.Caption := '';
end;

procedure TAddBookForm.AuthorBookEditKeyPress(Sender: TObject; var Key: Char);
begin
    case Key of
        'А' .. 'Я':
            ;
        'а' .. 'я':
            ;
        '.':
            ;
        '-':
            ;
        ' ':
            ;
        #08:
            ;
    else
        Key := chr(0);
    end;
    if (Length(AuthorBookEdit.Text) = 50) and not(Key in [#8]) then
        Key := #0;
end;

procedure TAddBookForm.GenreBookEditChange(Sender: TObject);
begin
    GenreErrorLabel.Caption := '';
end;

procedure TAddBookForm.GenreBookEditKeyPress(Sender: TObject; var Key: Char);
begin
    case Key of
        'А' .. 'Я':
            ;
        'а' .. 'я':
            ;
        #08:
            ;
        ' ':
            ;
    else
        Key := chr(0);
    end;
    if (Length(GenreBookEdit.Text) = 50) and not(Key in [#8]) then
        Key := #0;
end;

procedure TAddBookForm.HelpButtonClick(Sender: TObject);
begin
    MessageBox(Handle,
      'Перед Вами представлена окно с полями, которые необходимо ' + #10#13 +
      'заполнить информацией о книге. После заполнения полей' + #10#13 +
      'по кнопке "Добавить" будет создана книга.', 'Помощь',
      MB_ICONINFORMATION);
end;

procedure TAddBookForm.NameBookEditChange(Sender: TObject);
begin
    NameErrorLabel.Caption := '';
end;

procedure TAddBookForm.NameBookEditKeyPress(Sender: TObject; var Key: Char);
begin
    case Key of
        'А' .. 'Я':
            ;
        'а' .. 'я':
            ;
        '0' .. '9':
            ;
        '"':
            ;
        '-':
            ;
        ' ':
            ;
        #08:
            ;
    else
        Key := chr(0);
    end;
    if (Length(NameBookEdit.Text) = 50) and not(Key in [#8]) then
        Key := #0;
end;

procedure TAddBookForm.YearPublBookEditChange(Sender: TObject);
begin
    YearPublErrorLabel.Caption := '';
end;

procedure TAddBookForm.YearPublBookEditKeyPress(Sender: TObject; var Key: Char);
begin
    if not(Key in ['0' .. '9', #8]) then
        Key := #0;
    if (Length(YearPublBookEdit.Text) > 3) and not(Key in [#8]) then
        Key := #0;
end;

end.
