object frmCalculator: TfrmCalculator
  Left = 0
  Top = 0
  Caption = 'frmCalculator'
  ClientHeight = 293
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grpbxTop: TGroupBox
    Left = 0
    Top = 29
    Width = 361
    Height = 105
    Align = alTop
    Caption = 'Calculator:'
    TabOrder = 1
    ExplicitLeft = 40
    ExplicitTop = 48
    ExplicitWidth = 185
    object pnlDisplay: TPanel
      Left = 2
      Top = 15
      Width = 357
      Height = 88
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 96
      ExplicitTop = 40
      ExplicitWidth = 185
      ExplicitHeight = 41
    end
  end
  object tlbrButtons: TToolBar
    Left = 0
    Top = 0
    Width = 361
    Height = 29
    Caption = 'tlbrButtons'
    TabOrder = 0
    ExplicitLeft = 208
    ExplicitTop = 240
    ExplicitWidth = 150
    object btbtnHelp: TBitBtn
      Left = 0
      Top = 0
      Width = 75
      Height = 22
      DoubleBuffered = True
      Kind = bkHelp
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object btbtnClose: TBitBtn
      Left = 75
      Top = 0
      Width = 75
      Height = 22
      DoubleBuffered = True
      Kind = bkClose
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btbtnCloseClick
    end
  end
  object btnAC: TButton
    Left = 8
    Top = 138
    Width = 99
    Height = 25
    Caption = 'AC'
    TabOrder = 2
    OnClick = btnACClick
  end
  object btnPlusMinus: TButton
    Left = 113
    Top = 138
    Width = 121
    Height = 25
    Caption = '+/-'
    TabOrder = 3
    OnClick = btnPlusMinusClick
  end
  object btnDivide: TButton
    Left = 240
    Top = 138
    Width = 114
    Height = 25
    Caption = '/'
    TabOrder = 4
    OnClick = btnDivideClick
  end
  object btnSeven: TButton
    Left = 8
    Top = 169
    Width = 65
    Height = 25
    Caption = '7'
    TabOrder = 5
    OnClick = btnSevenClick
  end
  object btnEight: TButton
    Left = 79
    Top = 169
    Width = 74
    Height = 25
    Caption = '8'
    TabOrder = 6
    OnClick = btnEightClick
  end
  object btnNine: TButton
    Left = 159
    Top = 169
    Width = 75
    Height = 25
    Caption = '9'
    TabOrder = 7
    OnClick = btnNineClick
  end
  object btnTimes: TButton
    Left = 240
    Top = 169
    Width = 114
    Height = 25
    Caption = '*'
    TabOrder = 8
    OnClick = btnTimesClick
  end
  object btnFour: TButton
    Left = 8
    Top = 200
    Width = 65
    Height = 25
    Caption = '4'
    TabOrder = 9
    OnClick = btnFourClick
  end
  object btnFive: TButton
    Left = 79
    Top = 200
    Width = 75
    Height = 25
    Caption = '5'
    TabOrder = 10
    OnClick = btnFiveClick
  end
  object btnSix: TButton
    Left = 160
    Top = 200
    Width = 75
    Height = 25
    Caption = '6'
    TabOrder = 11
    OnClick = btnSixClick
  end
  object btnMinus: TButton
    Left = 241
    Top = 200
    Width = 112
    Height = 25
    Caption = '-'
    TabOrder = 12
    OnClick = btnMinusClick
  end
  object btnOne: TButton
    Left = 8
    Top = 231
    Width = 65
    Height = 25
    Caption = '1'
    TabOrder = 13
    OnClick = btnOneClick
  end
  object btnTwo: TButton
    Left = 79
    Top = 231
    Width = 75
    Height = 25
    Caption = '2'
    TabOrder = 14
    OnClick = btnTwoClick
  end
  object btnThree: TButton
    Left = 160
    Top = 231
    Width = 75
    Height = 25
    Caption = '3'
    TabOrder = 15
    OnClick = btnThreeClick
  end
  object btnPlus: TButton
    Left = 241
    Top = 231
    Width = 112
    Height = 25
    Caption = '+'
    TabOrder = 16
    OnClick = btnPlusClick
  end
  object btnZero: TButton
    Left = 8
    Top = 262
    Width = 227
    Height = 25
    Caption = '0'
    TabOrder = 17
    OnClick = btnZeroClick
  end
  object btnEquals: TButton
    Left = 241
    Top = 262
    Width = 112
    Height = 25
    Caption = '='
    TabOrder = 18
    OnClick = btnEqualsClick
  end
end
