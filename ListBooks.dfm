object BooksForm: TBooksForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1087#1080#1089#1086#1082' '#1083#1080#1090#1077#1088#1072#1090#1091#1088#1099
  ClientHeight = 455
  ClientWidth = 887
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object AddButton: TButton
    Left = 8
    Top = 8
    Width = 125
    Height = 29
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = AddButtonClick
  end
  object DeleteButton: TButton
    Left = 139
    Top = 8
    Width = 125
    Height = 29
    Caption = #1059#1076#1072#1083#1080#1090#1100
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = DeleteButtonClick
  end
  object SearchBox: TSearchBox
    Left = 270
    Top = 8
    Width = 609
    Height = 28
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TextHint = #1055#1086#1080#1089#1082
    OnChange = SearchBoxChange
    OnKeyPress = SearchBoxKeyPress
  end
  object BooksTabel: TStringGrid
    Left = 8
    Top = 37
    Width = 871
    Height = 383
    TabStop = False
    DefaultColWidth = 173
    DoubleBuffered = False
    FixedColor = clMoneyGreen
    FixedCols = 0
    RowCount = 2
    FixedRows = 0
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    GradientEndColor = clSkyBlue
    GradientStartColor = clWindow
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect, goFixedColClick, goFixedRowClick]
    ParentDoubleBuffered = False
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 3
    OnDblClick = BooksTabelDblClick
    OnFixedCellClick = BooksTabelFixedCellClick
    RowHeights = (
      24
      24)
  end
  object MainMenu: TMainMenu
    Left = 744
    Top = 448
    object FileButton: TMenuItem
      Caption = #1060#1072#1081#1083
      object SaveBtn: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        ShortCut = 16467
        OnClick = SaveBtnClick
      end
    end
    object HelpButton: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      OnClick = HelpButtonClick
    end
    object Settings: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      object ChangeStyleButton: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1077#1084#1091
        OnClick = ChangeStyleButtonClick
      end
    end
    object StatisticsButton: TMenuItem
      Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
      OnClick = StatisticsButtonClick
    end
  end
  object SaveDialog: TSaveDialog
    Left = 744
    Top = 448
  end
end
