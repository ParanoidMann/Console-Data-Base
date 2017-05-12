unit other;
//Модуль отдельных процедур и функций, используемых во всех других модулях.
interface
uses crt,sysutils;
//типы
type
LME = record //LME - Land Military Equipment(Сухопутная военная техника)
  name:string; //Название техники
  model:string;//Модель техники
  dev_id:word;
  company:record //Предприятие
    name:string; //Название
    pos:string; //pos - position - место нахождения
    qudev:integer; //qudev - qyantity of developers - кол-во разработчиков
    dir:string; //dir - director - директор
  end;
  cost:integer; //стоимость
  Ttype:string; //тип техники
end;
//тип разработчика - разработчик имеет своё имя, год рождения и пол.
developer = record //dev - developer - разработчик
  FIO:string;   //FIO - Name,Surname - пол разработчика
  year:integer; //Год рождения
  sex:string;   //Пол
end;
//буфферный тип
Buff = record
  cost:string;
  year:string;
end;
//типы массивов
ALME = array[1..100] of LME;
ADEV = array[1..100] of developer;
ABUFF = array[1..100] of Buff;
//процедуры и функции, используемые ниже.
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
//Line - процедура отрисовки линий таблиц.
//c1,c2,c3,c4 - номера символов, используемых для отрисовки.
//Long- длина отрисовываемой линии. Если long = 1 , то линия удленённая, иначе укороченная.
//k - буфферная переменная.
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
//add_to_arr - процедура заполнения ячейки массива при добавлении новой строки.
//arr,devarr,buffarr - используемые массивы. i - номер ячейки.
//Массив заполняется начальными зарезервированными словами - подсказками.
 procedure add_to_arr(var arr:ALME;var devarr:ADEV;i:integer;var buffarr:ABuff);
    begin
      if arr[i].name='' then arr[i].name:='Название техники';
      If not(arr[i].dev_id>=1) then arr[i].dev_id:=0;
      If devarr[arr[i].dev_id].FIO='' then devarr[arr[i].dev_id].FIO:='Разработчик';
      if arr[i].model='' then arr[i].model:='Модель';
      if arr[i].company.name='' then arr[i].company.name:='Предприятие';
      if buffarr[i].cost='' then buffarr[i].cost:='Стоимость';
      if arr[i].Ttype='' then arr[i].Ttype:='Тип';
    end;
//add_dev - процедура заполнения ячейки массива разработчиков при добавлении новой строки.
//devarr,buffarr - используемые массивы. i - номер строки.
 procedure add_dev(var devarr:ADEV; var buffarr:ABUFF; i:integer);
 begin
   if devarr[i].FIO='' then devarr[i].FIO:='Разработчик';
   if buffarr[i].year='' then buffarr[i].year:='Год';
   if devarr[i].sex='' then devarr[i].sex:='Пол';
 end;
//space_writer - процедура заполнения пустого места пробелами.
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
//errorstr,i - буфферы.
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
 //i,j - счётчики.
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
//TopUpCase - функция возвращает большие буквы(рус и англ языки)
//c - символ, который переводится
function TopUpCase(C:char):char;
begin
  if c in [#160..#175] then topupcase:=chr(ord(C)-32)
  else if c in[#224..#239] then topupcase:=chr(ord(C)-80)
  else if c in[#97..#122] then topupcase:=upcase(C)
  else topupcase:=c;
end;
//TopLowerCase - функция возвращает маленькие буквы(рус и англ языки)
//c - символ, который переводится
function TopLowerCase(s:string):string;
var i:integer;
begin
  TopLowerCase:='';
  for i:=1 to length(s) do begin
    if s[i] in ['А'..'П'] then toplowercase:=toplowercase+chr(ord(s[i])+32)
    else if s[i] in['Р'..'Я'] then toplowercase:=toplowercase+chr(ord(s[i])+80)
    else if s[i] in['A'..'Z'] then toplowercase:=toplowercase+lowercase(s[i])
    else toplowercase:=toplowercase+s[i];
  end;
end;
//HelpShower - процедура выводит страницу HELP с подсказками.
//Для закрытия вкладки требуется нажать на любую клавишу.
procedure HelpShower();
begin
  clrscr;
  gotoxy(40,3);
  write('База данных сухопутной военной техники');
  gotoxy(25,6);
  write('о Таблица техники(1) - название, модель, разработчик, предприятие, стоимость , тип.');
  gotoxy(25,7);
  write('о Таблица разработчиков(2) - ФИО, год рождения, пол.');
  gotoxy(54,10);
  write('Подсказки:');
  gotoxy(25,12);
  write('o В ячейке ''Год'' информация должна быть в промежутке 1900 - 2017');
  gotoxy(25,13);
  write('o Ячейка ''Стоимость'' и ''Год'' вводятся исключительно цифрами.');
  gotoxy(25,14);
  write('o В ячейке ''Пол'' должен быть либо Мужской, либо Женский пол.');
  gotoxy(25,15);
  write('о Таблица разработчиков(2) - ФИО, год рождения, пол.');
  gotoxy(25,16);
  write('o Разработчики в таблице 1 выбираются из таблицы 2.');
  gotoxy(55,18);
  write('Клавиши:');
  gotoxy(30,20);
  write('S           - Сортировка столбца по алфавиту / возрастанию чисел.');
  gotoxy(30,21);
  write('Enter       - Выбор ячейки для ввода / окончания ввода.');
  gotoxy(30,22);
  write('Pgdn / Pgup - Выбор разработчика в первой таблице.');
  gotoxy(30,23);
  write('Backspace   - Удаление строки / удаление символа.');
  gotoxy(30,24);
  write('Esc         - Выход из любого места программы.');
  gotoxy(30,25);
  write(#17,',',#30,',',#31,',',#16,'     - Перемещение по меню / таблицам.');
  gotoxy(3,29);
  write('Нажмите любую клавишу');
  repeat
  until readkey in [#1..#255];
end;
//Swap - процедура меняет местами выбранную строку со следующей. Используется в сортировке.
//arr, buffarr, devarr - используемые массивы
//i - номер строки в таблице
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
//DevSwap - процедура меняет местами выбранную строку со следующей. Используется в сортировке.
//arr, buffarr, devarr - используемые массивы
//i - номер строки в таблице
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
