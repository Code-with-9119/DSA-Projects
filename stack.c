// #include <stdio.h>
// #include<stdlib.h>
// struct stack {
//     int size;
//     int top;
//     int *arr;
// };
// int is_empty(struct stack*ptr){
//     if (ptr->top==-1)
//     {
//        printf("Stack is Empty");
//     }
//     else{
//         printf("stack is not Empty");
//     }
//     return 0;
// }
// int is_full(struct stack*ptr){
//     if (ptr->top==ptr->size-1)
//     {
//         printf("Stack is FULL");
//     }
//    return 0; 
// }
// int main() {
//     // struct stack s;
//     //     s.size=100;
//     //     s.top=-1;
//     //     s.arr=(int*)malloc(s.size*sizeof(int));
//     struct stack *s;
//     s=(struct stack*)malloc(sizeof(struct stack));
//         s->size=80;
//         s->top=66;
//         s->arr=(int*)malloc(s->size*sizeof(int));
//     is_full(s);
//     is_empty(s);
//     return 0;
// }



#include <stdio.h>
#include<stdlib.h>
struct stack {
    int size;
    int top;
    int *arr;
};
int is_empty(struct stack*ptr){
    if (ptr->top==-1)
    {
      return 1;
    }
    else{
       return 0;
    }
    return 0;
}
int is_full(struct stack*ptr){
    if (ptr->top==ptr->size-1)
    {
        return 1;
    }
   return 0; 
}
void push(struct stack*ptr,int value){
    if (is_full(ptr))
    {
       printf("Stack overflow");
    }
    else{
        ptr->top++;
        ptr->arr[ptr->top]=value;
    }
}
int pop(struct stack*ptr){
    if (is_empty(ptr))
    {
       printf("Stack underflow");
       return-1;
    }
    else{
        int value=ptr->arr[ptr->top];
        ptr->top--;
        return value;
    }
}
int peek(struct stack*sp,int i){
    if (sp->top-i+1<=0)
    {
       printf("invalid\n");
       return -1;
    }
    else{
        return sp->arr[sp->top-i+1];
    }
}
int stacktop(struct stack*sp){
    return sp->arr[sp->top];
}
int stackbottom(struct stack*sp){
    return sp->arr[0];
}

int main() {
    struct stack*stk=(struct stack*)malloc(sizeof(struct stack));
    stk->size=10;
    stk->top=-1;
    stk->arr=(int*)malloc(stk->size*sizeof(int));
    printf("Stack has been created successfully!!\n");
    printf("%d\n",is_empty(stk));
    printf("%d\n",is_full(stk));
    push(stk,56);
    push(stk,65);
    push(stk,95);
    push(stk,22);
    push(stk,17);
    push(stk,33);
    printf("After push operation\n");
    printf("%d\n",is_empty(stk));
    printf("%d\n",is_full(stk));
    printf("%d is removed from stack \n",pop(stk));
    printf("%d is removed from stack \n",pop(stk));
    for (int j=1;j<= stk->top +1;j++)
    {
        printf("The value of position %d is %d\n",j,peek(stk,j));
    }

    printf("the top most element is %d\n",stacktop(stk));
    printf("the bottom element is %d\n",stackbottom(stk));
    
    return 0;
}





