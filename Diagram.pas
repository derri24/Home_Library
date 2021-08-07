unit Diagram;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VclTee.TeEngine,
    Vcl.ExtCtrls, VclTee.TeeProcs, VclTee.Chart, VclTee.Series;

type
    TArray = array [0 .. 10] of integer;

    TDiagramForm = class(TForm)
        Chart: TChart;
        Series: TBarSeries;
        procedure GetArrayForDiagram(ArrayForDiagrams: TArray);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    DiagramForm: TDiagramForm;

implementation

{$R *.dfm}

procedure TDiagramForm.GetArrayForDiagram(ArrayForDiagrams: TArray);
var
    I: integer;
begin
    Self.Series.clear;
    Self.Series.Add(ArrayForDiagrams[0], 'Детективы');
    Self.Series.Add(ArrayForDiagrams[1], 'Женские романы');
    Self.Series.Add(ArrayForDiagrams[2], 'Исторические книги');
    Self.Series.Add(ArrayForDiagrams[3], 'Классика');
    Self.Series.Add(ArrayForDiagrams[4], 'Мистика');
    Self.Series.Add(ArrayForDiagrams[5], 'Научно-популярные книги');
    Self.Series.Add(ArrayForDiagrams[6], 'Научные книги');
    Self.Series.Add(ArrayForDiagrams[7], 'Приключения');
    Self.Series.Add(ArrayForDiagrams[8], 'Учебная литература');
    Self.Series.Add(ArrayForDiagrams[9], 'Фантастика');
    Self.Series.Add(ArrayForDiagrams[10], 'Другое');
end;

end.
