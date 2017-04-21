unit other;
interface
uses crt;
  //
  procedure   line          (c1:char;c2:char;c3:char;c4:char;long:shortint);
  procedure   space_writer  (xint,yint,countsp:integer);
  procedure   show_error    (s:string);
  function    writepart     (s:string ; i:integer ):string;
  procedure   Loading;
//
implementation
//
procedure line(c1:char;c2:char;c3:char;c4:char;long:shortint);
  var k:integer;
  begin
// middle line: top line:  bottom line:
//   c1 - 195   c1 - 218    c1 - 192
//   c2 - 196   c2 - 196    c2 - 196
//   c3 - 197   c3 - 194    c3 - 193
//   c4 - 180   c4 - 191    c4 - 207
    if long=1 then begin
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
    end
    else begin
      space_writer(1,1,40);
      write(c1);
      for k:=1 to 14 do write(c2);
      write(c3);
      for k:=1 to 7 do write(c2);
      write(c3);
      for k:=1 to 7 do write(c2);
      writeln(c4);
    end;
  end;
//
procedure space_writer(xint,yint,countsp:integer);
  var i:integer;
  begin
    if (xint<>1) and (yint<>1) then gotoxy(xint,yint);
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
   delay(500);
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
//
 end.
