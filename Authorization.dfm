object AuthorizationForm: TAuthorizationForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1042#1093#1086#1076' '
  ClientHeight = 188
  ClientWidth = 175
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LoginLabel: TLabel
    Left = 8
    Top = 8
    Width = 42
    Height = 14
    Caption = #1051#1086#1075#1080#1085':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PasswordLabel: TLabel
    Left = 8
    Top = 68
    Width = 51
    Height = 14
    Caption = #1055#1072#1088#1086#1083#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LoginErrorLabel: TLabel
    Left = 8
    Top = 49
    Width = 98
    Height = 13
    Caption = #1054#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090' '#1083#1086#1075#1080#1085
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object PasswordErrorLabel: TLabel
    Left = 8
    Top = 109
    Width = 105
    Height = 13
    Caption = #1054#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090' '#1087#1072#1088#1086#1083#1100
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object LoginEdit: TEdit
    Left = 8
    Top = 28
    Width = 153
    Height = 21
    Color = clHighlightText
    TabOrder = 0
    OnChange = LoginEditChange
  end
  object PasswordEdit: TEdit
    Left = 8
    Top = 88
    Width = 153
    Height = 21
    Color = clHighlightText
    PasswordChar = '*'
    TabOrder = 1
    OnChange = PasswordEditChange
  end
  object EntryButton: TButton
    Left = 8
    Top = 155
    Width = 153
    Height = 25
    Caption = #1042#1086#1081#1090#1080
    TabOrder = 2
    OnClick = EntryButtonClick
  end
  object CheckBox: TCheckBox
    Left = 8
    Top = 131
    Width = 146
    Height = 18
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1088#1086#1083#1100
    TabOrder = 3
    WordWrap = True
    OnClick = CheckBoxClick
  end
  object MainMenu: TMainMenu
    Left = 192
    Top = 16
    object HelpButton: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      OnClick = HelpButtonClick
    end
  end
end
