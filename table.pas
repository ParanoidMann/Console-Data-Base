unit Table;
interface
uses crt,files,other;
//
procedure open_table        (var arr:ALME;var max:word;var buffarr:ABUFF;var devarr:ADEV;var DevMax:word);
procedure open_second_table (var devmax:word; var buffarr:ABUFF; var devarr:ADEV);
//
implementation
//
procedure open_table(var arr:ALME; var max:word; var buffarr:ABUFF ;var devarr:ADEV; var DevMax:word);
var n:       integer = 1;
    j:       integer;
    mid:     integer = 1;
    k:       char;
    exit:    boolean;
    pagemin: integer = 1;
  //
  procedure back(mid:integer; var arr:ALME; var devarr:ADEV; n,j:integer);
  begin
    gotoxy(1,j);
    case mid of
      1:begin
        write(#179,' ');
        textcolor(10);
        write(writepart(arr[n].name,17):17);
        textcolor(15);
        writeln(' ',#179 ,' ', writepart(arr[n].model,7):7 ,' ',#179 ,' ', writepart(devarr[arr[n].dev_id].FIO,12):12 ,' ',#179 ,' ', writepart(arr[n].company.name,12):12 ,' ',#179 , ' ',writepart(buffarr[n].cost,10):10 ,' ',#179 ,' ' ,writepart(arr[n].Ttype,5):5 ,' ',#179);
      end;
      2:begin
        write(#179,' ',writepart(arr[n].name,17):17 ,' ',#179,' ');
        textcolor(10);
        write(writepart(arr[n].model,7):7 );
        textcolor(15);
        writeln(' ',#179 ,' ', writepart(devarr[arr[n].dev_id].FIO,12):12 ,' ',#179 ,' ', writepart(arr[n].company.name,12):12 ,' ',#179 ,' ', writepart(buffarr[n].cost,10):10 ,' ',#179 ,' ', writepart(arr[n].Ttype,5):5 ,' ',#179);
      end;
      3:begin
        write(#179,' ',writepart(arr[n].name,17):17 ,' ',#179,' ',writepart(arr[n].model,7):7 ,' ',#179,' ');
        textcolor(10);
        write(writepart(devarr[arr[n].dev_id].FIO,12):12);
        textcolor(15);
        writeln(' ',#179 ,' ', writepart(arr[n].company.name,12):12 ,' ',#179 ,' ', writepart(buffarr[n].cost,10):10 ,' ',#179 ,' ', writepart(arr[n].Ttype,5):5 ,' ',#179);
      end;
      4:begin
        write(#179,' ',writepart(arr[n].name,17):17 ,' ',#179,' ',writepart(arr[n].model,7):7 ,' ',#179,' ',writepart(devarr[arr[n].dev_id].FIO,12):12 ,' ',#179,' ');
        textcolor(10);
        write(writepart(arr[n].company.name,12):12);
        textcolor(15);
        writeln(' ',#179 ,' ', writepart(buffarr[n].cost,10):10 ,' ',#179 ,' ', writepart(arr[n].Ttype,5):5 ,' ',#179);
      end;
      5:begin
        write(#179,' ',writepart(arr[n].name,17):17 ,' ',#179,' ',writepart(arr[n].model,7):7 ,' ',#179,' ',writepart(devarr[arr[n].dev_id].FIO,12):12 ,' ',#179,' ',writepart(arr[n].company.name,12):12 ,' ',#179,' ');
        textcolor(10);
        write(writepart(buffarr[n].cost,10):10 );
        textcolor(15);
        writeln(' ',#179 ,' ',writepart(arr[n].Ttype,5):5 ,' ',#179);
      end;
      6:begin
        write(#179,' ',writepart(arr[n].name,17):17 ,' ',#179,' ',writepart(arr[n].model,7):7 ,' ',#179,' ',writepart(devarr[arr[n].dev_id].FIO,12):12 ,' ',#179,' ',writepart(arr[n].company.name,12):12 ,' ',#179,' ',writepart(buffarr[n].cost,10):10 ,' ',#179,' ');
        textcolor(10);
        write(writepart(arr[n].Ttype,5):5);
        textcolor(15);
        writeln(' ',#179);
      end;
    end;
  end;
//
  procedure page_down(var j,n:integer; max,mid:integer);
  var i,f,t:integer;
  begin
    clrscr;
    gotoxy(1,1);
    line(#218,#196,#194,#191,1);
    j:=2;
    f:=0;
    if n<=max then begin
      inc(f);
      if n+13<max then t:=n+13 else t:=max;
      for i:=n to t do begin
        inc(f);
        gotoxy(1,f);
        writeln(#179 ,' ', writepart(arr[i].name,17):17 ,' ',#179 ,' ', writepart(arr[i].model,7):7 ,' ',#179 ,' ', writepart(devarr[arr[i].dev_id].FIO,12):12 ,' ',#179 ,' ', writepart(arr[i].company.name,12):12 ,' ',#179 ,' ', writepart(buffarr[i].cost,10):10 ,' ',#179 ,' ', writepart(arr[i].Ttype,5):5 ,' ',#179);
        inc(f);
        gotoxy(1,f);
        line(#195,#196,#197,#180,1);
      end;
      gotoxy(1,f);
      line(#192,#196,#193,#217,1);
      back(mid,arr,devarr,n,j);
      gotoxy(1,j);
    end;
  end;
//
  procedure move_down(var n,j,pagemax:integer; max:integer; arr:ALME; mid:integer);
  begin
    if (n<100) then begin
      inc(n);
      if (j>26) and (n>max) then begin
        clrscr;
        pagemax:=n;
        j:=2;
        line(#218,#196,#194,#191,1);
        add_to_arr(arr,devarr,n,buffarr);
        back(mid,arr,devarr,n,j);
        gotoxy(1,3);
        line(#192,#196,#193,#217,1);
        gotoxy(1,j);
      end
      else if (j>26) then begin
        pagemax:=n;
        page_down(j,n,max,mid);
      end
      else begin
        add_to_arr(arr,devarr,n,buffarr);
        j:=j+2;
        write(#179 ,' ', writepart(arr[n-1].name,17):17 ,' ',#179 ,' ', writepart(arr[n-1].model,7):7 ,' ',#179 ,' ', writepart(devarr[arr[n-1].dev_id].FIO,12):12 ,' ',#179 ,' ', writepart(arr[n-1].company.name,12):12 ,' ',#179 ,' ', writepart(buffarr[n-1].cost,10):10 ,' ',#179 ,' ', writepart(arr[n-1].Ttype,5):5 ,' ',#179);
        gotoxy(1,j-1);
        line(#195,#196,#197,#180,1);
        back(mid,arr,devarr,n,j);
        if n>=max then line(#192,#196,#193,#217,1)
        else line(#195,#196,#197,#180,1);
        gotoxy(1,j);
      end;
    end;
  end;
//
  procedure page_up(var j,n,pagemax:integer; arr:ALME);
  var i:integer;
  begin
    clrscr;
    pagemax:=pagemax-14;
    gotoxy(1,1);
    line(#218,#196,#194,#191,1);
    j:=1;
    dec(n);
    for i:=n-13 to n do begin
      inc(j);
      gotoxy(1,j);
      writeln(#179 ,' ', writepart(arr[i].name,17):17 ,' ',#179 ,' ', writepart(arr[i].model,7):7 ,' ',#179 ,' ', writepart(devarr[arr[i].dev_id].FIO,12):12 ,' ',#179 ,' ', writepart(arr[i].company.name,12):12 ,' ',#179 ,' ', writepart(buffarr[i].cost,10):10 ,' ',#179 ,' ', writepart(arr[i].Ttype,5):5 ,' ',#179);
      inc(j);
      gotoxy(1,j);
      line(#195,#196,#197,#180,1);
    end;
    gotoxy(1,j);
    line(#192,#196,#193,#217,1);
    dec(j);
    back(mid,arr,devarr,n,j);
    gotoxy(1,j);
  end;
//
  procedure move_up(var n,j:integer;arr:ALME;mid:integer);
  begin
    if (j<=2) and (n>14) then page_up(j,n,pagemin,arr)
    else begin
      j:=j-2;
      write(#179 ,' ', writepart(arr[n].name,17):17 ,' ',#179 ,' ', writepart(arr[n].model,7):7 ,' ',#179 ,' ', writepart(devarr[arr[n].dev_id].FIO,12):12 ,' ',#179 ,' ', writepart(arr[n].company.name,12):12 ,' ',#179 ,' ', writepart(buffarr[n].cost,10):10 ,' ',#179 ,' ', writepart(arr[n].Ttype,5):5 ,' ',#179);
      dec(n);
      back(mid,arr,devarr,n,j);
      gotoxy(1,j);
    end;
  end;
//
  procedure entering(var arr:ALME; n,mid,j,devmax:integer);
  var key:   char;
//
    procedure StringEnter(var arr:ALME; n,mid,j:integer);
//
      procedure cost_check(n:integer; key:char);
      begin
        if key in['0'..'9'] then buffarr[n].cost:=buffarr[n].cost+key
        else show_error('Вы ввели не число');
      end;
//
    begin
      repeat
        key:=readkey;
        if mid<> 3 then begin
          if (key=#8) then begin
            case mid of
              1:delete(arr[n].name,length(arr[n].name),1);
              2:delete(arr[n].model,length(arr[n].model),1);
              4:delete(arr[n].company.name,length(arr[n].company.name),1);
              5:delete(buffarr[n].cost,length(buffarr[n].cost),1);
              6:delete(arr[n].Ttype,length(arr[n].Ttype),1);
            end;
          end
          else if not(key in [#8,#13,#27,#83,#9,#79,#81,#73,#82,#80,#71,#59,#60,
          #61,#62,#63,#64,#65,#66,#67,#68,#70,#72,#91,#93,#77,#75]) then begin
            case mid of
              1:arr[n].name:=arr[n].name+key;
              2:arr[n].model:=arr[n].model+key;
              4:arr[n].company.name:=arr[n].company.name+key;
              5:cost_check(n,key);
              6:arr[n].Ttype:=arr[n].Ttype+key;
            end;
          end;
        end
        else if (mid=3) then begin
          case key of
            #73:if arr[n].dev_id<devmax then inc(arr[n].dev_id);
            #81:if arr[n].dev_id>1 then dec(arr[n].dev_id);
          end;
        end;
        back(mid,arr,devarr,n,j);
      until (key=#13) or (key=#27);
      val(buffarr[n].cost,arr[n].cost);
      case mid of
        1:if (arr[n].name<>'') then arr[n].name[1]:=topupcase(arr[n].name[1]);
        2:if (arr[n].model<>'') then arr[n].model[1]:=topupcase(arr[n].model[1]);
        4:if (arr[n].company.name<>'') then arr[n].company.name[1]:=topupcase(arr[n].company.name[1]);
        6:if (arr[n].Ttype<>'') then arr[n].Ttype[1]:=topupcase(arr[n].Ttype[1]);
      end;
    end;
//
  begin
    case mid of
      1:if arr[n].name = LowerCase('Название техники') then arr[n].name:='';
      2:if arr[n].model = LowerCase('Модель') then arr[n].model:='';
      3:if devarr[n].FIO = LowerCase('Разработчик') then arr[n].dev_id:=1;
      4:if arr[n].company.name = LowerCase('Предприятие') then arr[n].company.name:='';
      5:if buffarr[n].cost = LowerCase('Стоимость') then buffarr[n].cost:='';
      6:if arr[n].Ttype = LowerCase(' Тип') then arr[n].Ttype:='';
    end;
    stringEnter(arr,n,mid,j);
    back(mid,arr,devarr,n,j);
    gotoxy(1,j);
  end;
//
  procedure Deleteline(var arr:ALME; var max:word; var n,j:integer);
  var i,f,h:integer;
  begin
    if n>=max then begin
      arr[n].name:='';
      arr[n].model:='';
      devarr[arr[n].dev_id].FIO:='';
      arr[n].company.name:='';
      buffarr[n].cost:='';
      arr[n].cost:=0;
      arr[n].Ttype:='';
      buffarr[n].year:='';
      devarr[n].year:=0;
      devarr[n].sex:='';
    end
    else for i:=n to max do begin
      arr[i].name:=arr[i+1].name;
      arr[i].model:=arr[i+1].model;
      devarr[arr[i].dev_id].FIO:=devarr[arr[i+1].dev_id].FIO;
      arr[i].company.name:=arr[i+1].company.name;
      buffarr[i].cost:=buffarr[i+1].cost;
      arr[i].cost:=arr[i+1].cost;
      arr[i].Ttype:=arr[i+1].Ttype;
      buffarr[i].year:=buffarr[i+1].year;
      devarr[i].year:=devarr[i+1].year;
      devarr[i].sex:=devarr[i+1].sex;
    end;
    if (n=1) then begin
      dec(max);
      page_down(j,n,max,mid);
    end
    else if (pagemin=max) then begin
      dec(max);
      page_up(j,n,pagemin,arr);
    end
    else if (n = pagemin) then begin
      dec(max);
      page_down(j,n,max,mid);
    end
    else begin
      j:=j-2;
      f:=j;
      dec(max);
      dec(n);
      if n+13<max then h:=n+13 else h:=max;
      page_down(f,pagemin,h,mid);
      gotoxy(1,2);
      write(#179 ,' ',writepart(arr[pagemin].name,17):17 ,' ',#179 ,' ', writepart(arr[pagemin].model,7):7 ,' ',#179 ,' ', writepart(devarr[arr[pagemin].dev_id].FIO,12):12 ,' ',#179 ,' ', writepart(arr[pagemin].company.name,12):12 ,' ',#179 ,' ', writepart(buffarr[pagemin].cost,10):10 ,' ',#179 ,' ', writepart(arr[pagemin].Ttype,5):5 ,' ',#179);
      back(mid,arr,devarr,n,j);
    end;
  end;
//
  begin
    clrscr;
    j:=2;
    if (max<>0) and (max<15) then page_down(j,n,max,mid)
    else if (max<>0) and (max>=15) then begin
      page_down(j,n,14,mid);
      back(mid,arr,devarr,n,j);
      gotoxy(1,j);
    end
    else begin
      add_to_arr(arr,devarr,1,buffarr);
      line(#218,#196,#194,#191,1);
      back(mid,arr,devarr,n,j);
      line(#192,#196,#193,#217,1);
      gotoxy(1,j);
    end;
    exit:=false;
    repeat
      if (n>max) then max:=n;
      add_to_arr(arr,devarr,n,buffarr);
      gotoxy(1,j);
      k:=readkey;
      case k of
        #27:exit:=true;
        #72:If (n>1) then move_up(n,j,arr,mid);
        #80:If (n<=100) then move_down(n,j,pagemin,max,arr,mid);
        #75:If mid>1 then begin
          dec(mid);
          back(mid,arr,devarr,n,j);
          gotoxy(1,j);
        end;
        #13:entering(arr,n,mid,j,devmax);
        #8:if max>1 then deleteline(arr,max,n,j) else show_error('У вас всего один элемент');
        #77:if mid<6 then begin
          inc(mid);
          back(mid,arr,devarr,n,j);
          gotoxy(1,j);
        end;
      end;
    until exit=true;
  end;
//
procedure open_second_table(var devmax:word; var buffarr:ABUFF; var devarr:ADEV);
var n:       integer = 1;
    j:       integer;
    mid:     integer = 1;
    k:       char;
    exit:    boolean;
    pagemin: integer = 1;
//
  procedure return(mid:integer; devarr:ADEV; n,j:integer);
  begin
    gotoxy(1,j);
    space_writer(1,1,40);
    case mid of
      1:begin
        write(#179,' ');
        textcolor(10);
        write(writepart(devarr[n].FIO,12):12);
        textcolor(15);
        writeln(' ',#179,' ',writepart(buffarr[n].year,5):5,' ',#179,' ',writepart(devarr[n].sex,8):8,' ',#179);
      end;
      2:begin
        write(#179,' ',writepart(devarr[n].FIO,12):12 ,' '#179 ,' ');
        textcolor(10);
        write(writepart(buffarr[n].year,5):5);
        textcolor(15);
        writeln(' ',#179,' ',writepart(devarr[n].sex,8):8,' ',#179);
      end;
      3:begin
        write(#179,' ',writepart(devarr[n].FIO,12):12 ,' '#179 ,' ', writepart(buffarr[n].year,5):5,' ',#179,' ');
        textcolor(10);
        write(writepart(devarr[n].sex,8):8);
        textcolor(15);
        writeln(' ',#179);
      end;
    end;
  end;
//
  procedure next_page(var j,n:integer; devmax,mid:integer);
  var i,f,t:integer;
  begin
    clrscr;
    gotoxy(1,1);
    line(#218,#196,#194,#191,0);
    j:=2;
    f:=0;
    if n<=devmax then begin
      inc(f);
      if n+13<devmax then t:=n+13 else t:=devmax;
      for i:=n to t do begin
        inc(f);
        gotoxy(1,f);
        space_writer(1,1,40);
        writeln(#179,' ',writepart(devarr[i].FIO,12):12 ,' '#179 ,' ', writepart(buffarr[i].year,5):5,' ',#179,' ',writepart(devarr[i].sex,8):8,' ',#179);
        inc(f);
        gotoxy(1,f);
        line(#195,#196,#197,#180,0);
      end;
      gotoxy(1,f);
      line(#192,#196,#193,#217,0);
      return(mid,devarr,n,j);
      gotoxy(1,j);
    end;
  end;
//
 procedure down(var n,j,pagemax:integer;devarr:ADEV; mid:integer; var devmax:word);
  begin
    if (n<100) then begin
      inc(n);
      if (j>26) and (n>devmax) then begin
        clrscr;
        pagemax:=n;
        j:=2;
        line(#218,#196,#194,#191,0);
        add_dev(devarr,buffarr,n);
        return(mid,devarr,n,j);
        gotoxy(1,3);
        line(#192,#196,#193,#217,0);
        gotoxy(1,j);
      end
      else if (j>26) then begin
        pagemax:=n;
        next_page(j,n,devmax,mid);
      end
      else begin
        add_dev(devarr,buffarr,n);
        j:=j+2;
        space_writer(1,1,40);
        write(#179,' ',writepart(devarr[n-1].FIO,12):12 ,' '#179 ,' ', writepart(buffarr[n-1].year,5):5,' ',#179,' ',writepart(devarr[n-1].sex,8):8,' ',#179);
        gotoxy(1,j-1);
        line(#195,#196,#197,#180,0);
        return(mid,devarr,n,j);
        if n>=devmax then line(#192,#196,#193,#217,0)
        else line(#195,#196,#197,#180,0);
        gotoxy(1,j);
      end;
    end;
  end;
  //
  procedure prev_page(var j,n,pagemax:integer; devarr:ADEV);
  var i:integer;
  begin
    clrscr;
    pagemax:=pagemax-14;
    gotoxy(1,1);
    line(#218,#196,#194,#191,0);
    j:=1;
    dec(n);
    for i:=n-13 to n do begin
      inc(j);
      gotoxy(1,j);
      space_writer(1,1,40);
      writeln(#179,' ',writepart(devarr[i].FIO,12):12 ,' '#179 ,' ', writepart(buffarr[i].year,5):5,' ',#179,' ',writepart(devarr[i].sex,8):8,' ',#179);
      inc(j);
      gotoxy(1,j);
      line(#195,#196,#197,#180,0);
    end;
    gotoxy(1,j);
    line(#192,#196,#193,#217,0);
    dec(j);
    return(mid,devarr,n,j);
    gotoxy(1,j);
  end;
    //
  procedure up(var n,j:integer; devarr:ADEV; mid:integer);
  begin
    if (j<=2) and (n>14) then prev_page(j,n,pagemin,devarr)
    else begin
      j:=j-2;
      space_writer(1,1,40);
      write(#179,' ',writepart(devarr[n].FIO,12):12 ,' '#179 ,' ', writepart(buffarr[n].year,5):5,' ',#179,' ',writepart(devarr[n].sex,8):8,' ',#179);
      dec(n);
      return(mid,devarr,n,j);
      gotoxy(1,j);
    end;
  end;
  //
  procedure enter(var devarr:ADEV; n,mid,j:integer);
  var key:char;
//
    procedure StrEnter(var devarr:AdEV; n,mid,j:integer);
//
      procedure year_check(n:integer);
      var i:integer;
      begin
        val(buffarr[n].year,i);
        if buffarr[n].year='' then buffarr[n].year:=' Год'
        else if i>2017 then begin
          buffarr[n].year:=' Год';
          show_error('Год должен быть меньше 2017');
        end
        else if i<1900 then begin
          buffarr[n].year:=' Год';
          show_error('Год должен быть больше 1900');
        end;
      end;
//
      procedure sex_check(var devarr:ADEV; n:integer);
      begin
        if devarr[n].sex='' then devarr[n].sex:='  Пол'
        else if not(((toplowercase(devarr[n].sex))='мужской') or((toplowercase(devarr[n].sex))='женский')) then begin
          devarr[n].sex:='  Пол';
          show_error('Пол должен быть мужской или женский');
        end
        else begin
          devarr[n].sex:=toplowercase(devarr[n].sex);
          devarr[n].sex[1]:=topupcase(devarr[n].sex[1]);
        end;
      end;
//
    begin
      repeat
        return(mid,devarr,n,j);
        key:=readkey;
        if (key=#8) then begin
          case mid of
            1:delete(devarr[n].FIO,length(devarr[n].FIO),1);
            2:delete(buffarr[n].year,length(buffarr[n].year),1);
            3:delete(devarr[n].sex,length(devarr[n].sex),1);
          end;
          return(mid,devarr,n,j);
        end
        else if not(key in [#8,#13,#27,#83,#9,#79,#81,#73,#82,#80,#71,#59,#60,
          #61,#62,#63,#64,#65,#66,#67,#68,#70,#72,#91,#93,#77,#75]) then begin
          case mid of
            1:devarr[n].FIO:=devarr[n].FIO+key;
            2: if key in['0'..'9'] then buffarr[n].year:=buffarr[n].year+key
              else show_error('Вы ввели не число');
            3:devarr[n].sex:=devarr[n].sex+key;
          end;
        end;
        if ((key=#13) or (key=#27)) and (mid=2) then year_check(n);
        if ((key=#13) or (key=#27)) and (mid=3) then sex_check(devarr,n);
      until (key=#13) or (key=#27);
      val(buffarr[n].year,devarr[n].year);
      case mid of
        1:if (devarr[n].FIO<>'') then devarr[n].FIO[1]:=topupcase(devarr[n].FIO[1]);
        3:if (devarr[n].sex<>'') then devarr[n].sex[1]:=topupcase(devarr[n].sex[1]);
      end;
    end;
//
  begin
    case mid of
      1:if devarr[n].FIO = lowercase('Разработчик') then devarr[n].FIO:='';
      2:if buffarr[n].year = lowercase(' Год') then buffarr[n].year:='';
      3:if devarr[n].sex = lowercase('  Пол') then devarr[n].sex:='';
    end;
    strEnter(devarr,n,mid,j);
    return(mid,devarr,n,j);
    gotoxy(1,j);
  end;
//
  procedure Dell_line(var devarr:ADEV; var devmax:word; var n,j:integer);
    var i,f,h:integer;
    begin
      if n>=devmax then begin
      devarr[n].FIO:='';
      devarr[n].year:=0;
      buffarr[n].year:='';
      devarr[n].sex:='';
    end
    else for i:=n to devmax do begin
      devarr[i].FIO:=devarr[i+1].FIO;
      devarr[i].year:=devarr[i+1].year;
      buffarr[i].year:=buffarr[i+1].year;
      devarr[i].sex:=devarr[i+1].sex;
    end;
    if (n=1) then begin
      dec(devmax);
      next_page(j,n,devmax,mid);
    end
    else if (pagemin=devmax) then begin
      dec(devmax);
      prev_page(j,n,pagemin,devarr);
    end
    else if (n = pagemin) then begin
      dec(devmax);
      next_page(j,n,devmax,mid);
    end
    else begin
      j:=j-2;
      f:=j;
      dec(devmax);
      dec(n);
      if n+13<devmax then h:=n+13 else h:=devmax;
      next_page(f,pagemin,h,mid);
      gotoxy(1,2);
      space_writer(1,1,40);
      write(#179,' ',writepart(devarr[pagemin].FIO,12):12 ,' '#179 ,' ', writepart(buffarr[pagemin].year,5):5,' ',#179,' ',writepart(devarr[pagemin].sex,8):8,' ',#179);
      return(mid,devarr,n,j);
    end;
  end;
//
begin
  clrscr;
  j:=2;
  if (devmax<>0) and (devmax<15) then next_page(j,n,devmax,mid)
  else if (devmax<>0) and (devmax>=15) then begin
    next_page(j,n,14,mid);
    return(mid,devarr,n,j);
    gotoxy(1,j);
  end
  else begin
    add_dev(devarr,buffarr,1);
    line(#218,#196,#194,#191,0);
    return(mid,devarr,n,j);
    line(#192,#196,#193,#217,0);
    gotoxy(1,j);
  end;
  exit:=false;
  repeat
    add_dev(devarr,buffarr,n);
    if (n>devmax) then devmax:=n;
    gotoxy(1,j);
    k:=readkey;
    case k of
      #27:exit:=true;
      #72:If (n>1) then up(n,j,devarr,mid);
      #80:If (n<=100) then down(n,j,pagemin,devarr,mid,devmax);
      #75:If mid>1 then begin
        dec(mid);
        return(mid,devarr,n,j);
        gotoxy(1,j);
      end;
      #13:enter(devarr,n,mid,j);
      #8:if devmax>1 then dell_line(devarr,devmax,n,j) else show_error('У вас всего один элемент');
      #77:if mid<3 then begin
        inc(mid);
        return(mid,devarr,n,j);
        gotoxy(1,j);
      end;
    end;
  until exit=true;
end;
//
end.
