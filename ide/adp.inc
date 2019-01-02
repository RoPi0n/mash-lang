{*
 * SVM stack.
 *}
 
  type




  type
   TMem = variant;
   PMem = ^TMem;
  
  function new_svmval(v:variant):PMem;
  begin
    New(Result);
    Result^ := v;
  end;
