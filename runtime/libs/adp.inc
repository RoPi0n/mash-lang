{*
 * SVM stack.
 *}
 
  type
   TStack = object
    public
      items : array of pointer;
      procedure push(p:pointer);
      function  peek:pointer;
      procedure pop;
      function  popv:pointer;
      procedure swp;
   end;

   PStack = ^TStack;

  procedure TStack.push(p:pointer);
  begin
    SetLength(Self.Items, Length(Self.Items)+1);
    Self.Items[Length(Self.Items)-1] := p;
  end;

  function  TStack.peek:pointer;
  begin
    Result := Self.Items[Length(Self.Items)-1];
  end;

  procedure TStack.pop;
  begin
    SetLength(Self.Items, Length(Self.Items)-1);
  end;

  function  TStack.popv:pointer;
  begin
    Result := Self.Items[Length(Self.Items)-1];
    SetLength(Self.Items, Length(Self.Items)-1);
  end;

  procedure TStack.swp;
  var
   p:Pointer;
  begin
    p := Self.Items[Length(Self.Items)-2];
    Self.Items[Length(Self.Items)-2] := Self.Items[Length(Self.Items)-1];
    Self.Items[Length(Self.Items)-1] := p;
  end;

  type
   TMem = variant;
   PMem = ^TMem;
  
  function new_svmval(v:variant):PMem;
  begin
    New(Result);
    Result^ := v;
  end;
