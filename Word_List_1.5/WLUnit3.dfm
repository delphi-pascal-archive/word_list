object Form3: TForm3
  Left = 595
  Top = 283
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 226
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 168
    Width = 170
    Height = 26
    Caption = #1044#1083#1103' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1089#1087#1080#1089#1082#1072' '#1074#1088#1091#1095#1085#1091#1102' '#1085#1072#1078#1072#1090#1100' F1'
    WordWrap = True
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 193
    Height = 49
    Caption = #1042#1088#1077#1084#1103' '#1076#1086' '#1087#1086#1103#1074#1083#1077#1085#1080#1103' '#1089#1087#1080#1089#1082#1072' '#1089#1083#1086#1074
    TabOrder = 0
    object time2showLabel: TLabel
      Left = 152
      Top = 17
      Width = 5
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object time2showTB: TTrackBar
      Left = 8
      Top = 16
      Width = 145
      Height = 25
      Max = 5000
      Min = 1
      Position = 3456
      TabOrder = 0
      TickStyle = tsNone
      OnChange = time2showTBChange
    end
  end
  object Button1: TButton
    Left = 141
    Top = 192
    Width = 121
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 6
    OnClick = Button1Click
  end
  object RussCB: TCheckBox
    Left = 8
    Top = 120
    Width = 173
    Height = 17
    Caption = #1056#1091#1089#1089#1082#1080#1081' '#1103#1079#1099#1082' '#1087#1086'-'#1091#1084#1086#1083#1095#1072#1085#1080#1102
    TabOrder = 4
  end
  object CheckCB: TCheckBox
    Left = 8
    Top = 144
    Width = 137
    Height = 17
    Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103
    TabOrder = 5
  end
  object GroupBox4: TGroupBox
    Left = 208
    Top = 64
    Width = 193
    Height = 49
    Caption = #1057#1087#1080#1089#1086#1082' '#1088#1072#1079#1076#1077#1083#1080#1090#1077#1083#1077#1081
    TabOrder = 3
    object Rlist: TEdit
      Left = 8
      Top = 16
      Width = 113
      Height = 21
      TabOrder = 0
      Text = '.,":()'
    end
    object Button2: TButton
      Left = 128
      Top = 16
      Width = 57
      Height = 21
      Caption = #1055#1086' '#1091#1084#1086#1083#1095'.'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 208
    Top = 8
    Width = 193
    Height = 49
    Caption = #1057#1080#1084#1074#1086#1083#1086#1074' '#1074' '#1089#1083#1086#1074#1077' '#1076#1086' '#1087#1086#1103#1074#1083#1077#1085#1080#1103
    TabOrder = 1
    object length2showLabel: TLabel
      Left = 168
      Top = 17
      Width = 6
      Height = 18
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object length2showTB: TTrackBar
      Left = 5
      Top = 16
      Width = 164
      Height = 25
      Max = 15
      Min = 1
      ParentShowHint = False
      Position = 14
      ShowHint = True
      TabOrder = 0
      OnChange = length2showTBChange
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 64
    Width = 193
    Height = 49
    Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1072#1103' '#1076#1083#1080#1085#1072' '#1089#1083#1086#1074' '#1089#1087#1080#1089#1082#1072
    TabOrder = 2
    object length2addLabel: TLabel
      Left = 168
      Top = 17
      Width = 6
      Height = 18
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object length2addTB: TTrackBar
      Left = 8
      Top = 16
      Width = 161
      Height = 25
      Min = 1
      Position = 9
      TabOrder = 0
      OnChange = length2addTBChange
    end
  end
  object GroupBox5: TGroupBox
    Left = 208
    Top = 120
    Width = 193
    Height = 57
    TabOrder = 7
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 164
      Height = 13
      Caption = ' '#1062#1074#1077#1090' '#1086#1082#1085#1072'               '#1062#1074#1077#1090' '#1089#1087#1080#1089#1082#1072
    end
    object SpinEdit1: TSpinEdit
      Left = 8
      Top = 24
      Width = 73
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
      OnChange = SpinEdit1Change
      OnDblClick = SpinEdit1DblClick
    end
    object SpinEdit2: TSpinEdit
      Left = 96
      Top = 24
      Width = 81
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
      OnChange = SpinEdit2Change
      OnDblClick = SpinEdit2DblClick
    end
  end
  object CD1: TColorDialog
    Left = 280
    Top = 184
  end
  object CD2: TColorDialog
    Left = 368
    Top = 176
  end
end
