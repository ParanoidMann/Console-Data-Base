unit other;
//����� �⤥���� ��楤�� � �㭪権, �ᯮ��㥬�� �� ��� ��㣨� ������.
interface
uses crt,sysutils;
//⨯�
type
LME = record //LME - Land Military Equipment(��宯�⭠� ������� �孨��)
  name:string; //�������� �孨��
  model:string;//������ �孨��
  dev_id:word;
  company:record //�।���⨥
    name:string; //��������
    pos:string; //pos - position - ���� ��宦�����
    qudev:integer; //qudev - qyantity of developers - ���-�� ࠧࠡ��稪��
    dir:string; //dir - director - ��४��
  end;
  cost:integer; //�⮨�����
  Ttype:string; //⨯ �孨��
end;
//⨯ ࠧࠡ��稪� - ࠧࠡ��稪 ����� ᢮� ���, ��� ஦����� � ���.
developer = record //dev - developer - ࠧࠡ��稪
  FIO:string;   //FIO - Name,Surname - ��� ࠧࠡ��稪�
  year:integer; //��� ஦�����
  sex:string;   //���
end;
//������ ⨯
Buff = record
  cost:string;
  year:string;
end;
//⨯� ���ᨢ��
ALME = array[1..100] of LME;
ADEV = array[1..100] of developer;
ABUFF = array[1..100] of Buff;
//��楤��� � �㭪樨, �ᯮ��㥬� ����.
procedure   Add_to_arr    (var arr:ALME;var devarr:ADEV;i:integer;var buffarr:ABuff);
procedure   Line          (c1:char;c2:char;c3:char;c4:char;long:shortint);
procedure   Add_dev       (var devarr:ADEV; var buffarr:ABUFF; i:integer);
procedure   DevSwap       (var devarr:ADEV;var buffarr:ABUFF;i:integer);
procedure   Swap          (var arr:ALME;var buffarr:ABUFF;i:integer);
function    Writepart     (s:string ; i:integer ):string;
procedure   Space_writer  (xint,yint,countsp:integer);
function    TopLowerCase  (s:string):string;
function    TopUpCase     (c:char):char;
procedure   PrintFild    (j:integer);
procedure   Show_error    (s:string);
procedure   HelpShower;
procedure   Loading;
implementation
//Line - ��楤�� ���ᮢ�� ����� ⠡���.
//c1,c2,c3,c4 - ����� ᨬ�����, �ᯮ��㥬�� ��� ���ᮢ��.
//Long- ����� ���ᮢ뢠���� �����. �᫨ long = 1 , � ����� 㤫��񭭠�, ���� 㪮�祭���.
//k - ����ୠ� ��६�����.
procedure line(c1:char;c2:char;c3:char;c4:char;long:shortint);
//var k:integer;
begin
// middle line: top line:  bottom line:
//   c1 - 195   c1 - 218    c1 - 192
//   c2 - 196   c2 - 196    c2 - 196
//   c3 - 197   c3 - 194    c3 - 193
//   c4 - 180   c4 - 191    c4 - 217
  if long=1 then begin
    write(c1,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c3);
    write(c2,c2,c2,c2,c2,c2,c2,c2,c2,c3);
    write(c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c3);
    write(c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c3);
    write(c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c3);
    write(c2,c2,c2,c2,c2,c2,c2,c4);
    {write(c1);
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
    for k:=1 to 7 do write(c2);
    writeln(c4);}
  end
  else begin
    space_writer(1,1,40);
    write(c1,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c3,c2,c2,c2,c2,c2,c2,c2,c3,c2,c2,c2,c2,c2,c2,c2,c2,c2,c2,c4);
    {write(c1);
    for k:=1 to 14 do write(c2);
    write(c3);
    for k:=1 to 7 do write(c2);
    write(c3);
    for k:=1 to 10 do write(c2);
    writeln(c4);}
  end;
end;
//add_to_arr - ��楤�� ���������� �祩�� ���ᨢ� �� ���������� ����� ��ப�.
//arr,devarr,buffarr - �ᯮ��㥬� ���ᨢ�. i - ����� �祩��.
//���ᨢ ���������� ��砫�묨 ��१�ࢨ஢���묨 ᫮���� - ���᪠�����.
 procedure add_to_arr(var arr:ALME;var devarr:ADEV;i:integer;var buffarr:ABuff);
    begin
      if arr[i].name='' then arr[i].name:='�������� �孨��';
      If not(arr[i].dev_id>=1) then arr[i].dev_id:=0;
      If devarr[arr[i].dev_id].FIO='' then devarr[arr[i].dev_id].FIO:='���ࠡ��稪';
      if arr[i].model='' then arr[i].model:='������';
      if arr[i].company.name='' then arr[i].company.name:='�।���⨥';
      if buffarr[i].cost='' then buffarr[i].cost:='�⮨�����';
      if arr[i].Ttype='' then arr[i].Ttype:='���';
    end;
//add_dev - ��楤�� ���������� �祩�� ���ᨢ� ࠧࠡ��稪�� �� ���������� ����� ��ப�.
//devarr,buffarr - �ᯮ��㥬� ���ᨢ�. i - ����� ��ப�.
 procedure add_dev(var devarr:ADEV; var buffarr:ABUFF; i:integer);
 begin
   if devarr[i].FIO='' then devarr[i].FIO:='���ࠡ��稪';
   if buffarr[i].year='' then buffarr[i].year:='���';
   if devarr[i].sex='' then devarr[i].sex:='���';
 end;
//space_writer - ��楤�� ���������� ���⮣� ���� �஡�����.
//xint,yint - ���न����, ��㤠 ��稭��� ����������.
//�᫨ ���न���� 1,1, � ���������� � ��砫� ��ப�.
//countsp - ������⢮ �஡���� � ����������.
 procedure space_writer(xint,yint,countsp:integer);
 var i:integer;
 begin
   if (xint<>1) and (yint<>1) then gotoxy(xint,yint);
   for i:=1 to countsp do write(' ');
 end;
//show_error - ��楤�� �뢮�� �訡��.
//s - ⥪�� �訡��, ������� � ��楤���.
//��楤�� ��६�頥��� �� ��� 95,5 � �뢮��� "�訡��".
//��᫥ �⮣� ��楤�� � ���न���� 85,6 �뢮��� ⥪�� �訡�� s.
//��१ ��।��񭭮� �६� ⥪�� �訡�� ���ࠥ��� � ������� ��楤��� space_writer.
//errorstr,i - ������.
 procedure show_error(s:string);
 var errorstr:string;
     i:integer;
 begin
   gotoxy(95,5);
   textcolor(12);
   errorstr:='������';
   for i:=1 to 6 do begin
     write(errorstr[i]);
     delay(10);
   end;
   gotoxy(85,6);
   for i:=1 to length(s) do begin
     write(s[i]);
     delay(10);
   end;
   textcolor(15);
   delay(500);
   space_writer(95,5,6);
   space_writer(85,6,length(s));
 end;
//writepart - �㭪��, �뢮�� ⮫쪮 ��᫥���� �������� ��� ��ப�.
//s - ��ப� �� �室�. i - ������⢮ ᨬ�����, ���஥ �㦭� �뢥��.
//�㭪�� �����頥� �⮫쪮 ᨬ����� � ����, ᪮�쪮 㪠���� � i.
function writepart(s:string ; i:integer ):string;
var f:integer;
begin
  if length(s)>i then writepart := copy(s,length(s)-i,i)
  else writepart:=s;
  if length(writepart)<i then
    for f:=length(writepart) to i-1 do writepart:=writepart+' ';
  end;
 //Loading - ��楤�� �ᥢ������㧪�.
 //i,j - ����稪�.
procedure Loading;
var i,j:integer;
begin
  Clrscr;
  randomize;
  i:=random(5);
  Write('����㧪�');
  for j:=1 to i do begin
    write('.');
    delay(300);
  end;
end;
//TopUpCase - �㭪�� �����頥� ����訥 �㪢�(��� � ���� �모)
//c - ᨬ���, ����� ��ॢ������
function TopUpCase(C:char):char;
begin
  if c in [#160..#175] then topupcase:=chr(ord(C)-32)
  else if c in[#224..#239] then topupcase:=chr(ord(C)-80)
  else if c in[#97..#122] then topupcase:=upcase(C)
  else topupcase:=c;
end;
//TopLowerCase - �㭪�� �����頥� �����쪨� �㪢�(��� � ���� �모)
//c - ᨬ���, ����� ��ॢ������
function TopLowerCase(s:string):string;
var i:integer;
begin
  TopLowerCase:='';
  for i:=1 to length(s) do begin
    if s[i] in ['�'..'�'] then toplowercase:=toplowercase+chr(ord(s[i])+32)
    else if s[i] in['�'..'�'] then toplowercase:=toplowercase+chr(ord(s[i])+80)
    else if s[i] in['A'..'Z'] then toplowercase:=toplowercase+lowercase(s[i])
    else toplowercase:=toplowercase+s[i];
  end;
end;
//HelpShower - ��楤�� �뢮��� ��࠭��� HELP � ���᪠�����.
//��� ������� ������� �ॡ���� ������ �� ���� �������.
procedure HelpShower();
begin
  clrscr;
  gotoxy(40,3);
  write('���� ������ ��宯�⭮� ������� �孨��');
  gotoxy(25,6);
  write('� ������ �孨��(1) - ��������, ������, ࠧࠡ��稪, �।���⨥, �⮨����� , ⨯.');
  gotoxy(25,7);
  write('� ������ ࠧࠡ��稪��(2) - ���, ��� ஦�����, ���.');
  gotoxy(54,10);
  write('���᪠���:');
  gotoxy(25,12);
  write('o � �祩�� ''���'' ���ଠ�� ������ ���� � �஬���⪥ 1900 - 2017');
  gotoxy(25,13);
  write('o �祩�� ''�⮨�����'' � ''���'' �������� �᪫��⥫쭮 ��ࠬ�.');
  gotoxy(25,14);
  write('o � �祩�� ''���'' ������ ���� ���� ��᪮�, ���� ���᪨� ���.');
  gotoxy(25,15);
  write('� ������ ࠧࠡ��稪��(2) - ���, ��� ஦�����, ���.');
  gotoxy(25,16);
  write('o ���ࠡ��稪� � ⠡��� 1 �롨����� �� ⠡���� 2.');
  gotoxy(55,18);
  write('������:');
  gotoxy(30,20);
  write('S           - ����஢�� �⮫�� �� ��䠢��� / �����⠭�� �ᥫ.');
  gotoxy(30,21);
  write('Enter       - �롮� �祩�� ��� ����� / ����砭�� �����.');
  gotoxy(30,22);
  write('Pgdn / Pgup - �롮� ࠧࠡ��稪� � ��ࢮ� ⠡���.');
  gotoxy(30,23);
  write('Backspace   - �������� ��ப� / 㤠����� ᨬ����.');
  gotoxy(30,24);
  write('Esc         - ��室 �� ��� ���� �ணࠬ��.');
  gotoxy(30,25);
  write(#17,',',#30,',',#31,',',#16,'     - ��६�饭�� �� ���� / ⠡��栬.');
  gotoxy(3,29);
  write('������ ���� �������');
  repeat
  until readkey in [#1..#255];
end;
//Swap - ��楤�� ����� ���⠬� ��࠭��� ��ப� � ᫥���饩. �ᯮ������ � ���஢��.
//arr, buffarr, devarr - �ᯮ��㥬� ���ᨢ�
//i - ����� ��ப� � ⠡���
procedure Swap(var arr:ALME;var buffarr:ABUFF;i:integer);
var s:string;
    j:integer;
begin
  s:=arr[i].name;
  arr[i].name:=arr[i+1].name;
  arr[i+1].name:=s;
  s:=arr[i].model;
  arr[i].model:=arr[i+1].model;
  arr[i+1].model:=s;
  j:=arr[i].dev_id;
  arr[i].dev_id:=arr[i+1].dev_id;
  arr[i+1].dev_id:=j;
  s:=arr[i].company.name;
  arr[i].company.name:=arr[i+1].company.name;
  arr[i+1].company.name:=s;
  j:=arr[i].cost;
  arr[i].cost:=arr[i+1].cost;
  arr[i+1].cost:=j;
  if arr[i].cost <> 0 then buffarr[i].cost:=inttostr(arr[i].cost);
  if arr[i].cost <> 0 then buffarr[i+1].cost:=inttostr(arr[i+1].cost);
  s:=arr[i].Ttype;
  arr[i].Ttype:=arr[i+1].Ttype;
  arr[i+1].Ttype:=s;
end;
//DevSwap - ��楤�� ����� ���⠬� ��࠭��� ��ப� � ᫥���饩. �ᯮ������ � ���஢��.
//arr, buffarr, devarr - �ᯮ��㥬� ���ᨢ�
//i - ����� ��ப� � ⠡���
procedure DevSwap(var devarr:ADEV;var buffarr:ABUFF;i:integer);
var s:string;
    j:integer;
begin
  s:=devarr[i].FIO;
  devarr[i].FIO:=devarr[i+1].FIO;
  devarr[i+1].FIO:=s;
  j:=devarr[i].year;
  devarr[i].year:=devarr[i+1].year;
  devarr[i+1].year:=j;
  if devarr[i].year <> 0 then buffarr[i].year:=inttostr(devarr[i].year);
  if devarr[i].year <> 0 then buffarr[i+1].year:=inttostr(devarr[i+1].year);
  s:=devarr[i].sex;
  devarr[i].sex:=devarr[i+1].sex;
  devarr[i+1].sex:=s;
end;
//
// middle line: top line:  bottom line:
//   c1 - 195   c1 - 218    c1 - 192
//   c2 - 196   c2 - 196    c2 - 196
//   c3 - 197   c3 - 194    c3 - 193
//   c4 - 180   c4 - 191    c4 - 217
procedure PrintFild(j:integer);
begin
  gotoxy(95,13);
  write(#218,#196,#196,#196,#196,#196,#196,#196,#196,#196,#196,#196,#196,#196,#196,#196,#196,#196,#191);
  gotoxy(95,14);
  write(#179);
  gotoxy(113,14);
  write(#179);
  gotoxy(95,15);
  write(#192,#196,#196,#196,#196,#196,#196,#196,#196,#196,#196,#196,#196,#196,#196,#196,#196,#196,#217);
  gotoxy(1,j);
end;
end.
