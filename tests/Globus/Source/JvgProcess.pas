{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvgProcess.PAS, released on 2003-01-15.

The Initial Developer of the Original Code is Andrey V. Chudin,  [chudin@yandex.ru]
Portions created by Andrey V. Chudin are Copyright (C) 2003 Andrey V. Chudin.
All Rights Reserved.

Contributor(s):
Michael Beck [mbeck@bigfoot.com].

Last Modified:  2003-01-15

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}

{$I JVCL.INC}

unit JvgProcess;

interface

//...simple process managment

uses
  Windows, Messages, Classes, Forms,
  JVComponent;

type
  TJvgProcess = class(TJvComponent)
  private
    FRunning: Boolean;
    FFileName: string;
    FOnTerminated: TNotifyEvent;
    FSi: TStartupInfo;
    FInfo: TProcessInformation;
  public
    destructor Destroy; override;
    function Run: Boolean;
    function Kill: Boolean;
  public
    property Info: TProcessInformation read FInfo;
    property Running: Boolean read FRunning;
  published
    property FileName: string read FFileName write FFileName;
    property OnTerminated: TNotifyEvent read FOnTerminated write FOnTerminated;
  end;

implementation

type
  TJvgProcessMonitorThread = class(TThread)
  public
    Process: THandle;
    Owner: TJvgProcess;
    procedure Execute; override;
    procedure DoTerminated;
  end;

var
  ProcessMonitorThread: TJvgProcessMonitorThread;

procedure TJvgProcessMonitorThread.DoTerminated;
begin
  Owner.FRunning := False;
  if not (csDestroying in Owner.ComponentState) then
    if Assigned(Owner.FOnTerminated) then
      Owner.FOnTerminated(Owner);
end;

procedure TJvgProcessMonitorThread.Execute;
begin
  while not Terminated do
    if WaitForSingleObject(Process, 100) <> WAIT_TIMEOUT then
      Break;
  Synchronize(DoTerminated);
end;

destructor TJvgProcess.Destroy;
begin
  Kill;
  inherited Destroy;
end;

function TJvgProcess.Run: Boolean;
begin
  Result := False;
  if Running then
    Exit;
  FillChar(FSi, SizeOf(FSi), #0);
  FSi.cb := SizeOf(FSi);
  GetStartupInfo(FSi);
  FSi.wShowWindow := SW_NORMAL;
  FRunning := CreateProcess(PChar(FFileName), nil, nil, nil, False,
    NORMAL_PRIORITY_CLASS, nil, nil, FSi, FInfo);
  Result := FRunning;
  if FRunning then
  begin
    ProcessMonitorThread := TJvgProcessMonitorThread.Create(True);
    ProcessMonitorThread.FreeOnTerminate := True;
    ProcessMonitorThread.Process := Info.hProcess;
    ProcessMonitorThread.Resume;
  end;
end;

function TJvgProcess.Kill: Boolean;
begin
  if FRunning then
    Result := TerminateProcess(Info.hProcess, 0)
  else
    Result := False;
end;

end.
