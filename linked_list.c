#include<stdio.h>
#include<stdlib.h>
//linked list traversel ->->->
struct node
{
  int data;
  struct node*next;
};
void link_traverse(struct node*ptr){
    while (ptr!=NULL)
    {
       printf("Element: %d\n",ptr->data);
       ptr=ptr->next;
    }
    
}
int main() {
    struct node*head;
    struct node*first;
    struct node*second;
    struct node*third;

    head=(struct node*)malloc(sizeof(struct node));
    first=(struct node*)malloc(sizeof(struct node));
    second=(struct node*)malloc(sizeof(struct node));
    third=(struct node*)malloc(sizeof(struct node));

    head->data=7;
    head->next=first;

    first->data=11;
    first->next=second;

    second->data=89;
    second->next=third;

    third->data=118;
    third->next=NULL;

    link_traverse(head);
    return 0;
}