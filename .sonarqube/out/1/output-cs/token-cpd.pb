¨
eD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\Common\PaginatedListInput.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
Common* 0
;0 1
public 
abstract 
class 
PaginatedListInput (
{ 
public 

int 
Page 
{ 
get 
; 
set 
; 
}  !
public 

int 
PerPage 
{ 
get 
; 
set !
;! "
}# $
public 

string 
Search 
{ 
get 
; 
set  #
;# $
}% &
public		 

string		 
Sort		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
public

 

SearchOrder

 
Dir

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 

PaginatedListInput 
( 
int 
page 
, 
int 
perPage 
, 
string 
search 
, 
string 
sort 
, 
SearchOrder 
dir 
) 
{ 
Page 
= 
page 
; 
PerPage 
= 
perPage 
; 
Search 
= 
search 
; 
Sort 
= 
sort 
; 
Dir 
= 
dir 
; 
} 
public 

SearchInput 
ToSearchInput $
($ %
)% &
=> 

new 
( 
Page 
, 
PerPage 
, 
Search $
,$ %
Sort& *
,* +
Dir, /
)/ 0
;0 1
} ¸
fD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\Common\PaginatedListOutput.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
Common* 0
;0 1
public 
abstract 
class 
PaginatedListOutput )
<) *
TOutputItem* 5
>5 6
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

int 
Total 
{ 
get 
; 
set 
;  
}! "
public 

IReadOnlyList 
< 
TOutputItem $
>$ %
Items& +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
	protected		 
PaginatedListOutput		 !
(		! "
int

 
page

 
,

 
int 
perPage 
, 
int 
total 
, 
IReadOnlyList 
< 
TOutputItem !
>! "
items# (
)( )
{ 
Page 
= 
page 
; 
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
} Ë
kD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\Exceptions\ApplicationException.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *

Exceptions* 4
{ 
public 

abstract 
class  
ApplicationException .
:/ 0
	Exception1 :
{ 
	protected  
ApplicationException &
(& '
string' -
?- .
message/ 6
)6 7
:8 9
base: >
(> ?
message? F
)F G
{ 	
} 	
} 
}		 Ã	
hD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\Exceptions\NotFoundException.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *

Exceptions* 4
{ 
public 

class 
NotFoundException "
:# $ 
ApplicationException% 9
{ 
public 
NotFoundException  
(  !
string! '
?' (
message) 0
)0 1
:2 3
base4 8
(8 9
message9 @
)@ A
{ 	
}		 	
public

 
static

 
void

 
ThrowIfNull

 &
(

& '
object

' -
?

- .
@object

/ 6
,

6 7
string

8 >
exceptionMessage

? O
)

O P
{ 	
if 
( 
@object 
== 
null 
)  
throw 
new 
NotFoundException +
(+ ,
exceptionMessage, <
)< =
;= >
} 	
} 
} ¬
bD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\Interfaces\IUnitOfWork.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *

Interfaces* 4
{ 
public 

	interface 
IUnitOfWork  
{ 
public 
Task 
Commit 
( 
CancellationToken ,
cancellationToken- >
)> ?
;? @
} 
} Å
xD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\UseCases\Category\Common\CategoryModelOutput.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
UseCases* 2
.2 3
Category3 ;
.; <
Common< B
{ 
public 

class 
CategoryModelOutput $
{ 
public 
CategoryModelOutput "
(" #
Guid# '
id( *
,* +
string, 2
name3 7
,7 8
string9 ?
description@ K
,K L
boolM Q
isActiveR Z
,Z [
DateTime\ d
	createdAte n
)n o
{ 	
Id		 
=		 
id		 
;		 
Name

 
=

 
name

 
;

 
Description 
= 
description %
;% &
IsActive 
= 
isActive 
;  
	CreatedAt 
= 
	createdAt !
;! "
} 	
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
static 
CategoryModelOutput )
FromCategory* 6
(6 7
DomainEntity7 C
.C D
CategoryD L
categoryM U
)U V
{ 	
return 
new 
( 
category 
. 
Id 
, 
category 
. 
Name 
, 
category 
. 
Description $
,$ %
category 
. 
IsActive !
,! "
category 
. 
	CreatedAt "
) 
; 
} 	
}   
}!! ˜
{D:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\UseCases\Category\CreateCategory\CreateCategory.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
UseCases* 2
.2 3
Category3 ;
.; <
CreateCategory< J
{ 
public 

class 
CreateCategory 
:  !
ICreateCategory" 1
{		 
private

 
readonly

 
ICategoryRepository

 ,
_categoryRepository

- @
;

@ A
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
CreateCategory 
( 
ICategoryRepository 1
categoryRepository2 D
,D E
IUnitOfWork )

unitOfWork* 4
)4 5
{ 	
_categoryRepository 
=  !
categoryRepository" 4
;4 5
_unitOfWork 
= 

unitOfWork $
;$ %
} 	
public 
async 
Task 
< 
CategoryModelOutput -
>- .
Handle/ 5
(5 6
CreateCategoryInput6 I
inputJ O
,O P
CancellationTokenQ b
cancellationTokenc t
)t u
{ 	
var 
category 
= 
new 
DomainEntity +
.+ ,
Category, 4
(4 5
input 
. 
Name 
, 
input 
. 
Description !
,! "
input 
. 
IsActive 
) 
; 
await 
_categoryRepository %
.% &
Insert& ,
(, -
category- 5
,5 6
cancellationToken7 H
)H I
;I J
await 
_unitOfWork 
. 
Commit $
($ %
cancellationToken% 6
)6 7
;7 8
return 
CategoryModelOutput &
.& '
FromCategory' 3
(3 4
category4 <
)< =
;= >
}   	
}!! 
}"" ú
ÄD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\UseCases\Category\CreateCategory\CreateCategoryInput.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
UseCases* 2
.2 3
Category3 ;
.; <
CreateCategory< J
{ 
public 

class 
CreateCategoryInput $
:% &
IRequest' /
</ 0
CategoryModelOutput0 C
>C D
{ 
public 
CreateCategoryInput "
(" #
string# )
name* .
,. /
string0 6
?6 7
description8 C
=D E
nullF J
,J K
boolL P
isActiveQ Y
=Z [
true\ `
)` a
{		 	
Name

 
=

 
name

 
;

 
Description 
= 
description %
??& (
$str) +
;+ ,
IsActive 
= 
isActive 
;  
} 	
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} §
|D:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\UseCases\Category\CreateCategory\ICreateCategory.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
UseCases* 2
.2 3
Category3 ;
.; <
CreateCategory< J
{ 
public 

	interface 
ICreateCategory $
:% &
IRequestHandler' 6
<6 7
CreateCategoryInput7 J
,J K
CategoryModelOutputL _
>_ `
{ 
} 
}		 ˙
{D:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\UseCases\Category\DeleteCategory\DeleteCategory.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
UseCases* 2
.2 3
Category3 ;
.; <
DeleteCategory< J
;J K
public 
class 
DeleteCategory 
: 
IDeleteCategory -
{ 
private 
readonly 
ICategoryRepository (
_categoryRepository) <
;< =
private 
readonly 
IUnitOfWork  
_unitOfWork! ,
;, -
public

 

DeleteCategory

 
(

 
ICategoryRepository

 -
categoryRepository

. @
,

@ A
IUnitOfWork

B M

unitOfWork

N X
)

X Y
=> 

( 
_categoryRepository 
,  
_unitOfWork! ,
), -
=. /
(0 1
categoryRepository1 C
,C D

unitOfWorkE O
)O P
;P Q
public 

async 
Task 
Handle 
( 
DeleteCategoryInput 0
request1 8
,8 9
CancellationToken: K
cancellationTokenL ]
)] ^
{ 
var 
category 
= 
await 
_categoryRepository 0
.0 1
Get1 4
(4 5
request5 <
.< =
Id= ?
,? @
cancellationTokenA R
)R S
;S T
await 
_categoryRepository !
.! "
Delete" (
(( )
category) 1
,1 2
cancellationToken3 D
)D E
;E F
await 
_unitOfWork 
. 
Commit  
(  !
cancellationToken! 2
)2 3
;3 4
return 
; 
} 
} ˘
ÄD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\UseCases\Category\DeleteCategory\DeleteCategoryInput.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
UseCases* 2
.2 3
Category3 ;
.; <
DeleteCategory< J
;J K
public 
class 
DeleteCategoryInput  
:! "
IRequest# +
{ 
public 

Guid 
Id 
{ 
get 
; 
set 
; 
}  
public 

DeleteCategoryInput 
( 
Guid #
id$ &
)& '
=>		 

Id		 
=		 
id		 
;		 
}

 Â
|D:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\UseCases\Category\DeleteCategory\IDeleteCategory.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
UseCases* 2
.2 3
Category3 ;
.; <
DeleteCategory< J
;J K
public 
	interface 
IDeleteCategory  
: 
IRequestHandler 
< 
DeleteCategoryInput )
>) *
{ 
} ß
uD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\UseCases\Category\GetCategory\GetCategory.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
UseCases* 2
.2 3
Category3 ;
.; <
GetCategory< G
{ 
public 

class 
GetCategory 
: 
IGetCategory +
{ 
private 
readonly 
ICategoryRepository ,
_categoryRepository- @
;@ A
public

 
GetCategory

 
(

 
ICategoryRepository

 .
categoryRepository

/ A
)

A B
{ 	
_categoryRepository 
=  !
categoryRepository" 4
;4 5
} 	
public 
async 
Task 
< 
CategoryModelOutput -
>- .
Handle/ 5
(5 6
GetCategoryInput6 F
requestG N
,N O
CancellationTokenP a
cancellationTokenb s
)s t
{ 	
var 
category 
= 
await  
_categoryRepository! 4
.4 5
Get5 8
(8 9
request9 @
.@ A
IdA C
,C D
cancellationTokenE V
)V W
;W X
return 
CategoryModelOutput &
.& '
FromCategory' 3
(3 4
category4 <
)< =
;= >
} 	
} 
} «
zD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\UseCases\Category\GetCategory\GetCategoryInput.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
UseCases* 2
.2 3
Category3 ;
.; <
GetCategory< G
{ 
public 

class 
GetCategoryInput !
:" #
IRequest$ ,
<, -
CategoryModelOutput- @
>@ A
{ 
public 
GetCategoryInput 
(  
Guid  $
id% '
)' (
{		 	
Id

 
=

 
id

 
;

 
} 	
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
} 
} «
ÉD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\UseCases\Category\GetCategory\GetCategoryInputValidator.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
UseCases* 2
.2 3
Category3 ;
.; <
GetCategory< G
{ 
public 

class %
GetCategoryInputValidator *
:+ ,
AbstractValidator- >
<> ?
GetCategoryInput? O
>O P
{ 
public %
GetCategoryInputValidator (
(( )
)) *
{ 	
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Id		 
)		 
.		 
NotEmpty		 '
(		' (
)		( )
;		) *
}

 	
} 
} ï
vD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\UseCases\Category\GetCategory\IGetCategory.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
UseCases* 2
.2 3
Category3 ;
.; <
GetCategory< G
{ 
public 

	interface 
IGetCategory !
:" #
IRequestHandler$ 3
<3 4
GetCategoryInput4 D
,D E
CategoryModelOutputF Y
>Y Z
{ 
}		 
}

 ñ
|D:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\UseCases\Category\ListCategories\IListCategories.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
UseCases* 2
.2 3
Category3 ;
.; <
ListCategories< J
;J K
public 
	interface 
IListCategories  
: 
IRequestHandler 
< 
ListCategoriesInput )
,) * 
ListCategoriesOutput+ ?
>? @
{ 
} ≤
{D:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\UseCases\Category\ListCategories\ListCategories.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
UseCases* 2
.2 3
Category3 ;
.; <
ListCategories< J
;J K
public 
class 
ListCategories 
: 
IListCategories -
{ 
private 
readonly 
ICategoryRepository (
_categoryRepository) <
;< =
public		 

ListCategories		 
(		 
ICategoryRepository		 -
categoryRepository		. @
)		@ A
=>

 

_categoryRepository

 
=

  
categoryRepository

! 3
;

3 4
public 

async 
Task 
<  
ListCategoriesOutput *
>* +
Handle, 2
(2 3
ListCategoriesInput 
request #
,# $
CancellationToken 
cancellationToken +
)+ ,
{ 
var 
searchOutput 
= 
await  
_categoryRepository! 4
.4 5
Search5 ;
(; <
new 
( 
request 
. 
Page 
, 
request 
. 
PerPage 
,  
request 
. 
Search 
, 
request 
. 
Sort 
, 
request 
. 
Dir 
) 
, 
cancellationToken 
) 	
;	 

return 
new  
ListCategoriesOutput '
(' (
searchOutput 
. 
CurrentPage $
,$ %
searchOutput 
. 
PerPage  
,  !
searchOutput 
. 
Total 
, 
searchOutput 
. 
Items 
.   
Select   
(   
CategoryModelOutput   +
.  + ,
FromCategory  , 8
)  8 9
.!! 
ToList!! 
(!! 
)!! 
)"" 	
;""	 

}## 
}$$ ë
ÄD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\UseCases\Category\ListCategories\ListCategoriesInput.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
UseCases* 2
.2 3
Category3 ;
.; <
ListCategories< J
;J K
public 
class 
ListCategoriesInput  
: 
PaginatedListInput 
, 
IRequest "
<" # 
ListCategoriesOutput# 7
>7 8
{ 
public		 

ListCategoriesInput		 
(		 
int

 
page

 
=

 
$num

 
,

 
int 
perPage 
= 
$num 
, 
string 
search 
= 
$str 
, 
string 
sort 
= 
$str 
, 
SearchOrder 
dir 
= 
SearchOrder %
.% &
Asc& )
) 
: 
base 
( 
page 
, 
perPage 
, 
search "
," #
sort$ (
,( )
dir* -
)- .
{ 
} 
public 

ListCategoriesInput 
( 
)  
: 	
base
 
( 
$num 
, 
$num 
, 
$str 
, 
$str 
, 
SearchOrder )
.) *
Asc* -
)- .
{ 
} 
} †	
ÅD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\UseCases\Category\ListCategories\ListCategoriesOutput.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
UseCases* 2
.2 3
Category3 ;
.; <
ListCategories< J
;J K
public 
class  
ListCategoriesOutput !
: 
PaginatedListOutput 
< 
CategoryModelOutput -
>- .
{ 
public 
 
ListCategoriesOutput 
(  
int		 
page		 
,		 
int

 
perPage

 
,

 
int 
total 
, 
IReadOnlyList 
< 
CategoryModelOutput )
>) *
items+ 0
)0 1
: 	
base
 
( 
page 
, 
perPage 
, 
total #
,# $
items% *
)* +
{ 
} 
} ï
|D:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\UseCases\Category\UpdateCategory\IUpdateCategory.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
UseCases* 2
.2 3
Category3 ;
.; <
UpdateCategory< J
;J K
public 
	interface 
IUpdateCategory  
: 
IRequestHandler 
< 
UpdateCategoryInput )
,) *
CategoryModelOutput+ >
>> ?
{ 
} Œ
{D:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\UseCases\Category\UpdateCategory\UpdateCategory.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
UseCases* 2
.2 3
Category3 ;
.; <
UpdateCategory< J
;J K
public 
class 
UpdateCategory 
: 
IUpdateCategory -
{ 
private 
readonly 
ICategoryRepository (
_categoryRepository) <
;< =
private		 
readonly		 
IUnitOfWork		  
_uinitOfWork		! -
;		- .
public 

UpdateCategory 
( 
ICategoryRepository 
categoryRepository .
,. /
IUnitOfWork 
uinitOfWork 
)  
=> 

( 
_categoryRepository 
,  
_uinitOfWork! -
)- .
= 
( 
categoryRepository !
,! "
uinitOfWork# .
). /
;/ 0
public 

async 
Task 
< 
CategoryModelOutput )
>) *
Handle+ 1
(1 2
UpdateCategoryInput2 E
requestF M
,M N
CancellationTokenO `
cancellationTokena r
)r s
{ 
var 
category 
= 
await 
_categoryRepository 0
.0 1
Get1 4
(4 5
request5 <
.< =
Id= ?
,? @
cancellationTokenA R
)R S
;S T
category 
. 
Update 
( 
request 
.  
Name  $
,$ %
request& -
.- .
Description. 9
)9 :
;: ;
if 

( 
request 
. 
IsActive 
!= 
null  $
&&% '
request 
. 
IsActive 
!= 
category  (
.( )
IsActive) 1
) 	
if 
( 
( 
bool 
) 
request 
. 
IsActive &
!& '
)' (
category) 1
.1 2
Activate2 :
(: ;
); <
;< =
else 
category 
. 

Deactivate $
($ %
)% &
;& '
await 
_categoryRepository !
.! "
Update" (
(( )
category) 1
,1 2
cancellationToken3 D
)D E
;E F
await 
_uinitOfWork 
. 
Commit !
(! "
cancellationToken" 3
)3 4
;4 5
return 
CategoryModelOutput "
." #
FromCategory# /
(/ 0
category0 8
)8 9
;9 :
} 
} ô
ÄD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\UseCases\Category\UpdateCategory\UpdateCategoryInput.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
UseCases* 2
.2 3
Category3 ;
.; <
UpdateCategory< J
;J K
public 
class 
UpdateCategoryInput  
: 
IRequest 
< 
CategoryModelOutput "
>" #
{ 
public 

Guid 
Id 
{ 
get 
; 
set 
; 
}  
public		 

string		 
Name		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
public

 

string

 
?

 
Description

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 

bool 
? 
IsActive 
{ 
get 
;  
set! $
;$ %
}& '
public 

UpdateCategoryInput 
( 
Guid 
id 
, 
string 
name 
, 
string 
? 
description 
= 
null "
," #
bool 
? 
isActive 
= 
null 
) 
{ 
Id 

= 
id 
; 
Name 
= 
name 
; 
Description 
= 
description !
;! "
IsActive 
= 
isActive 
; 
} 
} ∫
âD:\dev\FullCycle\FC.Codeflix.Catalog\src\FC.Codeflix.Catalog.Application\UseCases\Category\UpdateCategory\UpdateCategoryInputValidator.cs
	namespace 	
FC
 
. 
Codeflix 
. 
Catalog 
. 
Application )
.) *
UseCases* 2
.2 3
Category3 ;
.; <
UpdateCategory< J
;J K
public 
class (
UpdateCategoryInputValidator )
: 
AbstractValidator 
< 
UpdateCategoryInput +
>+ ,
{ 
public 
(
UpdateCategoryInputValidator '
(' (
)( )
=> 

RuleFor 
( 
x 
=> 
x 
. 
Id 
) 
. 
NotEmpty &
(& '
)' (
;( )
}		 