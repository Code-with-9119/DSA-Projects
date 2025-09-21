#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct info
{
    int id;
    char name[50];
    char booklist[6][50];
    int no_of_books;
};
struct student
{
    struct info data;
    struct student *nextstudent;
};
struct student *head = NULL;

struct info *is_present(int id)
{
    struct student *ptr = head;
    while (ptr != NULL)
    {
        if (ptr->data.id == id)
        {
            return &(ptr->data);
        }
        ptr = ptr->nextstudent;
    }
    return NULL;
}
void show_myinfo(struct info *s)
{
    printf("--Your Information--\n");
    printf("ID: %d\n", s->id);
    printf("NAME: %s\n", s->name);
    printf("YOUR BOOKLIST: \n");
    if (s->no_of_books == 0)
    {
        printf("your booklist is empty !!\n");
    }
    else
    {
        for (int i = 0; i < s->no_of_books; i++)
        {
            printf(" %s\t", s->booklist[i]);
        }
    }
}
void add_book(struct info *s, char *bookname)
{
    if (s->no_of_books < 6)
    {
        strcpy(s->booklist[s->no_of_books], bookname);
        s->no_of_books++;
        printf("Book added successfully in your booklist\n");
    }
    else
    {
        printf("Can't ADD(limit khatam!)\n");
    }
}
void delete_book(struct info *s, char *bookname)
{
    for (int i = 0; i < s->no_of_books; i++)
    {
        if (strcmp(s->booklist[i], bookname) == 0)
        {
            strcpy(s->booklist[i], s->booklist[s->no_of_books - 1]);
            s->no_of_books--;
            printf("Bokkname is removed from booklist !!!\n");
            return;
        }
    }
    printf("Invalid input\n");
}
void freeList()
{
    struct student *temp;
    while (head != NULL)
    {
        temp = head;
        head = head->nextstudent;
        free(temp);
    }
}

int main()
{

    printf("\t~~~Welcome to CODE_LIBRARY>>~~~\n");
    int option;
    while (1)
    {
        printf("\n@@@@----->>>> \n");
        printf("---What you want to DO--\n");
        printf("1.Add new student info\n");
        printf("2.Add new book in booklist\n");
        printf("3.Delete book from my booklist\n");
        printf("4.Access my INFO(via ID)\n");
        printf("5.Exit\n");
        printf("^^^select one option from above^^^");

        printf("Enter your choice\n");
        scanf("%d", &option);
        getchar();

        switch (option)
        {
        case 1:
        {
            printf("Let's create your Library INFO>>\n");
            int id;
            char name[50];
            printf("create new ID(~4 digit):\n");
            scanf("%d", &id);
            getchar();
            if (is_present(id) != NULL)
            {
                printf("Invalid Id;try other ID:\n");
                break;
            }
            printf("Enter the name :\n");
            fgets(name, 50, stdin);
            name[strcspn(name, "\n")] = 0;

            struct student *newstudent = (struct student *)malloc(sizeof(struct student));
            newstudent->data.id = id;
            strcpy(newstudent->data.name, name);
            newstudent->data.no_of_books = 0;
            newstudent->nextstudent = head;
            head = newstudent;
            printf("Task completed\n");
            break;
        }

        case 2:
        {
            printf("let's add new book in your booklist\n");
            int id;
            char book[50];
            printf("Enter the student ID:\n");
            scanf("%d", &id);
            getchar();

            struct info *sdt = is_present(id);
            if (sdt != NULL)
            {
                printf("Enter the book name:\n");
                fgets(book, 50, stdin);
                book[strcspn(book, "\n")] = 0;
                add_book(sdt, book);
            }
            else
            {
                printf("Invalid ID>>not found\n");
            }
            break;
        }
        case 3:
        {
            printf("let's remove book from booklist:\n");
            int id;
            char book[50];
            printf("Enter the sudent ID:\n");
            scanf("%d", &id);
            getchar();

            struct info *sdt = is_present(id);
            if (sdt != NULL)
            {
                printf("Enter the book name: ");
                fgets(book, 50, stdin);
                book[strcspn(book, "\n")] = 0;
                delete_book(sdt, book);
            }
            else
            {
                printf("Invalid ID>>not found\n");
            }
            break;
        }

        case 4:
        {
            printf("let's access your info:\n");
            int id;
            printf("Enter student ID: ");
            scanf("%d", &id);
            getchar();

            struct info *sdt = is_present(id);
            if (sdt != NULL)
            {
                show_myinfo(sdt);
            }
            else
            {
                printf("Invalid ID>>not found.\n");
            }
            break;
        }

        case 5:
        {
            printf("CODE_LIBRARY CLOSED !!\n");
            freeList();
            return 0;
        }

        default:
            printf("Invalid choice(select 1 to 5!!!)>>");
        }
    }
    return 0;
}
