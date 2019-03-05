unit svm_grabber;

{$inline on}

interface

uses
   SysUtils;

const
   GrabberBlockSize = 1024 * 256;

type
   TGrabber = object
   private
      i_pos, size: cardinal;
      tasks: array of pointer;
   public
      procedure AddTask(p: Pointer);
      procedure Run;
      procedure Init;
   end;

   PGrabber = ^TGrabber;

implementation

uses svm_mem;

procedure TGrabber.Init;
begin
   SetLength(tasks, GrabberBlockSize);
   size := GrabberBlockSize;
   i_pos := 0;
end;

procedure TGrabber.AddTask(p: Pointer); inline;
begin
   tasks[i_pos] := p;
   Inc(i_pos);
   if i_pos >= size then
    begin
      size := size + GrabberBlockSize;
      SetLength(tasks, size);
    end;
end;

procedure TGrabber.Run; inline;
begin
   while i_pos > 0 do
    begin
      Dec(i_pos);
      if (TObject(tasks[i_pos]) is TSVMMem) then
        begin
          if TSVMMem(tasks[i_pos]).m_type <> svmtClass then
           FreeAndNil(tasks[i_pos]);
        end
      else
      FreeAndNil(tasks[i_pos]);
    end;
   size := GrabberBlockSize;
   SetLength(tasks, size);
end;

end.

