unit ListBooks;

interface

uses
    System.Generics.Collections, Winapi.Windows, Winapi.Messages,
    System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCtrls,
    Vcl.Menus, Vcl.Themes, User, Diagram,
    Vcl.Samples.Spin, Vcl.Grids, AddBook, Book, StrUtils;

type

    TBooksForm = class(TForm)
        MainMenu: TMainMenu;
        FileButton: TMenuItem;
        HelpButton: TMenuItem;
        SaveBtn: TMenuItem;
        AddButton: TButton;
        DeleteButton: TButton;
        SearchBox: TSearchBox;
        BooksTabel: TStringGrid;
        SaveDialog: TSaveDialog;
        Settings: TMenuItem;
        ChangeStyleButton: TMenuItem;
        StatisticsButton: TMenuItem;
        procedure HelpButtonClick(Sender: TObject);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure AddButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure BooksTabelDblClick(Sender: TObject);
        procedure PrintBooks;
        Procedure PrintFixedRow();
        procedure BooksTabelFixedCellClick(Sender: TObject;
          ACol, ARow: integer);
        Procedure CheckBooksCount;
        procedure SaveBtnClick(Sender: TObject);
        procedure SearchBoxChange(Sender: TObject);
        procedure SearchBoxKeyPress(Sender: TObject; var Key: Char);
        procedure ChangeStyleButtonClick(Sender: TObject);
        procedure StatisticsButtonClick(Sender: TObject);
        procedure LoadUser(Login: String);
        function CreateArrayForDiagram: TArray;
    end;

const
    INFO_MESSAGE = 'Данное окно содержит список книг. ' + #10#13 +
      'Основными кнопками управления являются кнопки "Удалить"' + #10#13 +
      'и "Добавить", в своём названии они раскрывают свою суть. ' + #10#13 + ''
      + #10#13 + 'Для того, чтобы отредактировать книгу необходимо дважды' +
      #10#13 + 'кликнуть на строку, содержающую свойства желаемой книги. ' +
      #10#13 + '' + #10#13 +
      'Поиск осуществляется по свойствам "Название книги" и "Автор ' + #10#13 +
      'книги", который расположен в правой верхней части формы. ' + #10#13 + ''
      + #10#13 + 'Присутствует возможность сортировки, для этого необходимо' +
      #10#13 + 'кликнуть на ячейку закреплённой строки. По первому клику' +
      #10#13 + 'сортировка производится по убыванию, в противном ' + #10#13 +
      'случае по возрастанию. ' + #10#13 + '' + #10#13 +
      'Для сохранения информации необходимо кликнуть на кнопку' + #10#13 +
      '"Сохранить" или зажать комбинацию клавиш "Ctrl+S".' + #10#13 + '' +
      #10#13 + 'Для того, чтобы сменить тему необходимо нажать на кнопку' +
      #10#13 + '"Настройки" -> "Изменить тему".' + #10#13 + '' + #10#13 +
      'Окно отображает статистику книг по жанру, для просмотра' + #10#13 +
      'необходимо кликнуть на клавишу "Статистика".';

var
    ListOfBooksForm: TBooksForm;
    SavePath: String;
    ListOfBooks: TList<TBook>;

implementation

{$R *.dfm}

procedure TBooksForm.LoadUser(Login: String);
Var
    BooksFile: File of TBook;
    Book: TBook;
    Flag: Boolean;
Begin
    self.caption := 'Список литературы. Вы вошли как ' + Login;
    ListOfBooks := TList<TBook>.Create();
    SavePath := Login + '.dat';
    Try
        if FileExists(SavePath) then
        begin
            AssignFile(BooksFile, SavePath);
            Reset(BooksFile);
            while not EOF(BooksFile) do
            begin
                Read(BooksFile, Book);
                if ((Book.YearPubl > 0) and (Book.YearPubl < 2100)) and
                  (Book.ShelfNumber > 0) and (Book.ShelfNumber < 51) then
                begin
                    ListOfBooks.Add(Book);
                end
                else if Flag = True then
                begin
                    ShowMessage
                      ('Были добавлены лишь те книги, которые совпадают с условием(год и номер полки)');
                    Flag := False;
                end;
            end;
            PrintBooks();
            closeFile(BooksFile);

        end
        else
        begin
            AssignFile(BooksFile, SavePath);
            Rewrite(BooksFile);
            closeFile(BooksFile);
        end;
        self.ShowModal;
    except
        MessageBox(Handle, 'Ошибка входа в аккаунт', 'Уведомленио об ошибке',
          MB_ICONERROR);
    End;
End;

procedure TBooksForm.ChangeStyleButtonClick(Sender: TObject);
begin
    if TStyleManager.ActiveStyle.Name = 'Windows' then
        TStyleManager.TrySetStyle('Windows10 Dark')
    else
        TStyleManager.TrySetStyle('Windows');

end;

Procedure TBooksForm.CheckBooksCount;
Begin
    if (ListOfBooks.Count <> 0) and (SearchBox.Text = '') then
        DeleteButton.Enabled := True
    else
        DeleteButton.Enabled := False;
End;

Procedure TBooksForm.PrintFixedRow();
Begin
    BooksTabel.Cells[0, 0] := 'Название книги';
    BooksTabel.Cells[1, 0] := 'Автор книги';
    BooksTabel.Cells[2, 0] := 'Год издания';
    BooksTabel.Cells[3, 0] := 'Жанр';
    BooksTabel.Cells[4, 0] := 'Номер полки';
End;

procedure TBooksForm.PrintBooks();
var
    I, CurrRow: integer;
    SearchStr, Name, Author: String;
begin
    PrintFixedRow();
    BooksTabel.RowCount := ListOfBooks.Count + 1;
    for I := 1 to BooksTabel.RowCount do
        BooksTabel.Rows[I].Clear;
    CurrRow := 1;
    SearchStr := AnsiUpperCase(SearchBox.Text);
    for I := 0 to ListOfBooks.Count - 1 do
    begin
        Name := AnsiUpperCase(ListOfBooks[I].Name);
        Name := Name.Replace('"', '');
        Author := AnsiUpperCase(ListOfBooks[I].Author);
        if (SearchBox.Text = '') or (pos(SearchStr, Name) = 1) or
          (pos(SearchStr, Author) = 1) then
        begin
            BooksTabel.Cells[0, CurrRow] := ListOfBooks[I].Name;
            BooksTabel.Cells[1, CurrRow] := ListOfBooks[I].Author;
            BooksTabel.Cells[2, CurrRow] := IntToStr(ListOfBooks[I].YearPubl);
            BooksTabel.Cells[3, CurrRow] := ListOfBooks[I].Genre;
            BooksTabel.Cells[4, CurrRow] :=
              IntToStr(ListOfBooks[I].ShelfNumber);
            inc(CurrRow);
        end;
    end;
    BooksTabel.RowCount := CurrRow;
    if BooksTabel.RowCount > 1 then
    begin
        BooksTabel.Row := 1;
        BooksTabel.FixedRows := 1;
    end;
    CheckBooksCount();
end;

Procedure TBooksForm.BooksTabelDblClick(Sender: TObject);
Var
    ARow, ACol: integer;
    FormEdit: TAddBookForm;
    EditedBook: TBook;
    Point: TPoint;
Begin
    GetCursorPos(Point);
    Point := BooksTabel.ScreenToClient(Point);
    BooksTabel.MouseToCell(0, Point.Y, ACol, ARow);
    If ((ARow > 0) and (ARow - 1 < ListOfBooks.Count) and (DeleteButton.Enabled))
    then
    Begin
        ARow := ARow - 1;
        FormEdit := TAddBookForm.Create(self);
        FormEdit.FillEdit(ListOfBooks[ARow]);
        FormEdit.ShowModal;
        EditedBook := FormEdit.Book;
        If (EditedBook.ShelfNumber <> 0) and
          not(ListOfBooks[ARow].Equals(EditedBook)) then
        Begin
            ListOfBooks[ARow] := EditedBook;
            PrintBooks();
        End;
    End;
End;

procedure Swap(var BooksList: TList<TBook>; Index1, Index2: integer);
var
    TempStudent: TBook;
begin
    TempStudent := BooksList[Index1];
    BooksList[Index1] := BooksList[Index2];
    BooksList[Index2] := TempStudent;
end;

procedure TBooksForm.BooksTabelFixedCellClick(Sender: TObject;
  ACol, ARow: integer);
var
    I, j: integer;
    Reverse: Boolean;
begin
    Reverse := ContainsStr(BooksTabel.Cells[ACol, ARow], '  ↑');
    for I := 1 to ListOfBooks.Count - 1 do
        for j := 1 to ListOfBooks.Count - 1 do
            case ACol of
                0:
                    begin
                        if ListOfBooks[j].Name > ListOfBooks[j - 1].Name then
                            Swap(ListOfBooks, j, j - 1);
                    end;
                1:
                    begin
                        if ListOfBooks[j].Author > ListOfBooks[j - 1].Author
                        then
                            Swap(ListOfBooks, j, j - 1);
                    end;
                2:
                    begin
                        if ListOfBooks[j].YearPubl > ListOfBooks[j - 1].YearPubl
                        then
                            Swap(ListOfBooks, j, j - 1);
                    end;
                3:
                    begin
                        if ListOfBooks[j].Genre > ListOfBooks[j - 1].Genre then
                            Swap(ListOfBooks, j, j - 1);
                    end;
                4:
                    begin
                        if ListOfBooks[j].ShelfNumber > ListOfBooks[j - 1].ShelfNumber
                        then
                            Swap(ListOfBooks, j, j - 1);
                    end;

            end;
    if Reverse then
    begin
        ListOfBooks.Reverse;
        PrintBooks;
        BooksTabel.Cells[ACol, ARow] := BooksTabel.Cells[ACol, ARow] + '  ↓';
    end
    else
    begin
        PrintBooks;
        BooksTabel.Cells[ACol, ARow] := BooksTabel.Cells[ACol, ARow] + '  ↑';
    end;
end;

Procedure TBooksForm.DeleteButtonClick(Sender: TObject);
var
    MessageBoxResult: integer;
Begin
    MessageBoxResult := MessageBox(Handle,
      'Вы действительно желаете удалить выбранную книгу?',
      'Уведомление об удалении', MB_YESNO);
    if MessageBoxResult = mrYes then
    begin
        If (ListOfBooks.Count <> 0) then
        Begin
            ListOfBooks.Delete(BooksTabel.Row - 1);
            PrintBooks();
        End;
    end;
End;

procedure TBooksForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    CanClose := MessageBox(Handle, 'Вы уверены, что хотите выйти из программы?'
      + #10#13 + 'Все несохранённые данные будут утеряны.',
      'Уведомление о выходе', MB_YESNO) = mrYes;
end;

procedure TBooksForm.FormCreate(Sender: TObject);
begin
    ListOfBooks := TList<TBook>.Create();
    PrintBooks();
end;

procedure TBooksForm.HelpButtonClick(Sender: TObject);
begin
    MessageBox(Handle, INFO_MESSAGE, 'Помощь', MB_ICONINFORMATION);
end;

Procedure TBooksForm.SaveBtnClick(Sender: TObject);
var
    I: integer;
    BooksFile: File of TBook;
    Book: TBook;
begin
    try
        AssignFile(BooksFile, SavePath);
        Rewrite(BooksFile);
        for I := 0 to ListOfBooks.Count - 1 do
        begin
            Book := ListOfBooks.Items[I];
            Write(BooksFile, Book);
        end;
        closeFile(BooksFile);

    except
        MessageBox(Handle, 'Ошибка сохранения в файл', 'Уведомленио об ошибке',
          MB_ICONERROR);
    end;
end;

procedure TBooksForm.SearchBoxChange(Sender: TObject);
begin
    PrintBooks();
end;

procedure TBooksForm.SearchBoxKeyPress(Sender: TObject; var Key: Char);
begin
    case Key of
        'А' .. 'Я':
            ;
        'а' .. 'я':
            ;
        '0' .. '9':
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
end;

Procedure TBooksForm.AddButtonClick(Sender: TObject);
Var
    BookForm: TAddBookForm;
Begin
    BookForm := TAddBookForm.Create(self);
    BookForm.ShowModal;
    If (BookForm.Book.YearPubl <> 0) then
    Begin
        ListOfBooks.Add(BookForm.Book);
        PrintBooks();
    End;
End;

function TBooksForm.CreateArrayForDiagram: TArray;
var
    I: integer;
    ArrayForDiagrams: TArray;
begin
    for I := 0 to High(ArrayForDiagrams) do
        ArrayForDiagrams[I] := 0;
    for I := 0 to ListOfBooks.Count - 1 do
    begin
        if AnsiCompareStr(ListOfBooks[I].Genre, 'Детективы') = 0 then
            inc(ArrayForDiagrams[0])
        else if AnsiCompareStr(ListOfBooks[I].Genre, 'Женские романы') = 0 then
            inc(ArrayForDiagrams[1])
        else if AnsiCompareStr(ListOfBooks[I].Genre, 'Исторические книги') = 0
        then
            inc(ArrayForDiagrams[2])
        else if AnsiCompareStr(ListOfBooks[I].Genre, 'Классика') = 0 then
            inc(ArrayForDiagrams[3])
        else if AnsiCompareStr(ListOfBooks[I].Genre, 'Мистика') = 0 then
            inc(ArrayForDiagrams[4])
        else if AnsiCompareStr(ListOfBooks[I].Genre, 'Научно-популярные') = 0
        then
            inc(ArrayForDiagrams[5])
        else if AnsiCompareStr(ListOfBooks[I].Genre, 'Научные книги') = 0 then
            inc(ArrayForDiagrams[6])
        else if AnsiCompareStr(ListOfBooks[I].Genre, 'Приключения') = 0 then
            inc(ArrayForDiagrams[7])
        else if AnsiCompareStr(ListOfBooks[I].Genre, 'Учебная литература') = 0
        then
            inc(ArrayForDiagrams[8])
        else if AnsiCompareStr(ListOfBooks[I].Genre, 'Фантастика') = 0 then
            inc(ArrayForDiagrams[9])
        else
            inc(ArrayForDiagrams[10]);
    end;
    CreateArrayForDiagram := ArrayForDiagrams;
end;

procedure TBooksForm.StatisticsButtonClick(Sender: TObject);
var
    DiagramForm: TDiagramForm;
    ArrayForDiagrams: TArray;
begin
    DiagramForm := TDiagramForm.Create(self);
    ArrayForDiagrams := CreateArrayForDiagram;
    DiagramForm.GetArrayForDiagram(ArrayForDiagrams);
    DiagramForm.ShowModal;
end;

End.
