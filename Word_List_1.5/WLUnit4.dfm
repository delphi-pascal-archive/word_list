object SHform: TSHform
  Left = 319
  Top = 151
  Width = 193
  Height = 461
  BorderStyle = bsSizeToolWin
  Caption = #1057#1087#1080#1089#1086#1082
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SHListBox: TListBox
    Left = 0
    Top = 0
    Width = 185
    Height = 423
    Align = alClient
    ItemHeight = 13
    TabOrder = 0
    OnKeyDown = SHListBoxKeyDown
  end
end
