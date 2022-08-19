unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    AppProp: TApplicationProperties;
    btn_propapp: TButton;
    btn_custom: TButton;
    cbbAppProp: TComboBox;
    Label1: TLabel;
    procedure btn_customClick(Sender: TObject);
    procedure btn_propappClick(Sender: TObject);
    procedure cbbAppPropChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

const
  mrNoneCust=      20;
  mrOkCust=        mrNoneCust + 1;
  mrCancelCust=    mrNoneCust + 2;
  mrAbortCust=     mrNoneCust + 3;
  mrRetryCust=     mrNoneCust + 4;
  mrIgnoreCust=    mrNoneCust + 5;
  mrYesCust=       mrNoneCust + 6;
  mrNoCust=        mrNoneCust + 7;
  mrAllCust=       mrNoneCust + 8;
  mrYesToAllCust=  mrNoneCust + 10;
  mrCloseCust=     mrNoneCust + 11;
  mrLastCust=      mrCloseCust;
var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  with cbbAppProp do
  begin
    Clear;
    Items.Add('always');
    Items.Add('never');
    Items.Add('system');
    ItemIndex:= 0;

  end;

end;

procedure TForm1.cbbAppPropChange(Sender: TObject);
begin
  case cbbAppProp.ItemIndex of
    0: AppProp.ShowButtonGlyphs:= sbgAlways;
    1: AppProp.ShowButtonGlyphs:= sbgNever;
    2: AppProp.ShowButtonGlyphs:= sbgSystem;
  end;
end;

procedure TForm1.btn_propappClick(Sender: TObject);
begin
  QuestionDlg('Question',
              'Are U sure?',
              mtInformation,
              [
              {$IFNDEF DARWIN}
              mrYes,'Yep',
              mrNo,'Nope',
              mrAll,'I don''t no'
              {$ELSE}
              mrAll,'I don''t no',
              mrNo,'Nope',
              mrYes,'Yep'
              {$ENDIF}
              ],
              0);
end;

procedure TForm1.btn_customClick(Sender: TObject);
begin
  QuestionDlg('Question',
              'Are U sure?',
              mtInformation,
              [
              {$IFNDEF DARWIN}
              mrYesCust,'Yep',
              mrNoCust,'Nope',
              mrAllCust,'I don''t no'
              {$ELSE}
              mrAllCust,'I don''t no',
              mrNoCust,'Nope',
              mrYesCust,'Yep'
              {$ENDIF}
              ],
              0);
end;

end.

