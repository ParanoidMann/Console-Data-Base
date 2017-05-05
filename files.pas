unit Files;

interface

uses crt,other,sysutils;

procedure Save_To_File(Arr:ALME;max,devmax:integer;devarr:ADEV);
procedure Load_From_File(var Arr:ALME;var max,devmax:word;var buffarr:ABUFF;var devarr:ADEV);

implementation
//
  procedure Save_To_File(Arr:ALME;max,devmax:integer;devarr:ADEV);
  var untfile:  file;
      i,n,j:    integer;
  begin
    assign(untfile,'DBSave');
    rewrite(untfile,1);
    blockwrite(untfile,max,1);
    for n:=1 to max do begin

      j:=length(arr[n].name);
      blockwrite(untfile,j,2);
      for i:=1 to j do blockwrite(untfile,arr[n].name[i],1);

      j:=length(arr[n].model);
      blockwrite(untfile,j,2);
      for i:=1 to j do blockwrite(untfile,arr[n].model[i],1);

      j:=length(arr[n].company.name);
      blockwrite(untfile,j,2);
      for i:=1 to j do blockwrite(untfile,arr[n].company.name[i],1);

      blockwrite(untfile,arr[n].cost,2);
      blockwrite(untfile,arr[n].dev_id,1);

      j:=length(arr[n].Ttype);
      blockwrite(untfile,j,2);
      for i:=1 to j do blockwrite(untfile,arr[n].Ttype[i],1);
    end;
    blockwrite(untfile,devmax,1);
    for n:=1 to devmax do begin

      j:=length(devarr[n].FIO);
      blockwrite(untfile,j,2);
      for i:=1 to j do blockwrite(untfile,devarr[n].FIO[i],1);

      blockwrite(untfile,devarr[n].year,2);

      j:=length(devarr[n].sex);
      blockwrite(untfile,j,2);
      for i:=1 to j do blockwrite(untfile,devarr[n].sex[i],1);
    end;
    close(untfile);
  end;
  //
  procedure Load_From_File(var Arr:ALME;var max,devmax:word;var buffarr:ABUFF;var devarr:ADEV);
  var untfile: file;
      i,n,j:   integer;
      f:       char;
      error:   word;
  begin
    for i:=1 to max do begin
      arr[i].name:='';
      arr[i].model:='';
      devarr[i].FIO:='';
      arr[i].company.name:='';
      arr[i].Ttype:='';
      devarr[i].sex:='';
    end;
    for i:=1 to devmax do begin
      devarr[i].FIO:='';
      devarr[i].sex:='';
    end;
    assign(untfile,'DBSave');
    reset(untfile,1);
    {$I-}
    blockread(untfile,max,1);
    error:=ioresult;
    {$I+}
    for n:=1 to max do begin
      {$I-}
      blockread(untfile,j,2);
      error:=ioresult;
      {$I+}
      for i:=1 to j do begin
        {$I-}
        blockread(untfile,f,1);
        error:=ioresult;
        {$I+}
        if (error=0) then arr[n].name:=arr[n].name + f;
      end;
      {$I-}
      blockread(untfile,j,2);
      error:=ioresult;
      {$I+}
      for i:=1 to j do begin
        {$I-}
        blockread(untfile,f,1);
        error:=ioresult;
        {$I+}
        if (error=0) then arr[n].model:=arr[n].model + f;
      end;
      {$I-}
      blockread(untfile,j,2);
      error:=ioresult;
      {$I+}
      for i:=1 to j do begin
        {$I-}
        blockread(untfile,f,1);
        error:=ioresult;
        {$I+}
        if (error=0) then arr[n].company.name:=arr[n].company.name + f;
      end;
      {$I-}
      blockread(untfile,arr[n].cost,2);
      blockread(untfile,arr[n].dev_id,1);
      blockread(untfile,j,2);
      error:=ioresult;
      {$I+}

      for i:=1 to j do begin
        {$I-}
        blockread(untfile,f,1);
        error:=ioresult;
        {$I+}

        if (error=0) then arr[n].Ttype:=arr[n].Ttype + f;
      end;
      if (error<>0) then show_error('Некорректная загрузка');
      if (arr[n].cost<>0) then buffarr[n].cost:=inttostr(arr[n].cost)
      else buffarr[n].cost:='стоимость';
    end;
    //
    {$I-}
    blockread(untfile,devmax,1);
    error:=ioresult;
    {$I+}
    for n:=1 to devmax do begin
      {$I-}
      blockread(untfile,j,2);
      error:=ioresult;
      {$I+}
      for i:=1 to j do begin
        {$I-}
        blockread(untfile,f,1);
        error:=ioresult;
        {$I+}
        if (error=0) then devarr[n].FIO:=devarr[n].FIO + f;
      end;
      {$I-}
      blockread(untfile,devarr[n].year,2);
      blockread(untfile,j,2);
      error:=ioresult;
      {$I+}
      for i:=1 to j do begin
        {$I-}
        blockread(untfile,f,1);
        error:=ioresult;
        {$I+}
        if (error=0) then devarr[n].sex:=devarr[n].sex + f;
      end;
      if (error<>0) then show_error('Некорректная загрузка');
      if (devarr[n].year<>0) then buffarr[n].year:=inttostr(devarr[n].year)
      else buffarr[n].year:=' год';
    end;
    //
    close(untfile);
  end;
//
end.
