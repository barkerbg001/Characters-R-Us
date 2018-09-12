unit Calculator_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ToolWin, ComCtrls;

type
  TfrmCalculator = class(TForm)
    grpbxTop: TGroupBox;
    tlbrButtons: TToolBar;
    pnlDisplay: TPanel;
    btnAC: TButton;
    btnPlusMinus: TButton;
    btnDivide: TButton;
    btnSeven: TButton;
    btnEight: TButton;
    btnNine: TButton;
    btnTimes: TButton;
    btnFour: TButton;
    btnFive: TButton;
    btnSix: TButton;
    btnMinus: TButton;
    btnOne: TButton;
    btnTwo: TButton;
    btnThree: TButton;
    btnPlus: TButton;
    btnZero: TButton;
    btnEquals: TButton;
    btbtnClose: TBitBtn;
    btbtnHelp: TBitBtn;
    procedure btnACClick(Sender: TObject);
    procedure btnPlusMinusClick(Sender: TObject);
    procedure btnDivideClick(Sender: TObject);
    procedure btnTimesClick(Sender: TObject);
    procedure btnMinusClick(Sender: TObject);
    procedure btnPlusClick(Sender: TObject);
    procedure btbtnCloseClick(Sender: TObject);
    procedure btnEqualsClick(Sender: TObject);
    procedure btnZeroClick(Sender: TObject);
    procedure btnOneClick(Sender: TObject);
    procedure btnTwoClick(Sender: TObject);
    procedure btnThreeClick(Sender: TObject);
    procedure btnFourClick(Sender: TObject);
    procedure btnFiveClick(Sender: TObject);
    procedure btnSixClick(Sender: TObject);
    procedure btnSevenClick(Sender: TObject);
    procedure btnEightClick(Sender: TObject);
    procedure btnNineClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalculator: TfrmCalculator;
  Cur: Int64;
  Second: Int64;

  Opert: Integer;

  Plus: Integer;
  Minus: Integer;
  Divide: Integer;
  Multiply: Integer;

implementation

{$R *.dfm}

procedure TfrmCalculator.btbtnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmCalculator.btnACClick(Sender: TObject);
begin
  Cur:= 0;
  Second:= 0;
  pnlDisplay.Caption:= IntToStr(Cur);
end;

procedure TfrmCalculator.btnDivideClick(Sender: TObject);
begin
  Second:= Cur;
  Cur:= 0;

  Opert:= Divide;

  pnlDisplay.Caption:= IntToStr(Cur);
end;

procedure TfrmCalculator.btnEightClick(Sender: TObject);
begin
  Cur:= Cur * 10;
  Cur:= Cur + 8;
  pnlDisplay.Caption:= IntToStr(Cur);
end;

procedure TfrmCalculator.btnEqualsClick(Sender: TObject);
begin
  if Opert = Plus
  then begin
         pnlDisplay.Caption:= IntToStr(Cur + Second);
       end;

  if Opert = Minus
  then begin
         pnlDisplay.Caption:= IntToStr(Second - Cur)
       end;

  if Opert = Divide
  then begin
         pnlDisplay.Caption:= FloatToStr(Second / Cur)
       end;

  if Opert = Multiply
  then begin
         pnlDisplay.Caption:= IntToStr(Second * Cur)
       end;

  Cur:=0;
  Second:=0;
end;

procedure TfrmCalculator.btnFiveClick(Sender: TObject);
begin
  Cur:= Cur * 10;
  Cur:= Cur + 5;
  pnlDisplay.Caption:= IntToStr(Cur);
end;

procedure TfrmCalculator.btnFourClick(Sender: TObject);
begin
  Cur:= Cur * 10;
  Cur:= Cur + 4;
  pnlDisplay.Caption:= IntToStr(Cur);
end;

procedure TfrmCalculator.btnMinusClick(Sender: TObject);
begin
  Second:= Cur;
  Cur:= 0;

  Opert:= Minus;

  pnlDisplay.Caption:= IntToStr(Cur);
end;

procedure TfrmCalculator.btnNineClick(Sender: TObject);
begin
  Cur:= Cur * 10;
  Cur:= Cur + 9;
  pnlDisplay.Caption:= IntToStr(Cur);
end;

procedure TfrmCalculator.btnOneClick(Sender: TObject);
begin
  Cur:= Cur * 10;
  Cur:= Cur + 1;
  pnlDisplay.Caption:= IntToStr(Cur);
end;

procedure TfrmCalculator.btnPlusClick(Sender: TObject);
begin
  Second:= Cur;
  Cur:= 0;

  Opert:= Plus;

  pnlDisplay.Caption:= IntToStr(Cur);
end;

procedure TfrmCalculator.btnPlusMinusClick(Sender: TObject);
begin
  Cur:= Cur * -1;
  pnlDisplay.Caption:= IntToStr(Cur);
end;

procedure TfrmCalculator.btnSevenClick(Sender: TObject);
begin
  Cur:= Cur * 10;
  Cur:= Cur + 7;
  pnlDisplay.Caption:= IntToStr(Cur);
end;

procedure TfrmCalculator.btnSixClick(Sender: TObject);
begin
  Cur:= Cur * 10;
  Cur:= Cur + 6;
  pnlDisplay.Caption:= IntToStr(Cur);
end;

procedure TfrmCalculator.btnThreeClick(Sender: TObject);
begin
  Cur:= Cur * 10;
  Cur:= Cur + 3;
  pnlDisplay.Caption:= IntToStr(Cur);
end;

procedure TfrmCalculator.btnTimesClick(Sender: TObject);
begin
  Second:= Cur;
  Cur:= 0;

  Opert:= Multiply;

  pnlDisplay.Caption:= IntToStr(Cur);
end;

procedure TfrmCalculator.btnTwoClick(Sender: TObject);
begin
  Cur:= Cur * 10;
  Cur:= Cur + 2;
  pnlDisplay.Caption:= IntToStr(Cur);
end;

procedure TfrmCalculator.btnZeroClick(Sender: TObject);
begin
  Cur:= Cur * 10;
  Cur:= Cur + 0;
  pnlDisplay.Caption:= IntToStr(Cur);
end;

procedure TfrmCalculator.FormCreate(Sender: TObject);
begin
  Plus:= 1;
  Minus:= 2;
  Divide:= 3;
  Multiply:= 4;
end;

end.
