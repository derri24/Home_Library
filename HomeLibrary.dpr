program HomeLibrary;

uses
  Vcl.Forms,
  MainLibrary in 'MainLibrary.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles,
  Authorization in 'Authorization.pas' {AuthorizationForm},
  ListBooks in 'ListBooks.pas' {BooksForm},
  Book in 'Book.pas',
  AddBook in 'AddBook.pas' {AddBookForm},
  Diagram in 'Diagram.pas' {DiagramForm},
  Registration in 'Registration.pas' {RegistrationForm},
  User in 'User.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAuthorizationForm, AuthorizationForm);
  Application.CreateForm(TBooksForm, ListOfBooksForm);
  Application.CreateForm(TAddBookForm, AddBookForm);
  Application.CreateForm(TDiagramForm, DiagramForm);
  Application.CreateForm(TRegistrationForm, RegistrationForm);
  Application.Run;
end.
