unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    AppProp: TApplicationProperties;
    Button1: TButton;
    cbbAppProp: TComboBox;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure cbbAppPropChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

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

procedure TForm1.Button1Click(Sender: TObject);
begin
  QuestionDlg('Question',
              'Are U sure?',
              mtInformation,
              [
              mrYes,'Yep',
              mrNo,'Nope',
              mrAll,'I don''t no'
              ],
              0);
end;

end.

