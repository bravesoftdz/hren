unit TabbedFormwithNavigation;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Graphics, FMX.Forms, FMX.Dialogs, FMX.TabControl, FMX.StdCtrls,
  System.Actions, FMX.ActnList, FMX.Gestures;

type
  TTabbedwithNavigationForm = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    ActionList1: TActionList;
    TabControl2: TTabControl;
    TabItem5: TTabItem;
    TabItem6: TTabItem;
    ToolBar1: TToolBar;
    lblTitle1: TLabel;
    ToolBar2: TToolBar;
    lblTitle2: TLabel;
    ToolBar3: TToolBar;
    lblTitle3: TLabel;
    ToolBar4: TToolBar;
    lblTitle4: TLabel;
    ToolBar5: TToolBar;
    lblTitle5: TLabel;
    btnBack: TSpeedButton;
    btnNext: TSpeedButton;
    GestureManager1: TGestureManager;
    PreviousTabAction: TPreviousTabAction;
    NextTabAction: TNextTabAction;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure TabControl1Gesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TabbedwithNavigationForm: TTabbedwithNavigationForm;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.iPhone4in.fmx IOS}

procedure TTabbedwithNavigationForm.FormCreate(Sender: TObject);
begin
  { This defines the default active tab at runtime }
  TabControl1.ActiveTab := TabItem1;
end;

procedure TTabbedwithNavigationForm.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkHardwareBack then
  begin
    {if (TabControl1.ActiveTab = TabItem1) and (TabControl2.ActiveTab = TabItem6) then
    begin
      TabControl2.Previous;
      Key := 0;
    end;  }
    if (TabControl1.ActiveTab <> TabItem1) then begin
       if TabControl1.ActiveTab = TabItem4 then TabControl1.ActiveTab := TabItem3
       else
       if TabControl1.ActiveTab = TabItem3 then TabControl1.ActiveTab := TabItem2
       else
       if TabControl1.ActiveTab = TabItem2 then TabControl1.ActiveTab := TabItem1;
       key:=0;
    end;

  end;
end;

procedure TTabbedwithNavigationForm.TabControl1Gesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
{$IFDEF ANDROID}
  case EventInfo.GestureID of
    sgiLeft:
    begin
      if TabControl1.ActiveTab <> TabControl1.Tabs[TabControl1.TabCount-1] then
        TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex+1];
      Handled := True;
    end;

    sgiRight:
    begin
      if TabControl1.ActiveTab <> TabControl1.Tabs[0] then
        TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex-1];
      Handled := True;
    end;
  end;
{$ENDIF}
end;

end.
