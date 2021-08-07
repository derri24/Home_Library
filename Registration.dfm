object RegistrationForm: TRegistrationForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
  ClientHeight = 298
  ClientWidth = 340
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
  object NameLabel: TLabel
    Left = 8
    Top = 48
    Width = 26
    Height = 16
    Caption = #1048#1084#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object MailLabel: TLabel
    Left = 8
    Top = 88
    Width = 38
    Height = 16
    Caption = 'E-Mail'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LoginLabel: TLabel
    Left = 8
    Top = 128
    Width = 39
    Height = 16
    Caption = #1051#1086#1075#1080#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Password1Label: TLabel
    Left = 8
    Top = 168
    Width = 50
    Height = 16
    Caption = #1055#1072#1088#1086#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Password2Label: TLabel
    Left = 8
    Top = 201
    Width = 55
    Height = 32
    Caption = #1055#1072#1088#1086#1083#1100' '#1077#1097#1105' '#1088#1072#1079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object InfLabel: TLabel
    Left = 8
    Top = 8
    Width = 263
    Height = 18
    Caption = #1044#1083#1103' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1079#1072#1087#1086#1083#1085#1080#1090#1077' '#1087#1086#1083#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object NameErrorLabel: TLabel
    Left = 71
    Top = 62
    Width = 87
    Height = 13
    Caption = #1054#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090' '#1080#1084#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object MailErrorLabel: TLabel
    Left = 71
    Top = 102
    Width = 97
    Height = 13
    Caption = #1054#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090' E-Mail'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LoginErrorLabel: TLabel
    Left = 71
    Top = 142
    Width = 98
    Height = 13
    Caption = #1054#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090' '#1083#1086#1075#1080#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Password1ErrorLabel: TLabel
    Left = 71
    Top = 182
    Width = 105
    Height = 13
    Caption = #1054#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090' '#1087#1072#1088#1086#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Password2ErrorLabel: TLabel
    Left = 71
    Top = 222
    Width = 164
    Height = 13
    Caption = #1054#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090' '#1087#1086#1074#1090#1086#1088#1085#1099#1081' '#1087#1072#1088#1086#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object RegistrationButtonButton: TButton
    Left = 8
    Top = 264
    Width = 137
    Height = 26
    Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = RegistrationButtonButtonClick
  end
  object NameEdit: TEdit
    Left = 71
    Top = 40
    Width = 250
    Height = 21
    TabOrder = 1
    OnChange = NameEditChange
    OnKeyPress = NameEditKeyPress
  end
  object BackButton: TButton
    Left = 186
    Top = 264
    Width = 137
    Height = 27
    Caption = #1053#1072#1079#1072#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BackButtonClick
  end
  object MailEdit: TEdit
    Left = 71
    Top = 80
    Width = 250
    Height = 21
    TabOrder = 3
    OnChange = MailEditChange
    OnKeyPress = MailEditKeyPress
  end
  object LoginEdit: TEdit
    Left = 71
    Top = 120
    Width = 250
    Height = 21
    TabOrder = 4
    OnChange = LoginEditChange
    OnKeyPress = LoginEditKeyPress
  end
  object Password1Edit: TEdit
    Left = 71
    Top = 160
    Width = 250
    Height = 21
    PasswordChar = '*'
    TabOrder = 5
    OnChange = Password1EditChange
    OnKeyPress = Password1EditKeyPress
  end
  object Password2Edit: TEdit
    Left = 71
    Top = 200
    Width = 250
    Height = 21
    PasswordChar = '*'
    TabOrder = 6
    OnChange = Password2EditChange
    OnKeyPress = Password2EditKeyPress
  end
  object CheckBox: TCheckBox
    Left = 71
    Top = 241
    Width = 109
    Height = 17
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1088#1086#1083#1100
    TabOrder = 7
    OnClick = CheckBoxClick
  end
  object MainMenu: TMainMenu
    Left = 320
    Top = 65528
    object HelpButton: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      OnClick = HelpButtonClick
    end
  end
end
