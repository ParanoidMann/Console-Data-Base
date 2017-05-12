unit MenuModyl;
interface
//�ᯮ��㥬� ���㫨
uses crt,files,table,other;
//��楤�� ����
procedure menu;
//���ᠭ�� ��楤��
implementation
var arr:ALME;
    buffarr:ABUFF;
    devarr:ADEV;
//Menu - ��楤�� �맮�� ����
//arr - ��६����� ⨯� ALME, � ���ன �࠭���� �� ������� ����� � ��
//��楤�� ���� ��, �� ���ண� ����� ��� � ��⠫�� ������� ����(⠡����, ��࠭����,����㧪�,������...).
//exit_from_menu - 䫠� ��室� �� ����
//max - ⥪�騩 ���ᨬ� ��ப �᭮����� ���ᨢ�
//DevMax - ⥪�騩 ���ᨬ� ��ப ���ᨢ� ࠧࠡ��稪��
Procedure Menu;
var exit_from_menu:boolean;
    max:     word = 0;
    DevMax:  word = 0;
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
    Writeln('                                           ', #186 ,'             ������           ',#186);
    writeln('                                           ', #186 ,'             ���            ',#186);
    writeln('                                           ', #186 ,'                              ',#186);
    write('                                           ',#200);
    for i:=1 to 30 do write(#205);
    writeln(#188);
    gotoxy(2,29);
    writeln('V.5 (sort)');
  end;
  //Clear- ��楤�� ������ ���� ��ப�,� ���ன �� �諨, � ��ࢮ��砫��.
  //c - ⥪�饥 ��������� �����.
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
      16: Write('             ������           ');
      17: Write('             ���            ');
    end;
    write(#186);
    gotoxy(1, c);
  end;
  //keys - �㭪�� ��४��祭�� �����蠬� ����� ��ப.
  //arr,buffarr,devarr - �ᯮ��㥬� ���ᨢ�.
  //k - �࠭�� ���祭�� ����⮩ ������
  //c - ����� ��ப�, �� ���ன �� ��室����
  Function keys(var arr:ALME; var buffarr:ABUFF; var devarr:ADEV):boolean ;
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
          #72:If c=12 then c:=17 else dec(c);
          #80:If c=17 then c:=12 else inc(c);
        end;
        gotoxy(1, c);
        Write('                                           ',#186);
        textcolor(10);
        case c of
          12: Write('     > ������� ������� 1 <    ');
          13: Write('     > ������� ������� 2 <    ');
          14: Write('         > ��������� <        ');
          15: Write('         > ��������� <        ');
          16: Write('           > ������ <         ');
          17: Write('           > ����� <          ');
        end;
        textcolor(15);
        write(#186);
      end;
      if k = #13 then keys:=true
      else if k = #27 then begin
        keys := true;
        c:=17;
      end;
    until keys = true;
    case c of
      12:begin
        Loading;
        Open_table(arr,max,buffarr,devarr,devmax);
      end;
      13:begin
        Loading;
        Open_second_table(devmax,buffarr,devarr);
      end;
      14:save_to_file(arr,max,devmax,devarr);
      15:Load_From_File(arr,max,devmax,buffarr,devarr);
      16:helpshower;
      17:exit_from_menu:=true;
    else exit_from_menu:=true;
    end
  end;
//�᭮���� �ணࠬ�� ����
begin
  exit_from_menu:=false;
  repeat
    cursoroff;
    clrscr;
    textcolor(10);
    textbackground(black);
    call_menu;
    keys(arr,buffarr,devarr);
  until exit_from_menu=true;
end;
end.
