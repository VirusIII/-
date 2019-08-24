program hashTable;

type
  mas = array [0..100] of integer;

var
  table: mas; {хеш}
  hashSize: integer;{количество элементов в таблице}


{Данный метод вычисляет позицию элемента в таблице}
function h(key: integer): integer;
begin
  h := key mod 101;
end;

{Данный метод разрешает коллизии;
hash-номер ячейки, полученый функцией h, c-признак пустоты ячейки либо искомый ключ}
function kolliz(hash: integer; c: integer): integer;// hi(k)=(h0(k)+c*i)-общий вид
var
  i: integer;// hi(k)=(c*i^3) mod 101 -реализация
begin
  while (table[hash] <> (c)) and (i < 51) do
  begin
    inc(i);
    hash := (hash + 2 * i * i * i) mod 101;
  end;
  kolliz := hash;
end;

{Данный метод добавляет элемент в хэш-таблицу}
procedure addToHash(key: integer);
var
  hash: integer;
begin
  if hashSize < 101 then begin
    hash := h(key);
    hash := kolliz(hash, -1);  // '-1' признак пустоты ячейки
    table[hash] := key;
  end;
end;

{Данный метод ищет элемент в таблице по ключу}
function findHash(key: integer): integer;
var
  hash: integer;
begin
  hash := h(key);
  if table[hash] <> key then
    while table[hash] <> key do
      hash := kolliz(hash, key);
  writeln(hash);
  findHash := table[hash];
end;

{Данный метод удаляет элемент из хэш-таблицы}
procedure delFromHash(key: integer);
var
  hash: integer;
begin
  if hashSize > 0 then begin
    hash := h(key);
    if table[hash] <> key then
      while table[hash] <> key do
        hash := kolliz(hash, key);
    writeln(hash);
    table[hash] := -1;
  end;
end;

{Данный метод очищает хэш-таблицу}
procedure clearHash();
var
  i: integer;
begin
  for i := 0 to 100 do
    table[i] := -1;
end;

var
  c, i, inf: integer;

begin
  clearHash;
  writeln('Введите количество эл-в таблицы(<100);');
  read(c);
  writeln('Введите элементы хэш-таблицы');
  for i := 1 to c do
  begin
    read(inf);
    addToHash(inf);
  end;
  writeln('Введите искомый ключ из существующих');
  read(inf);
  findHash(inf);
  writeln('Введите ключ, который нужно удалить');
  read(inf);
  delFromHash(inf);
  
end.








