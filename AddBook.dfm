object AddBookForm: TAddBookForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1082#1085#1080#1075#1080
  ClientHeight = 281
  ClientWidth = 333
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Showcard Gothic'
  Font.Style = [fsBold]
  Menu = MainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 17
  object NameBookLabel: TLabel
    Left = 8
    Top = 47
    Width = 108
    Height = 16
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1085#1080#1075#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object AuthorBookLabel: TLabel
    Left = 8
    Top = 88
    Width = 86
    Height = 16
    Caption = #1040#1074#1090#1086#1088' '#1082#1085#1080#1075#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object YearPublBookLabel: TLabel
    Left = 8
    Top = 128
    Width = 87
    Height = 16
    Caption = #1043#1086#1076' '#1080#1079#1076#1072#1085#1080#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BookGenreLabel: TLabel
    Left = 8
    Top = 168
    Width = 42
    Height = 16
    Caption = #1046#1072#1085#1088':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ShelfNumberLabel: TLabel
    Left = 8
    Top = 210
    Width = 92
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1087#1086#1083#1082#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TextLabel: TLabel
    Left = 8
    Top = 8
    Width = 288
    Height = 16
    Caption = #1055#1086#1078#1072#1083#1091#1081#1089#1090#1072', '#1079#1072#1087#1086#1083#1085#1080#1090#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1082#1085#1080#1075#1080':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object NameErrorLabel: TLabel
    Left = 122
    Top = 62
    Width = 148
    Height = 13
    Caption = #1054#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1082#1085#1080#1075#1080
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object AuthorErrorLabel: TLabel
    Left = 122
    Top = 102
    Width = 131
    Height = 13
    Caption = #1054#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090' '#1072#1074#1090#1086#1088' '#1082#1085#1080#1075#1080
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object YearPublErrorLabel: TLabel
    Left = 124
    Top = 142
    Width = 188
    Height = 13
    Caption = #1043#1086#1076' '#1080#1079#1076#1072#1085#1080#1103' '#1076#1086#1083#1078#1077#1085' '#1080#1084#1077#1090#1100' '#1074#1080#1076' '#1061#1061#1061#1061
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object GenreErrorLabel: TLabel
    Left = 124
    Top = 182
    Width = 121
    Height = 13
    Caption = #1054#1090#1089#1091#1090#1089#1074#1091#1077#1090' '#1078#1072#1085#1088' '#1082#1085#1080#1075#1080
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object NameBookEdit: TEdit
    Left = 122
    Top = 40
    Width = 203
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = NameBookEditChange
    OnKeyPress = NameBookEditKeyPress
  end
  object AuthorBookEdit: TEdit
    Left = 122
    Top = 80
    Width = 203
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = AuthorBookEditChange
    OnKeyPress = AuthorBookEditKeyPress
  end
  object YearPublBookEdit: TEdit
    Left = 122
    Top = 120
    Width = 203
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = YearPublBookEditChange
    OnKeyPress = YearPublBookEditKeyPress
  end
  object ShelfNumberEdit: TSpinEdit
    Left = 124
    Top = 200
    Width = 201
    Height = 26
    EditorEnabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxValue = 50
    MinValue = 1
    ParentFont = False
    TabOrder = 3
    Value = 1
  end
  object AddBookButton: TButton
    Left = 8
    Top = 242
    Width = 129
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = AddBookButtonClick
  end
  object CloseButton: TButton
    Left = 196
    Top = 242
    Width = 129
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = CloseButtonClick
  end
  object GenreBookEdit: TComboBox
    Left = 122
    Top = 160
    Width = 203
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Sorted = True
    TabOrder = 6
    OnChange = GenreBookEditChange
    OnKeyPress = GenreBookEditKeyPress
    Items.Strings = (
      #1044#1077#1090#1077#1082#1090#1080#1074#1099
      #1046#1077#1085#1089#1082#1080#1077' '#1088#1086#1084#1072#1085#1099
      #1048#1089#1090#1086#1088#1080#1095#1077#1089#1082#1080#1077' '#1082#1085#1080#1075#1080
      #1050#1083#1072#1089#1089#1080#1082#1072
      #1052#1080#1089#1090#1080#1082#1072
      #1053#1072#1091#1095#1085#1086'-'#1087#1086#1087#1091#1083#1103#1088#1085#1099#1077
      #1053#1072#1091#1095#1085#1099#1077' '#1082#1085#1080#1075#1080
      #1055#1088#1080#1082#1083#1102#1095#1077#1085#1080#1103
      #1059#1095#1077#1073#1085#1072#1103' '#1083#1080#1090#1077#1088#1072#1090#1091#1088#1072
      #1060#1072#1085#1090#1072#1089#1090#1080#1082#1072)
  end
  object MainMenu: TMainMenu
    Left = 328
    Top = 272
    object HelpButton: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      OnClick = HelpButtonClick
    end
  end
end
