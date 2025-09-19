#include <stdio.h>
#include<stdlib.h>
//dabbe ka shape >>
struct node
{
   int data;
   struct node*next;
};
//traversal ke liye>>
void link_traverse(struct node*ptr){
    while (ptr!=NULL)
    {
       printf("Element: %d\n",ptr->data);
       ptr=ptr->next;
    }  
}
//insertion ke liye(at start)>>
struct node*insertat_start(struct node*head,int data){
    struct node*ptr=(struct node*)malloc(sizeof(struct node));
    ptr->next=head;
    ptr->data=data;
    return ptr;
}
//insertion at particular index 
struct node*insertat_index(struct node*head,int data,int index){
    struct node*newnode=(struct node*)malloc(sizeof(struct node));
    newnode->data=data;
    struct node*p=head;
    // Traverse to the node just before the desired index
    int i=0;
    while (i!=index-1)
    {
      p=p->next;
      i++;
    }
    // link the node >>
    newnode->next=p->next;
    p->next=newnode;
    return head;
}
//insertion at END >>
struct node*insertat_end(struct node*head,int data){
    struct node*ptr=(struct node*)malloc(sizeof(struct node));
    ptr->data=data;
    ptr->next=NULL;
    struct node*p=head;
    if (head == NULL) {
        return ptr;
    }
    while (p->next!=NULL)
    {
        p=p->next;
    }
    p->next=ptr;
    return head;
}

int main() {
    //pointer declaration>>
    struct node*head;
    struct node*first;
    struct node*second;
    struct node*third;
    //memory allocation>>
    head=(struct node*)malloc(sizeof(struct node));
    first=(struct node*)malloc(sizeof(struct node));
    second=(struct node*)malloc(sizeof(struct node));
    third=(struct node*)malloc(sizeof(struct node));
    //1st dabba link with 2nd>>
    head->data=45;
    head->next=first;
    //2nd dabba link with 3rd>>
    first->data=85;
    first->next=second;
    //3rd dabba link with 4th>>
    second->data=9;
    second->next=third;
    //link khatam
    third->data=3;
    third->next=NULL;
    //function calls>>
    link_traverse(head);
    head=insertat_start(head,66);
    printf("after insertion at beginning\n");
    link_traverse(head);
    head=insertat_index(head,99,2);
    printf("after insertion at particular index\n");
    link_traverse(head);
    head=insertat_end(head,44);
    printf("after insertion at END\n");
    link_traverse(head);
    
    return 0;
}