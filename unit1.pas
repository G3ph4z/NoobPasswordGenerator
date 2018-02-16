unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls, Clipbrd;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  pcrt: SmallInt;

implementation

{$R *.lfm}

{ TForm1 }

function RandomString(StringLen:Integer;CB1:TCheckBox;CB2:TCheckBox):String;
var  str:String;
begin
    Randomize;
    str:='abcdefghijklmnopqrstuvwxyz';
    IF CB1.Checked AND CB2.Checked then
           str := Concat('abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ',',','.','/','!','@','#','$','%','^','&','*','''','"',';','_','(',')',':','|','[',']')
    Else
        begin
          IF CB1.Checked then
                 str := Concat('abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')
          else
              begin
                IF CB2.Checked then
                   str := Concat('abcdefghijklmnopqrstuvwxyz',',','.','/','!','@','#','$','%','^','&','*','''','"',';','_','(',')',':','|','[',']');
              end
    end;
    Result:='';
    repeat
        Result:=Result+str[Random(Length(str))+1];
    until(Length(Result)=StringLen)
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  length:SmallInt;
begin
    length := StrToint(Edit2.Text);

    IF (length = 0) OR (length < 0) then
       begin
            Edit1.Text := 'Length have to bigger than zero';
       end
    else
        begin
             Edit1.Text := RandomString(length,CheckBox1,CheckBox2);
             Clipboard.AsText := Edit1.Text;
             pcrt := pcrt+1;
             StatusBar1.Panels[3].Text := IntToStr(pcrt);
        end;
end;

end.

