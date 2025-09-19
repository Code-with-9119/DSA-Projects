#include <stdio.h>
#include <stdlib.h>
struct queue{
    int size;
    int f;
    int r;
    int*arr;
};
int is_full(struct queue*q){
    if ((q->r+1)%q->size==q->f)
    {
       return 1;
    }
    else{
        return 0;
    }
}
int is_empty(struct queue*q){
    if (q->r==q->f)
    {
       return 1;
    }
    else{
        return 0;
    }
}
void inqueue(struct queue*q,int value){
    if (is_full(q))
    {
       printf("queue is full,value can't insert\n");
    }
    else{
        q->r=(q->r+1)%q->size;
        q->arr[q->r]=value;
    }
}
int dequeue(struct queue*q){
    int value=-1;
    if (is_empty(q))
    {
       printf("queue is empty\n");
    }
    else{
        q->f=(q->f+1)%q->size;
        value=q->arr[q->f];
    }
    return value;
}
int main() {
    struct queue q;
    q.size=3;
    q.f=q.r=0;
    q.arr=(int*)malloc(q.size*sizeof(int));
    
    inqueue(&q,23);
    inqueue(&q,24);
    inqueue(&q,65);

    dequeue(&q);
    dequeue(&q);
    dequeue(&q);




    
    return 0;
}