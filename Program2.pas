program spiski;

type
PList = ^MyList; {��������� �� ��� ��������}
MyList = record {��� ��������}
inf: integer; {���� ������ ��������}
Next, {���� ��������� �� ��������� �������}
Last : PList; {���� ��������� �� ���������� �������}
end;

{1.���������� �������� � ������ ������;
2. �������� �������� ���, �������� ����� ���������� �������� ������;
3. ����� ����������� ������� � ������.}


procedure addItem_to_first(var list:PList;item:integer);
var n:PList;
begin
  
  new(n);
  n^.inf:=item;
  n^.Next:=list;
  n^.Last:=nil;
  n^.Next^.Last:=n;
  
  list:=n;
  
end;

procedure delItem_after_num(list:PList;item:integer);
var n,d:PList;
begin
 n:=list;
 while (n^.next<>nil) do
  if(n^.inf=item)then begin
  n^.Next^.Last:=n^.Last;
  n^.Last^.Next:=n^.Next;
  d:=n;
  n:=n^.next;
  Dispose(d);
  end
  else
  n:=n^.next;
  
end;

function minNum(list:PList):integer;
var i:integer; n:Plist;
begin
n:=list;
i:=list^.inf;
while (n^.next<>nil) do begin
 if (i>n^.inf) then i:=n^.inf;
 n:=n^.next;
 end;
 minNum:=i;
end;

procedure printList(list:PList);
var n:Plist;
begin
n:=list;
while (n<>nil) do begin
writeln(n^.inf);
n:=n^.Next;
end;
end;

begin
Var Head:PList; {��������� �� ������ ������}
{Var Current:Plist; {��������� �� ������� �������}
Var i:integer;
New(Head);
Head^.inf:=0;

for i:=1 to 5 do
addItem_to_first(Head,i);
printList(Head);
writeln(minNum(Head));
delItem_after_num(Head,3);
printList(Head);
end.

