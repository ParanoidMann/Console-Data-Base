unit other;
//Модуль отдельных процедур и функций, используемых во всех других модулях.
interface
uses crt;
//типы
type
LME = record //LME - Land Military Equipment(Сухопутная военная техника)
  name:string; //Название техники
  model:string;//Модель техники
  dev:record //dev - developer - разработчик
    FIO:string; //FIO - Name,Surname - пол разработчика
    year:string; //Год рождения
    sex:string; //Пол
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
//ALME - тип массива [1..100] типа LME.
ALME = array[1..100] of LME;
  //процедуры и функции, используемые ниже.
procedure   line          (c1:char;c2:char;c3:char;c4:char;long:shortint);
procedure   space_writer  (xint,yint,countsp:integer);
procedure   add_to_arr    (var arr:ALME;i:integer);
function    writepart     (s:string ; i:integer ):string;
procedure   show_error    (s:string);
procedure   Loading;
//описание функций/процедур.
implementation
//Line - процедура отрисовки линий таблиц.
//c1,c2,c3,c4 - номера символов, используемых для отрисовки.
//Long- длина отрисовываемой линии. Если long = 1 , то линия удленённая, иначе укороченная.
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
//add_to_arr - процедура заполнения ячейки массива при добавлении новой строки.
//arr - используемый массив. i - номер ячейки.
//Массив заполняется начальными зарезервированными словами - подсказками.
 procedure add_to_arr(var arr:ALME;i:integer);
    begin
      if arr[i].name='' then arr[i].name:='название техники';
      if arr[i].model='' then arr[i].model:='модель';
      if arr[i].dev.FIO='' then arr[i].dev.FIO:='разработчик';
      if arr[i].company.name='' then arr[i].company.name:='предприятие';
      if arr[i].cost='' then arr[i].cost:='стоимость';
      if arr[i].Ttype='' then arr[i].Ttype:='тип';
      if arr[i].dev.year='' then arr[i].dev.year:=' год';
      if arr[i].dev.sex='' then arr[i].dev.sex:='  пол';
    end;
//space_writer - процедура заполнения пустого места пробелами
//xint,yint - координаты, откуда начинать заполнение.
//Если координаты 1,1, то заполняется с начала строки.
//countsp - количество пробелов к заполнению.
 procedure space_writer(xint,yint,countsp:integer);
 var i:integer;
 begin
   if (xint<>1) and (yint<>1) then gotoxy(xint,yint);
   for i:=1 to countsp do write(' ');
 end;
//show_error - процедура вывода ошибки.
//s - текст ошибки, вводимый в процедуру.
//Процедура перемещается на точку 95,5 и выводит "Ошибка".
//После этого процедура с координаты 85,6 выводит текст ошибки s.
//Через определённое время текст ошибки затирается с помощью процедуры space_writer.
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
//writepart - функция, вывода только последней заданной части строки.
//s - строка на входе. i - количество символов, которое нужно вывести.
//Функция возвращает столько символов с конца, сколько указано в i.
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
