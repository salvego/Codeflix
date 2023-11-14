©
VD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Domain\Entity\Category.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Domain $
.$ %
Entity% +
{ 
public 

class 
Category 
: 
AggregateRoot )
{ 
public 
Category 
( 
string 
name #
,# $
string% +
description, 7
,7 8
bool9 =
isActive> F
=G H
trueI M
)M N
:		 
base		 
(		 
)		 
{

 	
Name 
= 
name 
; 
Description 
= 
description %
;% &
	CreatedAt 
= 
DateTime  
.  !
Now! $
;$ %
IsActive 
= 
isActive 
;  
Validate 
( 
) 
; 
} 	
public 
string 
Name 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
public 
string 
Description !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public 
bool 
IsActive 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
public 
void 
Validate 
( 
) 
{ 	
DomainValidation 
. 
NotNullOrEmpty +
(+ ,
Name, 0
,0 1
nameof2 8
(8 9
Name9 =
)= >
)> ?
;? @
DomainValidation 
. 
	MinLength &
(& '
Name' +
,+ ,
$num- .
,. /
nameof0 6
(6 7
Name7 ;
); <
)< =
;= >
DomainValidation 
. 
	MaxLength &
(& '
Name' +
,+ ,
$num- 0
,0 1
nameof2 8
(8 9
Name9 =
)= >
)> ?
;? @
DomainValidation 
. 
	MaxLength &
(& '
Description' 2
,2 3
$num4 9
,9 :
nameof; A
(A B
DescriptionB M
)M N
)N O
;O P
} 	
public 
void 
Activate 
( 
) 
{   	
IsActive!! 
=!! 
true!! 
;!! 
Validate"" 
("" 
)"" 
;"" 
}## 	
public$$ 
void$$ 

Deactivate$$ 
($$ 
)$$  
{%% 	
IsActive&& 
=&& 
false&& 
;&& 
Validate'' 
('' 
)'' 
;'' 
}(( 	
public** 
void** 
Update** 
(** 
string** !
name**" &
,**& '
string**( .
?**. /
description**0 ;
=**< =
null**> B
)**B C
{++ 	
Name,, 
=,, 
name,, 
;,, 
Description-- 
=-- 
description-- %
??--& (
Description--) 4
;--4 5
Validate// 
(// 
)// 
;// 
}00 	
}11 
}22 ‘
kD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Domain\Exceptions\EntityValidationException.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Domain $
.$ %

Exceptions% /
{ 
public 

class %
EntityValidationException *
:+ ,
	Exception- 6
{ 
public %
EntityValidationException (
(( )
string) /
?/ 0
message1 8
)8 9
:: ;
base< @
(@ A
messageA H
)H I
{ 	
} 	
}		 
}

 Ï
eD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Domain\Repository\ICategoryRepository.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Domain $
.$ %

Repository% /
{ 
public 

	interface 
ICategoryRepository (
:) *
IGenericRepository+ =
<= >
Category> F
>F G
,G H!
ISearchableRepositoryI ^
<^ _
Category_ g
>g h
{ 
}

 
} ı
]D:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Domain\SeedWork\AggregateRoot.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Domain $
.$ %
SeedWork% -
{ 
public 

abstract 
class 
AggregateRoot '
:( )
Entity* 0
{ 
	protected 
AggregateRoot 
(  
)  !
:" #
base$ (
(( )
)) *
{+ ,
}- .
} 
} î
VD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Domain\SeedWork\Entity.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Domain $
.$ %
SeedWork% -
{ 
public 

abstract 
class 
Entity  
{ 
	protected 
Entity 
( 
) 
{ 	
Id 
= 
Guid 
. 
NewGuid 
( 
) 
;  
} 	
public

 
Guid

 
Id

 
{

 
get

 
;

 
set

 !
;

! "
}

# $
} 
} Ç
bD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Domain\SeedWork\IGenericRepository.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Domain $
.$ %
SeedWork% -
{ 
public 

	interface 
IGenericRepository '
<' (

TAggregate( 2
>2 3
:4 5
IRepository6 A
where 

TAggregate 
: 
AggregateRoot (
{ 
public 
Task 
Insert 
( 

TAggregate %
	aggregate& /
,/ 0
CancellationToken1 B
cancellationTokenC T
)T U
;U V
public 
Task 
< 

TAggregate 
> 
Get  #
(# $
Guid$ (
id) +
,+ ,
CancellationToken- >
cancellationToken? P
)P Q
;Q R
public 
Task 
Delete 
( 

TAggregate %
	aggregate& /
,/ 0
CancellationToken1 B
cancellationTokenC T
)T U
;U V
public		 
Task		 
Update		 
(		 

TAggregate		 %
	aggregate		& /
,		/ 0
CancellationToken		1 B
cancellationToken		C T
)		T U
;		U V
}

 
} è
[D:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Domain\SeedWork\IRepository.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Domain $
.$ %
SeedWork% -
{ 
public 

	interface 
IRepository  
{ 
} 
} ù
zD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Domain\SeedWork\SearchableRepository\ISearchableRepository.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Domain $
.$ %
SeedWork% -
.- . 
SearchableRepository. B
;B C
public 
	interface !
ISearchableRepository &
<& '

Taggregate' 1
>1 2
where 	

Taggregate
 
: 
AggregateRoot $
{ 
Task 
< 	
SearchOutput	 
< 

Taggregate  
>  !
>! "
Search# )
() *
SearchInput 
input 
, 
CancellationToken 
cancellationToken +
) 
; 
}		 á
pD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Domain\SeedWork\SearchableRepository\SearchInput.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Domain $
.$ %
SeedWork% -
.- . 
SearchableRepository. B
;B C
public 
class 
SearchInput 
{ 
public 

int 
Page 
{ 
get 
; 
set 
; 
}  !
public 

int 
PerPage 
{ 
get 
; 
set !
;! "
}# $
public 

string 
Search 
{ 
get 
; 
set  #
;# $
}% &
public 

string 
OrderBy 
{ 
get 
;  
set! $
;$ %
}& '
public 

SearchOrder 
Order 
{ 
get "
;" #
set$ '
;' (
}) *
public

 

SearchInput

 
(

 
int 
page 
, 
int 
perPage 
, 
string 
search 
, 
string 
orderBy 
, 
SearchOrder 
order 
) 
{ 
Page 
= 
page 
; 
PerPage 
= 
perPage 
; 
Search 
= 
search 
; 
OrderBy 
= 
orderBy 
; 
Order 
= 
order 
; 
} 
} Ò
pD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Domain\SeedWork\SearchableRepository\SearchOrder.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Domain $
.$ %
SeedWork% -
.- . 
SearchableRepository. B
;B C
public 
enum 
SearchOrder 
{ 
Asc 
, 
Desc 
} ¸
qD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Domain\SeedWork\SearchableRepository\SearchOutput.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Domain $
.$ %
SeedWork% -
.- . 
SearchableRepository. B
;B C
public 
class 
SearchOutput 
< 

TAggregate $
>$ %
where 	

TAggregate
 
: 
AggregateRoot $
{ 
public 

int 
CurrentPage 
{ 
get  
;  !
set" %
;% &
}' (
public 

int 
PerPage 
{ 
get 
; 
set !
;! "
}# $
public 

int 
Total 
{ 
get 
; 
set 
;  
}! "
public 

IReadOnlyList 
< 

TAggregate #
># $
Items% *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public		 

SearchOutput		 
(		 
int

 
currentPage

 
,

 
int 
perPage 
, 
int 
total 
, 
IReadOnlyList 
< 

TAggregate  
>  !
items" '
)' (
{ 
CurrentPage 
= 
currentPage !
;! "
PerPage 
= 
perPage 
; 
Total 
= 
total 
; 
Items 
= 
items 
; 
} 
} •
bD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Domain\Validation\DomainValidation.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Domain $
.$ %

Validation% /
{ 
public 

class 
DomainValidation !
{ 
public 
static 
void 
NotNull "
(" #
object# )
?) *
target+ 1
,1 2
string3 9
	fieldName: C
)C D
{ 	
if		 
(		 
target		 
is		 
null		 
)		 
{

 
throw 
new %
EntityValidationException 3
(3 4
$"4 6
{6 7
	fieldName7 @
}@ A
$strA T
"T U
)U V
;V W
} 
} 	
public 
static 
void 
NotNullOrEmpty )
() *
string* 0
?0 1
target2 8
,8 9
string: @
	fieldNameA J
)J K
{ 	
if 
( 
String 
. 
IsNullOrWhiteSpace )
() *
target* 0
)0 1
)1 2
throw 
new %
EntityValidationException 3
(3 4
$" 
{ 
	fieldName  
}  !
$str! =
"= >
)> ?
;? @
} 	
public 
static 
void 
	MinLength $
($ %
string% +
target, 2
,2 3
int4 7
	minLength8 A
,A B
stringC I
	fieldNameJ S
)S T
{ 	
if 
( 
target 
. 
Length 
< 
	minLength  )
)) *
throw 
new %
EntityValidationException 3
(3 4
$"4 6
{6 7
	fieldName7 @
}@ A
$strA U
{U V
	minLengthV _
}_ `
$str` o
"o p
)p q
;q r
} 	
public 
static 
void 
	MaxLength $
($ %
string% +
target, 2
,2 3
int4 7
	maxLength8 A
,A B
stringC I
	fieldNameJ S
)S T
{ 	
if 
( 
target 
. 
Length 
> 
	maxLength  )
)) *
throw 
new %
EntityValidationException 3
(3 4
$"4 6
{6 7
	fieldName7 @
}@ A
$strA Z
{Z [
	maxLength[ d
}d e
$stre p
"p q
)q r
;r s
}   	
}!! 
}"" 