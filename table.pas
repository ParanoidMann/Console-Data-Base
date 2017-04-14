unit Table;
interface
uses crt,files;
//
type
LME = record //LME - Land Military Equipment(Сухопутная военная техника)
  name:string; //Название техники
  model:string;//Модель техники
  dev:record //dev - developer - разработчик
    FIO:string; //FIO - Name,Surname - пол разработчика
    year:1900..2017; //Год рождения
    sex:(male,female); //Пол
  end;
  company:record //Предприятие
    name:string; //Название
    pos:string; //pos - position - место нахождения
    qudev:integer; //qudev - qyantity of developers - кол-во разработчиков
    dir:string; //dir - director - директор
  end;
  cost:string; //стоимость
  Ttype:string; //тип техники
end;
//
ALME = array[1..100] of LME;
//
procedure open_table(var arr:ALME);
//
implementation
//
var max:integer = 0;
procedure open_table(var arr:ALME);
var n:integer = 1;
    j:integer;
    mid:integer = 1;
    k:char;
    exit:boolean;
    //
    procedure add_to_arr(var arr:ALME;i:integer);
    begin
      if arr[i].name='' then arr[i].name:='название техники';
      if arr[i].model='' then arr[i].model:='модель';
      if arr[i].dev.FIO='' then arr[i].dev.FIO:='разработчик';
      if arr[i].company.name='' then arr[i].company.name:='предприятие';
      if arr[i].cost='' then arr[i].cost:='стоимость';
      if arr[i].Ttype='' then arr[i].Ttype:='тип';
    end;
    //
  procedure line(c1:char;c2:char;c3:char;c4:char);
  var k:integer;
  begin
// middle line: top line:  bottom line:
//   c1 - 195   c1 - 218    c1 - 192
//   c2 - 196   c2 - 196    c2 - 196
//   c3 - 197   c3 - 194    c3 - 193
//   c4 - 180   c4 - 191    c4 - 207
    write(c1);
    for k:=1 to 19 do write(c2);
    write(c3);
    for k:=1 to 9 do write(c2);
    write(c3);
    for k:=1 to 14 do write(c2);
    write(c3);
    for k:=1 to 14 do write(c2);
    write(c3);
    for k:=1 to 12 do write(c2);
    write(c3);
    for k:=1 to 6 do write(c2);
    writeln(c4);
  end;
  //
  procedure space_writer(xint,yint,countsp:integer);
  var i:integer;
  begin
    gotoxy(xint,yint);
    for i:=1 to countsp do write(' ');
  end;
  //
  procedure show_error(s:string);
  var errorstr:string;
      i:integer;
  begin
    gotoxy(95,5);
    textcolor(12);
    errorstr:='ОШИБКА';
    for i:=1 to 6 do begin
      write(errorstr[i]);
      delay(10);
    end;
    gotoxy(90,6);
    for i:=1 to length(s) do begin
      write(s[i]);
      delay(10);
    end;
    textcolor(15);
    delay(300);
    space_writer(95,5,6);
    space_writer(90,6,length(s));
  end;
  //
      function writepart(s:string ; i:integer ):string;
      var f:integer;
      begin
        if length(s)>i then writepart := copy(s,length(s)-i,i)
        else writepart:=s;
        if length(writepart)<i then
          for f:=length(writepart) to i-1 do writepart:=writepart+' ';
      end;
   //
  procedure back(mid:integer;var arr:ALME;n,j:integer);
  begin
    gotoxy(1,j);
    case mid of
      1:begin
        write(#179,' ');
        textcolor(10);
        write(writepart(arr[n].name,17):17);
        textcolor(15);
        writeln(' ',#179 ,' ', writepart(arr[n].model,7):7 ,' ',#179 ,' ', writepart(arr[n].dev.FIO,12):12 ,' ',#179 ,' ', writepart(arr[n].company.name,12):12 ,' ',#179 , ' ',writepart(arr[n].cost,10):10 ,' ',#179 ,' ' ,writepart(arr[n].Ttype,4):4 ,' ',#179);
      end;
      2:begin
        write(#179,' ',writepart(arr[n].name,17):17 ,' ',#179,' ');
        textcolor(10);
        write(writepart(arr[n].model,7):7 );
        textcolor(15);
        writeln(' ',#179 ,' ', writepart(arr[n].dev.FIO,12):12 ,' ',#179 ,' ', writepart(arr[n].company.name,12):12 ,' ',#179 ,' ', writepart(arr[n].cost,10):10 ,' ',#179 ,' ', writepart(arr[n].Ttype,4):4 ,' ',#179);
      end;
      3:begin
        write(#179,' ',writepart(arr[n].name,17):17 ,' ',#179,' ',writepart(arr[n].model,7):7 ,' ',#179,' ');
        textcolor(10);
        write(writepart(arr[n].dev.FIO,12):12);
        textcolor(15);
        writeln(' ',#179 ,' ', writepart(arr[n].company.name,12):12 ,' ',#179 ,' ', writepart(arr[n].cost,10):10 ,' ',#179 ,' ', writepart(arr[n].Ttype,4):4 ,' ',#179);
      end;
      4:begin
        write(#179,' ',writepart(arr[n].name,17):17 ,' ',#179,' ',writepart(arr[n].model,7):7 ,' ',#179,' ',writepart(arr[n].dev.FIO,12):12 ,' ',#179,' ');
        textcolor(10);
        write(writepart(arr[n].company.name,12):12);
        textcolor(15);
        writeln(' ',#179 ,' ', writepart(arr[n].cost,10):10 ,' ',#179 ,' ', writepart(arr[n].Ttype,4):4 ,' ',#179);
      end;
      5:begin
        write(#179,' ',writepart(arr[n].name,17):17 ,' ',#179,' ',writepart(arr[n].model,7):7 ,' ',#179,' ',writepart(arr[n].dev.FIO,12):12 ,' ',#179,' ',writepart(arr[n].company.name,12):12 ,' ',#179,' ');
        textcolor(10);
        write(writepart(arr[n].cost,10):10 );
        textcolor(15);
        writeln(' ',#179 ,' ',writepart(arr[n].Ttype,4):4 ,' ',#179);
      end;
      6:begin
        write(#179,' ',writepart(arr[n].name,17):17 ,' ',#179,' ',writepart(arr[n].model,7):7 ,' ',#179,' ',writepart(arr[n].dev.FIO,12):12 ,' ',#179,' ',writepart(arr[n].company.name,12):12 ,' ',#179,' ',writepart(arr[n].cost,10):10 ,' ',#179,' ');
        textcolor(10);
        write(writepart(arr[n].Ttype,4):4);
        textcolor(15);
        writeln(' ',#179);
      end;
    end;
  end;
   //
   procedure page_down(var j:integer;var n:integer;max:integer);
      var i,f,t:integer;
      begin
        clrscr;
        gotoxy(1,1);
        line(#218,#196,#194,#191);
        j:=0;
        f:=0;
        if n<=max then begin
          inc(f);
          if n+13<max then t:=n+13 else t:=max;
          for i:=n to t do begin
            inc(f);
            gotoxy(1,f);
            writeln(#179 ,' ', writepart(arr[i].name,17):17 ,' ',#179 ,' ', writepart(arr[i].model,7):7 ,' ',#179 ,' ', writepart(arr[i].dev.FIO,12):12 ,' ',#179 ,' ', writepart(arr[i].company.name,12):12 ,' ',#179 ,' ', writepart(arr[i].cost,10):10 ,' ',#179 ,' ', writepart(arr[i].Ttype,4):4 ,' ',#179);
            inc(f);
            gotoxy(1,f);
            line(#195,#196,#197,#180);
          end;
          gotoxy(1,j);
        end;
      end;
   //
  procedure move_down(var n:integer; var j:integer;  max:integer;arr:ALME;mid:integer);
  //
  begin
    if (n<100) then begin
      inc(n);
      if j>26 then page_down(j,n,max)
      else If (n>max) then add_to_arr(arr,n);
        j:=j+2;
        write(#179 ,' ', writepart(arr[n-1].name,17):17 ,' ',#179 ,' ', writepart(arr[n-1].model,7):7 ,' ',#179 ,' ', writepart(arr[n-1].dev.FIO,12):12 ,' ',#179 ,' ', writepart(arr[n-1].company.name,12):12 ,' ',#179 ,' ', writepart(arr[n-1].cost,10):10 ,' ',#179 ,' ', writepart(arr[n-1].Ttype,4):4 ,' ',#179);
        back(mid,arr,n,j);
        line(#195,#196,#197,#180);
        gotoxy(1,j);
    end;
  end;
//
  procedure move_up(var n:integer;var j:integer;arr:ALME;mid:integer);
    //
    procedure page_up(var j:integer;var n:integer; arr:ALME);
    var i:integer;
    begin
      clrscr;
      gotoxy(1,1);
      line(#218,#196,#194,#191);
      j:=1;
      dec(n);
      for i:=n-13 to n do begin
        inc(j);
        gotoxy(1,j);
        writeln(#179 ,' ', writepart(arr[i].name,17):17 ,' ',#179 ,' ', writepart(arr[i].model,7):7 ,' ',#179 ,' ', writepart(arr[i].dev.FIO,12):12 ,' ',#179 ,' ', writepart(arr[i].company.name,12):12 ,' ',#179 ,' ', writepart(arr[i].cost,10):10 ,' ',#179 ,' ', writepart(arr[i].Ttype,4):4 ,' ',#179);
        inc(j);
        gotoxy(1,j);
        line(#195,#196,#197,#180);
      end;
      dec(j);
      back(mid,arr,n,j);
      gotoxy(1,j);
    end;
    //
  begin
    if j<=2 then page_up(j,n,arr)
    else begin
      j:=j-2;
      write(#179 ,' ', writepart(arr[n].name,17):17 ,' ',#179 ,' ', writepart(arr[n].model,7):7 ,' ',#179 ,' ', writepart(arr[n].dev.FIO,12):12 ,' ',#179 ,' ', writepart(arr[n].company.name,12):12 ,' ',#179 ,' ', writepart(arr[n].cost,10):10 ,' ',#179 ,' ', writepart(arr[n].Ttype,4):4 ,' ',#179);
      dec(n);
      back(mid,arr,n,j);
      gotoxy(1,j);
    end;
  end;
//
  procedure entering(var arr:ALME; n:integer; mid:integer;j:integer);
  var key:char;
      //
      procedure StringEnter(var arr:ALME; n:integer; mid:integer;j:integer);
      //
        procedure cost_check(var arr:ALME; n:integer; key:char);
        begin
          if key in['1'..'9'] then arr[n].cost:=arr[n].cost+key
          else show_error('Вы ввели не число');
        end;
      //
      begin
        repeat
          back(mid,arr,n,j);
          key:=readkey;
          if (key=#8) then begin
            case mid of
              1:delete(arr[n].name,length(arr[n].name),1);
              2:delete(arr[n].model,length(arr[n].model),1);
              3:delete(arr[n].dev.FIO,length(arr[n].dev.FIO),1);
              4:delete(arr[n].company.name,length(arr[n].company.name),1);
              5:delete(arr[n].cost,length(arr[n].cost),1);
              6:delete(arr[n].Ttype,length(arr[n].Ttype),1);
            end;
            back(mid,arr,n,j);
          end
          else if not(key in [#8,#13,#27,#83,#9,#79,#81,#73,#82,#80,#71,#59,#60,
            #61,#62,#63,#64,#65,#66,#67,#68,#70,#72,#91,#93]) then begin
            case mid of
              1:arr[n].name:=arr[n].name+key;
              2:arr[n].model:=arr[n].model+key;
              3:arr[n].dev.FIO:=arr[n].dev.FIO+key;
              4:arr[n].company.name:=arr[n].company.name+key;
              5:cost_check(arr,n,key);
              6:arr[n].Ttype:=arr[n].Ttype+key;
            end;
          end;
        until (key=#13) or (key=#27);
      end;
  //
  begin
    case mid of
      1:if arr[n].name = 'название техники' then arr[n].name:='';
      2:if arr[n].model = 'модель' then arr[n].model:='';
      3:if arr[n].dev.FIO = 'разработчик' then arr[n].dev.FIO:='';
      4:if arr[n].company.name = 'предприятие' then arr[n].company.name:='';
      5:if arr[n].cost = 'стоимость' then arr[n].cost:='';
      6:if arr[n].Ttype = 'тип' then arr[n].Ttype:='';
    end;
    stringEnter(arr,n,mid,j);
    back(mid,arr,n,j);
    gotoxy(1,j);
  end;
  //
  begin
    clrscr;
    j:=2;
    if (max<>0) and (max<15) then page_down(j,n,max)
    else if (max<>0) and (max>=15) then begin
      page_down(j,n,14);
      back(mid,arr,n,j);
      gotoxy(1,j);
    end
    else begin add_to_arr(arr,1);
      line(#218,#196,#194,#191);
      back(mid,arr,n,j);
      line(#195,#196,#197,#180);
      gotoxy(1,j);
    end;
    exit:=false;
    repeat
      add_to_arr(arr,n);
      if (n>max) then max:=n;
      k:=readkey;
      case k of
        #27:exit:=true;
        #72:If (n>1) then move_up(n,j,arr,mid);
        #80:If (n<=100) then move_down(n,j,max,arr,mid);
        #75:if mid>1 then begin
          dec(mid);
          back(mid,arr,n,j);
          gotoxy(1,j);
        end;
        #13:entering(arr,n,mid,j);
        #77:if mid<6 then begin
          inc(mid);
          back(mid,arr,n,j);
          gotoxy(1,j);
        end;
      end;
    until exit=true;
 end;
end.
