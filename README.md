# nature_things

```dot{engine="circo"}
digraph{
    
    Architecture[label="Entities|"]
    A->Ar
}
```

```dot{engine="osage"}
digraph test123 {
pack=8
subgraph cluster0 {
packmode=array
x y x0 y0 x1
subgraph cluster1 {
m n
}
}
b [shape=box];
c [label="hello\nworld",color=blue,fontsize=24,
fontname="Palatino−Italic",fontcolor=red,style=filled];
a->z
x->z
a->b->c;
a->{x y};
edge [style=dashed,color=red];
b->x;
}
```


```dot
digraph {
a->b->c
a->{x,y}
b [shape=box]
c [label="hello\ nworld",color=blue,fontsize=24,
fontname="Palatino−Italic",fontcolor=red,style=filled]
a->z [label="hi", weight=100]
x->z [label="multi−line\ nlabel"]
edge [style=dashed,color=red]
b->x
{rank=same; b x}
}
```

```dot
// {engine=patchwork}
graph G {
node[style=filled]
subgraph cluster0 {
subgraph cluster0_0 {
style=filled
fillcolor=green
a b[area=3 fillcolor=yellow]
}
subgraph cluster0_1 {
area=2
bgcolor=yellow
}
c [style=filled
fillcolor=red ]
}
subgraph cluster1 {
e f
}
}
```

```dot{engine="fdp"}
digraph Artichitecture {
subgraph cluster0{
    Devices DB ExternalInterfaces UI Web
subgraph cluster1{
    GateWays Presenters Controllers
subgraph cluster2{
    UseCases
subgraph cluster3{
    Entities
}
}
}
}
}
```
Entities BusinessRules
> Attr

UseCases ApplicationRules
> Event
> UseStory

InterfaceAdapters
> Controller->UC_input---UC_out<-Presenter

```dot
digraph{
Controller->UC_input
Presenter->UC_out

subgraph cluster{
    UC_input UC_out
}
}

```
case 1
```dot
digraph{
Entiry->Repository
Model-> RepositorImpl->UseCase
}
```
case 2
```dot
digraph{
    DomainRepository[label="DomainRepository\n State is cache"]
    Entiry[label="Entiry|bean|Model"]
Entiry->DataProvider->DomainRepository
UseCase->DomainRepository
Cache->DomainRepository[dir=both]
// DomainRepository->State[label="UseStory" dir=both]
OutState->UI[dir=back label="listen"]

// Cache->OutState[dir=back label="get listen"]
// OutState->DomainRepository[label="UserStory"]
DomainRepository->OutState
UseCase->OutState[dir=back label="UserStory"]
OutState[label="OutState| build()"]

subgraph cluster0{
    label="abstract"
    UseCase DataProvider Entiry
}

<!-- subgraph cluster1{
    label="implement"
    UseCase DataProvider Entiry
} -->

}
```
> UseCase is a Impl, DomainEvent is no need
> all UserStory has runAsync
> model is no need Due to UseCase?
> UserStory and OutState is in business


> P1 build in OutState is ok?
> P2 model is no need Due to UseCase?
> P3 Entiry|bean|Model 不可以with
>   Entiry字段 bean_json 
> P4 where is to place State->OutState 