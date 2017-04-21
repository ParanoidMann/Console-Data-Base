unit Table;
interface
uses crt,files,other;
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
procedure open_table        (var arr:ALME);
procedure open_second_table (var arr:ALME);
//
implementation
//
var max  :integer = 0;
    smax :integer = 0;
procedure open_table(var arr:ALME);
var n    :integer = 1;
    j    :integer;
    mid  :integer = 1;
    k    :char;
    exit :boolean;
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
   procedure page_down(var j:integer;var n:integer;max,mid:integer);
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
              writeln(#179 ,' ', writepart(arr[i].name,17):17 ,' ',#179 ,' ', writepart(arr[i].model,7):7 ,' ',#179 ,' ', writepart(arr[i].dev.FIO,12):12 ,' ',#179 ,' ', writepart(arr[i].company.name,12):12 ,' ',#179 ,' ', writepart(arr[i].cost,10):10 ,' ',#179 ,' ', writepart(arr[i].Ttype,4):4 ,' ',#179);
              inc(f);
              gotoxy(1,f);
              line(#195,#196,#197,#180,1);
            end;
            gotoxy(1,f);
            line(#192,#196,#193,#217,1);
            back(mid,arr,n,j);
            gotoxy(1,j);
          end;
        end;
//
  procedure move_down(var n:integer; var j:integer;  max:integer;arr:ALME;mid:integer);
  begin
    if (n<100) then begin
      inc(n);
      if (j>26) and (n>max) then begin
        clrscr;
        j:=2;
        line(#218,#196,#194,#191,1);
        add_to_arr(arr,n);
        back(mid,arr,n,j);
        gotoxy(1,3);
        line(#192,#196,#193,#217,1);
        gotoxy(1,j);
      end
      else if (j>26) then page_down(j,n,max,mid)
      else begin
        add_to_arr(arr,n);
        j:=j+2;
        write(#179 ,' ', writepart(arr[n-1].name,17):17 ,' ',#179 ,' ', writepart(arr[n-1].model,7):7 ,' ',#179 ,' ', writepart(arr[n-1].dev.FIO,12):12 ,' ',#179 ,' ', writepart(arr[n-1].company.name,12):12 ,' ',#179 ,' ', writepart(arr[n-1].cost,10):10 ,' ',#179 ,' ', writepart(arr[n-1].Ttype,4):4 ,' ',#179);
        gotoxy(1,j-1);
        line(#195,#196,#197,#180,1);
        back(mid,arr,n,j);
        line(#192,#196,#193,#217,1);
        gotoxy(1,j);
      end;
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
      line(#218,#196,#194,#191,1);
      j:=1;
      dec(n);
      for i:=n-13 to n do begin
        inc(j);
        gotoxy(1,j);
        writeln(#179 ,' ', writepart(arr[i].name,17):17 ,' ',#179 ,' ', writepart(arr[i].model,7):7 ,' ',#179 ,' ', writepart(arr[i].dev.FIO,12):12 ,' ',#179 ,' ', writepart(arr[i].company.name,12):12 ,' ',#179 ,' ', writepart(arr[i].cost,10):10 ,' ',#179 ,' ', writepart(arr[i].Ttype,4):4 ,' ',#179);
        inc(j);
        gotoxy(1,j);
        line(#195,#196,#197,#180,1);
      end;
      gotoxy(1,j);
      line(#192,#196,#193,#217,1);
      dec(j);
      back(mid,arr,n,j);
      gotoxy(1,j);
    end;
//
  begin
    if (j<=2) and (n>14) then page_up(j,n,arr)
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
            #61,#62,#63,#64,#65,#66,#67,#68,#70,#72,#91,#93,#77,#75]) then begin
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
    if (max<>0) and (max<15) then page_down(j,n,max,mid)
    else if (max<>0) and (max>=15) then begin
      page_down(j,n,14,mid);
      back(mid,arr,n,j);
      gotoxy(1,j);
    end
    else begin add_to_arr(arr,1);
      line(#218,#196,#194,#191,1);
      back(mid,arr,n,j);
      line(#192,#196,#193,#217,1);
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
        #75:If mid>1 then begin
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
//
procedure open_second_table(var arr:ALME);
  var n    :integer = 1;
      j    :integer;
      mid  :integer = 1;
      k    :char;
      exit :boolean;
//
  procedure add_dev(var arr:ALME;i:integer);
    begin
      if arr[i].dev.FIO='' then arr[i].dev.FIO:='разработчик';
      if ((arr[i].dev.year < 1900) or (arr[i].dev.year > 2017)) then arr[i].dev.year:=2017;
    end;
//
  procedure return(mid:integer;var arr:ALME;n,j:integer);
    begin
      gotoxy(1,j);
      space_writer(1,1,40);
      case mid of
        1:begin
          write(#179,' ');
          textcolor(10);
          write(writepart(arr[n].dev.FIO,12):12);
          textcolor(15);
          writeln(' ',#179,' ',arr[n].dev.year:5,' ',#179,' ',arr[n].dev.sex:5,' ',#179);
        end;
        2:begin
          write(#179,' ',writepart(arr[n].dev.FIO,12):12 ,' '#179 ,' ');
          textcolor(10);
          write(arr[n].dev.year:5);
          textcolor(15);
          writeln(' ',#179,' ',arr[n].dev.sex:5,' ',#179);
        end;
        3:begin
          write(#179,' ',writepart(arr[n].dev.FIO,12):12 ,' '#179 ,' ', arr[n].dev.year:5,' ',#179,' ');
          textcolor(10);
          write(arr[n].dev.sex:5);
          textcolor(15);
          writeln(' ',#179);
        end;
      end;
    end;
//
  procedure next_page(var j:integer;var n:integer;smax,mid:integer);
        var i,f,t:integer;
        begin
          clrscr;
          gotoxy(1,1);
          line(#218,#196,#194,#191,0);
            j:=2;
            f:=0;
            if n<=smax then begin
              inc(f);
              if n+13<smax then t:=n+13 else t:=smax;
              for i:=n to t do begin
                inc(f);
                gotoxy(1,f);
                space_writer(1,1,40);
                writeln(#179,' ',writepart(arr[i].dev.FIO,12):12 ,' '#179 ,' ', arr[i].dev.year:5,' ',#179,' ',arr[i].dev.sex:5,' ',#179);
                inc(f);
                gotoxy(1,f);
                line(#195,#196,#197,#180,0);
              end;
              gotoxy(1,f);
              line(#192,#196,#193,#217,0);
              return(mid,arr,n,j);
              gotoxy(1,j);
            end;
          end;
//
  procedure down(var n:integer; var j:integer;smax:integer;arr:ALME;mid:integer);
  //
    begin
      if (n<100) then begin
        inc(n);
        if (j>26) and (n>smax) then begin
          clrscr;
          j:=2;
          line(#218,#196,#194,#191,0);
          add_dev(arr,n);
          return(mid,arr,n,j);
          gotoxy(1,3);
          line(#192,#196,#193,#217,0);
          gotoxy(1,j);
        end
        else if (j>26) then next_page(j,n,smax,mid)
        else begin
          add_dev(arr,n);
          j:=j+2;
          space_writer(1,1,40);
          write(#179,' ',writepart(arr[n-1].dev.FIO,12):12 ,' '#179 ,' ', arr[n-1].dev.year:5,' ',#179,' ',arr[n-1].dev.sex:5,' ',#179);
          gotoxy(1,j-1);
          line(#195,#196,#197,#180,0);
          return(mid,arr,n,j);
          line(#192,#196,#193,#217,0);
          gotoxy(1,j);
        end;
      end;
    end;
//
  procedure up(var n:integer;var j:integer;arr:ALME;mid:integer);
  //
      procedure prev_page(var j:integer;var n:integer; arr:ALME);
      var i:integer;
      begin
        clrscr;
        gotoxy(1,1);
        line(#218,#196,#194,#191,0);
        j:=1;
        dec(n);
        for i:=n-13 to n do begin
          inc(j);
          gotoxy(1,j);
          space_writer(1,1,40);
          writeln(#179,' ',writepart(arr[i].dev.FIO,12):12 ,' '#179 ,' ', arr[i].dev.year:5,' ',#179,' ',arr[i].dev.sex:5,' ',#179);
          inc(j);
          gotoxy(1,j);
          line(#195,#196,#197,#180,0);
        end;
        gotoxy(1,j);
        line(#192,#196,#193,#217,0);
        dec(j);
        return(mid,arr,n,j);
        gotoxy(1,j);
      end;
  //
    begin
      if (j<=2) and (n>14) then prev_page(j,n,arr)
      else begin
        j:=j-2;
        space_writer(1,1,40);
        write(#179,' ',writepart(arr[n].dev.FIO,12):12 ,' '#179 ,' ', arr[n].dev.year:5,' ',#179,' ',arr[n].dev.sex:5,' ',#179);
        dec(n);
        return(mid,arr,n,j);
        gotoxy(1,j);
      end;
    end;
  //
  begin
    clrscr;
    j:=2;
    if (smax<>0) and (smax<15) then next_page(j,n,smax,mid)
    else if (smax<>0) and (smax>=15) then begin
      next_page(j,n,14,mid);
      return(mid,arr,n,j);
      gotoxy(1,j);
    end
    else begin add_dev(arr,1);
      line(#218,#196,#194,#191,0);
      return(mid,arr,n,j);
      line(#192,#196,#193,#217,0);
      gotoxy(1,j);
    end;
    exit:=false;
    repeat
      add_dev(arr,n);
      if (n>smax) then smax:=n;
      k:=readkey;
      case k of
        #27:exit:=true;
        #72:If (n>1) then up(n,j,arr,mid);
        #80:If (n<=100) then down(n,j,smax,arr,mid);
        #75:If mid>1 then begin
          dec(mid);
          return(mid,arr,n,j);
          gotoxy(1,j);
        end;
        //#13:entering(arr,n,mid,j);
        #77:if mid<3 then begin
          inc(mid);
          return(mid,arr,n,j);
          gotoxy(1,j);
        end;
      end;
    until exit=true;
 end;
//
end.
