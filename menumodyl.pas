unit MenuModyl;
//
interface
//
uses crt,files,table,other;
//
procedure menu(var arr:array of LME);
//
implementation
//��楤�� �맮�� ����
Procedure Menu(var arr:array of LME);
var exit_from_menu:boolean;
    //call_menu - ��楤�� ���ᮢ�� ����
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
      write('     > ������� ������� 1 <    ');
      textcolor(15);
      writeln(#186);
      writeln('                                           ', #186 ,'       ������ ⠡���� 2      ',#186);
      writeln('                                           ', #186 ,'           ��࠭���          ',#186);
      writeln('                                           ', #186 ,'           ����㧨��          ',#186);
      writeln('                                           ', #186 ,'             ���            ',#186);
      writeln('                                           ', #186 ,'                              ',#186);
      write('                                           ',#200);
      for i:=1 to 30 do write(#205);
      writeln(#188);
      for i:=1 to 10 do begin
        writeln();
      end;
      gotoxy(2,29);
      writeln('V.1.1');
    end;
//Clear- ��楤�� ������ ���� ��ப� � ��ࢮ��砫��.
  procedure Clear(c: integer);
  begin
    textcolor(15);
    textbackground(black);
    write('                                           ', #186);
    case c of
      12: Write('       ������ ⠡���� 1      ');
      13: Write('       ������ ⠡���� 2      ');
      14: Write('           ��࠭���          ');
      15: Write('           ����㧨��          ');
      16: Write('             ���            ');
    end;
    write(#186);
    gotoxy(1, c);
 end;
 //keys - �㭪�� ��४��祭�� �����蠬�
 Function keys(var arr:array of LME):boolean ;
 var k :char;
     c :integer;
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
         #72:If c=12 then c:=16 else dec(c);
         #80:If c=16 then c:=12 else inc(c);
       end;
       gotoxy(1, c);
       Write('                                           ',#186);
       textcolor(10);
       case c of
         12: Write('     > ������� ������� 1 <    ');
         13: Write('     > ������� ������� 2 <    ');
         14: Write('         > ��������� <        ');
         15: Write('         > ��������� <        ');
         16: Write('           > ����� <          ');
       end;
       textcolor(15);
       write(#186);
     end;
    if k = #13 then keys:=true
    else if k = #27 then begin
      keys:=true;
      c:=16;
    end;
   until keys=true;
   case c of
     12:begin
         Loading;
         Open_table(arr);
     end;
     13:begin
         Loading;
         Open_second_table(arr);
     end;
     {14:
     15:}
     16:exit_from_menu:=true;
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
