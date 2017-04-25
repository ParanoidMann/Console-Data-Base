unit other;
//����� �⤥���� ��楤�� � �㭪権, �ᯮ��㥬�� �� ��� ��㣨� ������.
interface
uses crt;
//⨯�
type
LME = record //LME - Land Military Equipment(��宯�⭠� ������� �孨��)
  name:string; //�������� �孨��
  model:string;//������ �孨��
  dev:record //dev - developer - ࠧࠡ��稪
    FIO:string; //FIO - Name,Surname - ��� ࠧࠡ��稪�
    year:string; //��� ஦�����
    sex:string; //���
  end;
  company:record //�।���⨥
    name:string; //��������
    pos:string; //pos - position - ���� ��宦�����
    qudev:integer; //qudev - qyantity of developers - ���-�� ࠧࠡ��稪��
    dir:string; //dir - director - ��४��
  end;
  cost:string; //�⮨�����
  Ttype:string; //⨯ �孨��
end;
//ALME - ⨯ ���ᨢ� [1..100] ⨯� LME.
ALME = array[1..100] of LME;
  //��楤��� � �㭪樨, �ᯮ��㥬� ����.
procedure   line          (c1:char;c2:char;c3:char;c4:char;long:shortint);
procedure   space_writer  (xint,yint,countsp:integer);
procedure   add_to_arr    (var arr:ALME;i:integer);
function    writepart     (s:string ; i:integer ):string;
procedure   show_error    (s:string);
procedure   Loading;
//���ᠭ�� �㭪権/��楤��.
implementation
//Line - ��楤�� ���ᮢ�� ����� ⠡���.
//c1,c2,c3,c4 - ����� ᨬ�����, �ᯮ��㥬�� ��� ���ᮢ��.
//Long- ����� ���ᮢ뢠���� �����. �᫨ long = 1 , � ����� 㤫��񭭠�, ���� 㪮�祭���.
procedure line(c1:char;c2:char;c3:char;c4:char;long:shortint);
var k:integer;
begin
// middle line: top line:  bottom line:
//   c1 - 195   c1 - 218    c1 - 192
//   c2 - 196   c2 - 196    c2 - 196
//   c3 - 197   c3 - 194    c3 - 193
//   c4 - 180   c4 - 191    c4 - 217
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
    for k:=1 to 10 do write(c2);
    writeln(c4);
  end;
end;
//add_to_arr - ��楤�� ���������� �祩�� ���ᨢ� �� ���������� ����� ��ப�.
//arr - �ᯮ��㥬� ���ᨢ. i - ����� �祩��.
//���ᨢ ���������� ��砫�묨 ��१�ࢨ஢���묨 ᫮���� - ���᪠�����.
 procedure add_to_arr(var arr:ALME;i:integer);
    begin
      if arr[i].name='' then arr[i].name:='�������� �孨��';
      if arr[i].model='' then arr[i].model:='������';
      if arr[i].dev.FIO='' then arr[i].dev.FIO:='ࠧࠡ��稪';
      if arr[i].company.name='' then arr[i].company.name:='�।���⨥';
      if arr[i].cost='' then arr[i].cost:='�⮨�����';
      if arr[i].Ttype='' then arr[i].Ttype:='⨯';
      if arr[i].dev.year='' then arr[i].dev.year:=' ���';
      if arr[i].dev.sex='' then arr[i].dev.sex:='  ���';
    end;
//space_writer - ��楤�� ���������� ���⮣� ���� �஡�����
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
//
end.
