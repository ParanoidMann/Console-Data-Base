unit MenuModyl;
//
interface
//
uses crt,files,table;
//

//
procedure menu(var arr:array of LME);
//
implementation
//Процедура вызова меню
Procedure Menu(var arr:array of LME);
var exit_from_menu:boolean;
    //call_menu - процедура отрисовки меню
    procedure call_menu;
    var i:integer;
    begin
      clrscr;
      textcolor(15);
      gotoxy(1,10);
      write('                                           ',#201);
      for i:=1 to 30 do write(#205);
      writeln(#187);
      writeln('                                           ', #186 ,'                              ',#186);
      write('                                           ', #186 );
      textcolor(10);
      write('      > ОТКРЫТЬ ТАБЛИЦУ <     ');
      textcolor(15);
      writeln(#186);
      writeln('                                           ', #186 ,'           сохранить          ',#186);
      writeln('                                           ', #186 ,'           загрузить          ',#186);
      writeln('                                           ', #186 ,'             выйти            ',#186);
      writeln('                                           ', #186 ,'                              ',#186);
      write('                                           ',#200);
      for i:=1 to 30 do write(#205);
      writeln(#188);
      for i:=1 to 10 do begin
        writeln();
      end;
//      gotoxy(2,29);
//      writeln('V3.1');
    end;
//Clear- процедура возврата шрифта строки в первоначальный.
  procedure Clear(c: integer);
  begin
    textcolor(15);
    textbackground(black);
    write('                                           ', #186);
    case c of
      12: Write('        открыть таблицу       ');
      13: Write('           сохранить          ');
      14: Write('           загрузить          ');
      15: Write('             выйти            ');
    end;
    write(#186);
    gotoxy(1, c);
 end;
 //Loading - процедура псевдозагрузки.
 procedure Loading;
 var i,j:integer;
 begin
   Clrscr;
   randomize;
   i:=random(5);
   Write('Загрузка');
   for j:=1 to i do begin
       write('.');
       delay(300);
   end;
 end;
 //keys - Функция переключения клавишами
 Function keys(var arr:array of LME):boolean ;
 var k:char;
     c:integer;
 begin
   c:=12;
   keys:=false;
   repeat
     k:=readkey;
     gotoxy(1, c);
     if k = #0 then begin
       k:=readkey;
       Clear(c);
       case k of
         #72:If c=12 then c:=15 else dec(c);
         #80:If c=15 then c:=12 else inc(c);
       end;
       gotoxy(1, c);
       Write('                                           ',#186);
       textcolor(10);
       case c of
         12: Write('      > ОТКРЫТЬ ТАБЛИЦУ <     ');
         13: Write('         > СОХРАНИТЬ <        ');
         14: Write('         > ЗАГРУЗИТЬ <        ');
         15: Write('           > ВЫЙТИ <          ');
       end;
       textcolor(15);
       write(#186);
     end;
    if k= #13 then keys:=true
    else if k= #27 then begin
      keys:=true;
      c:=16;
    end;
   until keys=true;
   case c of
     12:begin
       //  Loading;
         Open_table(arr);
     end;
     {13:
     14:}
     15:exit_from_menu:=true;
   else exit_from_menu:=true;
   end
 end;
//
begin
  exit_from_menu:=false;
  repeat
    cursoroff;
    clrscr;
    textcolor(10);
    textbackground(black);
    call_menu;
    keys(arr);
  until exit_from_menu=true;
end;
end.
