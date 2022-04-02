unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    ListBox1: TListBox;
    btn_RemoveAll: TButton;
    btn_AddOne: TButton;
    btn_AddAll: TButton;
    btn_RemoveOne: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    ListBox2: TListBox;
    procedure btn_AddOneClick(Sender: TObject);
    procedure btn_AddAllClick(Sender: TObject);
    procedure btn_RemoveAllClick(Sender: TObject);
    procedure btn_RemoveOneClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ListBox2DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init;
    procedure EnableOperateButton;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btn_AddAllClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Pred(ListBox1.Count) do
  begin
    ListBox2.Items.add(ListBox1.Items[i]);
  end;
  ListBox1.Clear;
  EnableOperateButton;
end;

procedure TForm2.btn_AddOneClick(Sender: TObject);
var
  i: integer;
begin
  for i := Pred(ListBox1.Count) downto 0 do
  begin
    if ListBox1.Selected[i] then
    begin
      ListBox2.Items.add(ListBox1.Items[i]);
      ListBox1.Items.Delete(i);
    end;
  end;

  if ListBox1.Count > 0 then
  begin
    if ListBox1.CanFocus then
    begin
      ListBox1.Selected[0] := True;
      ListBox1.SetFocus;
    end;
  end;
  EnableOperateButton;
end;

procedure TForm2.btn_RemoveAllClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Pred(ListBox2.Count) do
  begin
    ListBox1.Items.add(ListBox2.Items[i]);
  end;
  ListBox2.Clear;
  EnableOperateButton;
end;

procedure TForm2.btn_RemoveOneClick(Sender: TObject);
var
  i: integer;
begin
  for i := Pred(ListBox2.Count) downto 0 do
  begin
    if ListBox2.Selected[i] then
    begin
      ListBox1.Items.add(ListBox2.Items[i]);
      ListBox2.Items.Delete(i);
    end;
  end;

  if ListBox2.Count > 0 then
  begin
    if ListBox2.CanFocus then
    begin
      ListBox2.Selected[0] := True;
      ListBox2.SetFocus;
    end;
  end;
  EnableOperateButton;
end;

procedure TForm2.EnableOperateButton;
begin
  btn_AddOne.Enabled := (ListBox1.Items.Count>0);
  btn_AddAll.Enabled :=  btn_AddOne.Enabled;

  btn_RemoveOne.Enabled := (ListBox2.Items.Count>0);
  btn_RemoveAll.Enabled :=  btn_RemoveOne.Enabled;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Init;
end;

procedure TForm2.Init;
begin
  ListBox1.Items.LoadFromFile('../../Permissons.txt');
//  ListBox1.Items.LoadFromFile(extractfilepath(Paramstr(0))+'Permissons.txt');
end;

procedure TForm2.ListBox1DblClick(Sender: TObject);
begin
  ListBox2.Items.add(ListBox1.Items[ListBox1.ItemIndex]);
  ListBox1.Items.Delete(Listbox1.ItemIndex);
end;

procedure TForm2.ListBox2DblClick(Sender: TObject);
begin
  ListBox1.Items.add(ListBox2.Items[ListBox2.ItemIndex]);
  ListBox2.Items.Delete(Listbox2.ItemIndex);
end;

end.
