{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvExCheckLst.pas, released on 2004-01-04

The Initial Developer of the Original Code is Andreas Hausladen [Andreas dott Hausladen att gmx dott de]
Portions created by Andreas Hausladen are Copyright (C) 2004 Andreas Hausladen.
All Rights Reserved.

Contributor(s): -

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}
// $Id$

unit JvExCheckLst;

{$I jvcl.inc}
{MACROINCLUDE JvExControls.macros}

{*****************************************************************************
 * WARNING: Do not edit this file.
 * This file is autogenerated from the source in devtools/JvExVCL/src.
 * If you do it despite this warning your changes will be discarded by the next
 * update of this file. Do your changes in the template files.
 ****************************************************************************}

interface

uses
  {$IFDEF UNITVERSIONING}
  JclUnitVersioning,
  {$ENDIF UNITVERSIONING}
  Windows, Messages, Graphics, Controls, Forms, CheckLst,
  {$IFDEF COMPILER6_UP}
  Types,
  {$ENDIF COMPILER6_UP}
  Classes, SysUtils,
  JvTypes, JvThemes, JVCLVer, JvExControls;

 {$DEFINE NeedMouseEnterLeave}

type
  TJvExCheckListBox = class(TCheckListBox, IJvWinControlEvents, IJvControlEvents, IPerformControl)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure BoundsChanged; reintroduce; dynamic; 
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  // IJvControlEvents
  public
    function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
    function IsRightToLeft: Boolean;
  protected
    WindowProc: TClxWindowProc;
    procedure WndProc(var Msg: TMessage); virtual;
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
    procedure ParentColorChanged; override;
  private
    FDoubleBuffered: Boolean;
    InternalFontChanged: TNotifyEvent;
    procedure OnFontChanged(Sender: TObject);
  protected
    procedure DoFontChanged(Sender: TObject); dynamic;
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
    procedure PaintWindow(PaintDevice: QPaintDeviceH);
    function WidgetFlags: Integer; override;
    procedure CreateWnd; dynamic;
    procedure CreateWidget; override;
    procedure RecreateWnd;
  public
    procedure PaintTo(PaintDevice: QPaintDeviceH; X, Y: Integer);
  published
    property DoubleBuffered: Boolean read FDoubleBuffered write FDoubleBuffered;
  {$ENDIF VisualCLX}
  private
    FHintColor: TColor;
    FMouseOver: Boolean;
    FOnParentColorChanged: TNotifyEvent;
  {$IFDEF NeedMouseEnterLeave}
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure FocusChanged(Control: TWinControl); dynamic;
    property MouseOver: Boolean read FMouseOver write FMouseOver;
    property HintColor: TColor read FHintColor write FHintColor default clInfoBk;
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
  private
  {$IFDEF VCL}
    FAboutJVCL: TJVCLAboutInfo;
  published
    property AboutJVCL: TJVCLAboutInfo read FAboutJVCL write FAboutJVCL stored False;
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
    FAboutJVCLX: TJVCLAboutInfo;
  published
    property AboutJVCLX: TJVCLAboutInfo read FAboutJVCLX write FAboutJVCLX stored False;
  {$ENDIF VisualCLX}
  protected
    procedure GetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
    function PaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TJvExPubCheckListBox = class(TJvExCheckListBox)
  {$IFDEF VCL}
  published
    property BiDiMode;
    property DragCursor;
    property DragKind;
    property DragMode;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
  {$ENDIF VCL}
  end;
  

{$IFDEF UNITVERSIONING}
const
  UnitVersioning: TUnitVersionInfo = (
    RCSfile: '$RCSfile$';
    Revision: '$Revision$';
    Date: '$Date$';
    LogPath: 'JVCL\run'
  );
{$ENDIF UNITVERSIONING}

implementation

{$IFDEF VCL}
procedure TJvExCheckListBox.Dispatch(var Msg);
asm
        JMP     DispatchMsg
end;

procedure TJvExCheckListBox.VisibleChanged;
asm
        MOV     EDX, CM_VISIBLECHANGED
        JMP     InheritMsg
end;

procedure TJvExCheckListBox.EnabledChanged;
asm
        MOV     EDX, CM_ENABLEDCHANGED
        JMP     InheritMsg
end;

procedure TJvExCheckListBox.TextChanged;
asm
        MOV     EDX, CM_TEXTCHANGED
        JMP     InheritMsg
end;

procedure TJvExCheckListBox.FontChanged;
asm
        MOV     EDX, CM_FONTCHANGED
        JMP     InheritMsg
end;

procedure TJvExCheckListBox.ColorChanged;
asm
        MOV     EDX, CM_COLORCHANGED
        JMP     InheritMsg
end;

procedure TJvExCheckListBox.ParentFontChanged;
asm
        MOV     EDX, CM_PARENTFONTCHANGED
        JMP     InheritMsg
end;

procedure TJvExCheckListBox.ParentShowHintChanged;
asm
        MOV     EDX, CM_PARENTSHOWHINTCHANGED
        JMP     InheritMsg
end;

function TJvExCheckListBox.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsgEx(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExCheckListBox.HintShow(var HintInfo: THintInfo): Boolean;
begin
  if FHintColor <> clNone then
    HintInfo.HintColor := FHintColor;
  Result := InheritMsgEx(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExCheckListBox.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsgEx(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExCheckListBox.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, Control, FMouseOver, FOnMouseEnter);
end;

procedure TJvExCheckListBox.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(Self, Control, FMouseOver, FOnMouseLeave);
end;

procedure TJvExCheckListBox.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExCheckListBox.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExCheckListBox.BoundsChanged;
begin
end;

procedure TJvExCheckListBox.CursorChanged;
asm
        MOV     EDX, CM_CURSORCHANGED
        JMP     InheritMsg
end;

procedure TJvExCheckListBox.ShowHintChanged;
asm
        MOV     EDX, CM_SHOWHINTCHANGED
        JMP     InheritMsg
end;

procedure TJvExCheckListBox.ShowingChanged;
asm
        MOV     EDX, CM_SHOWINGCHANGED
        JMP     InheritMsg
end;

procedure TJvExCheckListBox.ControlsListChanging(Control: TControl; Inserting: Boolean);
asm
        JMP     Control_ControlsListChanging
end;

procedure TJvExCheckListBox.ControlsListChanged(Control: TControl; Inserting: Boolean);
asm
        JMP     Control_ControlsListChanged
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExCheckListBox.GetParentBackground: Boolean;
asm
        JMP     JvThemes.GetParentBackground
end;

procedure TJvExCheckListBox.SetParentBackground(Value: Boolean);
asm
        JMP     JvThemes.SetParentBackground
end;
{$ENDIF JVCLThemesEnabledD56}
  
{$ENDIF VCL}
{$IFDEF VisualCLX}
procedure TJvExCheckListBox.MouseEnter(Control: TControl);
begin
  Control_MouseEnter(Self, Control, FMouseOver);
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExCheckListBox.MouseLeave(Control: TControl);
begin
  Control_MouseLeave(Self, Control, FMouseOver);
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExCheckListBox.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExCheckListBox.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
var
  Mesg: TMessage;
begin
  Mesg.Result := 0;
  if Self <> nil then
  begin
    Mesg.Msg := Msg;
    Mesg.WParam := WParam;
    Mesg.LParam := LParam;
    WindowProc(Mesg);
  end;
  Result := Mesg.Result;
end;

procedure TJvExCheckListBox.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;

function TJvExCheckListBox.IsRightToLeft: Boolean;
begin
  Result := False;
end;
  
function TJvExCheckListBox.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := WidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExCheckListBox.OnFontChanged(Sender: TObject);
var
  FontChangedEvent: QEventH;
begin
  FontChangedEvent := QEvent_create(QEventType_FontChanged);
  if FontChangedEvent <> nil then
    QApplication_postEvent(Handle, FontChangedEvent);
end;

procedure TJvExCheckListBox.DoFontChanged(Sender: TObject);
begin
  if Assigned(InternalFontChanged) then
    InternalFontChanged(Self);
end;

procedure TJvExCheckListBox.RecreateWnd;
begin
  RecreateWidget;
end;

procedure TJvExCheckListBox.CreateWidget;
begin
  CreateWnd;
end;

procedure TJvExCheckListBox.CreateWnd;
begin
  inherited CreateWidget;
end;

function TJvExCheckListBox.WidgetFlags: Integer;
begin
  Result := inherited WidgetFlags or
    Integer(WidgetFlags_WRepaintNoErase) or
    Integer(WidgetFlags_WMouseNoMask);
end;

function TJvExCheckListBox.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
begin
  Result := inherited EventFilter(Sender, Event);
  Result := Result or WidgetControl_EventFilter(Self, Sender, Event);
end;

procedure TJvExCheckListBox.PaintWindow(PaintDevice: QPaintDeviceH);
begin
  WidgetControl_PaintTo(Self, PaintDevice, 0, 0);
end;

procedure TJvExCheckListBox.PaintTo(PaintDevice: QPaintDeviceH; X, Y: Integer);
begin
  WidgetControl_PaintTo(Self, PaintDevice, X, Y);
end;
  
{$ENDIF VisualCLX}
procedure TJvExCheckListBox.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  FocusChanged(Msg.Sender);
end;

procedure TJvExCheckListBox.FocusChanged(Control: TWinControl);
begin
end;
  
procedure TJvExCheckListBox.GetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExCheckListBox.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExCheckListBox.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExCheckListBox.PaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
        JMP     DefaultPaintBackground
end;
  
constructor TJvExCheckListBox.Create(AOwner: TComponent);
begin
  {$IFDEF VisualCLX}
  WindowProc := WndProc;
  {$ENDIF VisualCLX}
  inherited Create(AOwner);
  {$IFDEF VisualCLX}
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  InternalFontChanged := Font.OnChange;
  Font.OnChange := OnFontChanged;
  {$ENDIF VisualCLX}
  FHintColor := Application.HintColor;
  
end;

{$IFDEF VisualCLX}
procedure TJvExCheckListBox.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  WidgetControl_Painting(Self, Canvas, EventRegion);
end;

procedure TJvExCheckListBox.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}

destructor TJvExCheckListBox.Destroy;
begin
  inherited Destroy;
end;
  

{$IFDEF UNITVERSIONING}
initialization
  RegisterUnitVersion(HInstance, UnitVersioning);

finalization
  UnregisterUnitVersion(HInstance);
{$ENDIF UNITVERSIONING}

end.
