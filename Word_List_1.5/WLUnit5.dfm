object WLBForm: TWLBForm
  Left = 341
  Top = 9999
  BorderStyle = bsNone
  Caption = 'WLBForm'
  ClientHeight = 58
  ClientWidth = 142
  Color = clBtnFace
  Constraints.MinHeight = 50
  Constraints.MinWidth = 150
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Visible = True
  OnMouseUp = WLBMouseDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object WLB: TListBox
    Left = 0
    Top = 0
    Width = 142
    Height = 58
    Align = alClient
    Color = clWhite
    Ctl3D = True
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 0
    OnKeyDown = WLBKeyDown
    OnMouseDown = WLBMouseDown
  end
end
