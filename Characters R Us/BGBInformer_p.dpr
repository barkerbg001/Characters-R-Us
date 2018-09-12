program BGBInformer_p;

uses
  Forms,
  BGBInformer_u in 'BGBInformer_u.pas' {frmBGBInformer},
  Calculator_u in 'Calculator_u.pas' {frmCalculator};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmBGBInformer, frmBGBInformer);
  Application.CreateForm(TfrmCalculator, frmCalculator);
  Application.Run;
end.
