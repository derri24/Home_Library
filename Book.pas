unit Book;

interface

type
    TBook = record
        Name: String[50];
        Author: String[50];
        YearPubl: Integer;
        Genre: String[50];
        ShelfNumber: Integer;
        constructor Create(Name, Author, Genre: String;
          YearPubl, ShelfNumber: Integer);
        function Equals(Book: TBook): Boolean;
    end;

implementation

function TBook.Equals(Book: TBook): Boolean;
begin
    result := (self.Name = Book.Name) and (self.Author = Book.Author) and
      (self.YearPubl = Book.YearPubl) and (self.Genre = Book.Genre) and
      (self.ShelfNumber = Book.ShelfNumber);
end;

constructor TBook.Create(Name, Author, Genre: String;
  YearPubl, ShelfNumber: Integer);
begin
    self.Name := Name;
    self.Author := Author;
    self.YearPubl := YearPubl;
    self.Genre := Genre;
    self.ShelfNumber := ShelfNumber;
end;

end.
