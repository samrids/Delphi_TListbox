object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Move items from one Listbox to another Listbox.'
  ClientHeight = 674
  ClientWidth = 778
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    778
    674)
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 20
    Top = 88
    Width = 307
    Height = 489
    Anchors = [akLeft, akTop, akBottom]
    ItemHeight = 13
    MultiSelect = True
    Sorted = True
    TabOrder = 0
    OnDblClick = ListBox1DblClick
  end
  object btn_RemoveAll: TButton
    Left = 348
    Top = 206
    Width = 53
    Height = 25
    Caption = '<<'
    TabOrder = 1
    OnClick = btn_RemoveAllClick
  end
  object btn_AddOne: TButton
    Left = 348
    Top = 99
    Width = 53
    Height = 25
    Caption = '>'
    TabOrder = 2
    OnClick = btn_AddOneClick
  end
  object btn_AddAll: TButton
    Left = 348
    Top = 130
    Width = 53
    Height = 25
    Caption = '>>'
    TabOrder = 3
    OnClick = btn_AddAllClick
  end
  object btn_RemoveOne: TButton
    Left = 348
    Top = 175
    Width = 53
    Height = 25
    Caption = '<'
    TabOrder = 4
    OnClick = btn_RemoveOneClick
  end
  object Panel1: TPanel
    Left = 20
    Top = 43
    Width = 307
    Height = 39
    Caption = 'Permissions available'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
  end
  object Panel2: TPanel
    Left = 424
    Top = 43
    Width = 307
    Height = 39
    Caption = 'Choosen'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 6
  end
  object ListBox2: TListBox
    Left = 424
    Top = 88
    Width = 307
    Height = 489
    Anchors = [akLeft, akTop, akBottom]
    ItemHeight = 13
    MultiSelect = True
    Sorted = True
    TabOrder = 7
    OnDblClick = ListBox2DblClick
  end
end
