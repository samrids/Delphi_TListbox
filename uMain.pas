unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls;

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
    procedure FormCreate(Sender: TObject);
    procedure btn_AddOneClick(Sender: TObject);
    procedure btn_AddAllClick(Sender: TObject);
    procedure btn_RemoveOneClick(Sender: TObject);
    procedure btn_RemoveAllClick(Sender: TObject);
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
{ TForm2 }

procedure TForm2.btn_AddAllClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Pred(ListBox1.Count) do
  begin
    ListBox2.items.add(ListBox1.items[i]);
  end;
  ListBox1.clear; // Clear all item after add all items.
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
      ListBox2.items.add(ListBox1.items[i]);
      ListBox1.items.Delete(i);
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
    ListBox1.items.add(ListBox2.items[i]);
  end;
  ListBox2.clear; // Clear all item after add all items.
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
      ListBox1.items.add(ListBox2.items[i]);
      ListBox2.items.Delete(i);
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
  btn_AddOne.Enabled := (ListBox1.items.Count > 0);
  btn_AddAll.Enabled := btn_AddOne.Enabled;

  btn_RemoveOne.Enabled := (ListBox2.items.Count > 0);
  btn_RemoveAll.Enabled := btn_RemoveOne.Enabled;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Init;
end;

procedure TForm2.Init;
begin
  ListBox1.items.LoadFromFile('../../Permissions.txt');

  btn_RemoveOne.Enabled := False;
  btn_RemoveAll.Enabled := False;
end;

procedure TForm2.ListBox1DblClick(Sender: TObject);
begin
  if ListBox1.ItemIndex > 0 then
  begin
    ListBox2.items.add(ListBox1.items[ListBox1.ItemIndex]);
    ListBox1.Items.Delete(ListBox1.ItemIndex);
    EnableOperateButton;
  end;
end;

procedure TForm2.ListBox2DblClick(Sender: TObject);
begin
  if ListBox2.ItemIndex > 0 then
  begin
    ListBox1.items.add(ListBox2.items[ListBox2.ItemIndex]);
    ListBox2.Items.Delete(ListBox2.ItemIndex);
    EnableOperateButton;
  end;
end;

end.
