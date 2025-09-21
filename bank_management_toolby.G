#include <stdio.h>
#include <stdlib.h>
#include <string.h>
struct account
{
    int acc_no;
    char name[50];
    int ATM_pin;
    int balance;
    struct account *next;
};

int acc_check(struct account *head, int accno)
{
    struct account *ptr = head;
    while (ptr != NULL)
    {
        if (ptr->acc_no == accno)
        {
            return 1;
        }
        else
        {
            ptr = ptr->next;
        }
    }
    return 0;
}

struct account *create_newacc(struct account *head, int acc_no, int ATM_pin, int balance, char name[50])
{
    if (acc_check(head, acc_no) == 1)
    {
        printf("Account number is already exist\n");
        return head;
    }
    struct account *new_user = (struct account *)malloc(sizeof(struct account));
    new_user->acc_no = acc_no;
    new_user->ATM_pin = ATM_pin;
    strcpy(new_user->name, name);
    new_user->balance = balance;
    new_user->next = head;
    printf("Account created seccessfully!\n");
    return new_user;
}
int check_balance(struct account *head, int accno, int pin)
{
    struct account *ptr = head;
    while (ptr != NULL)
    {
        if (ptr->acc_no == accno)
        {
            if (ptr->ATM_pin == pin)
            {
                printf("Aaplya account madhe %dINR aahet!\n", ptr->balance);
                return 0;
            }
            else
            {
                printf("khatam!,pin bhul gaye!!\n");
                return 0;
            }
        }
        ptr = ptr->next;
    }
    printf("aap galat bank main aa gaye ho\n");
    return 0;
}
void credit_money(struct account *head, int accno, int amount)
{
    struct account *ptr = head;
    while (ptr != NULL)
    {
        if (ptr->acc_no == accno)
        {
            ptr->balance = (ptr->balance) + amount;
            printf("Amount created successfully!\n");
            return;
        }
        ptr = ptr->next;
    }
    printf("pehale account kholiye,phir paisa daliye!\n");
}
void debit_money(struct account *head, int accno, int pin, int amount)
{
    struct account *ptr = head;
    while (ptr != NULL)
    {
        if (ptr->acc_no == accno)
        {
            if (ptr->ATM_pin == pin)
            {
                if (ptr->balance < amount)
                {
                    printf("wahh,pehle paise dalo(Insufficient balance)!\n");
                    return;
                }
                ptr->balance = (ptr->balance) - amount;
                printf("Amount Debited successfully!\n");
                return;
            }
            else
            {
                printf("khatam! pin bhul gaye!!\n");
                return;
            }
        }

        ptr = ptr->next;
    }
    printf("pehale account kholiye,phir paisa daliye,phir nikaliye!\n");
}
void freeList(struct account *temp)
{
    struct account *ptr;
    while (temp != NULL)
    {
        ptr = temp;
        temp = temp->next;
        free(ptr);
    }
}

int main()
{
    printf("~~~Welcome to Kanjus Varma bank~~~\n");
    struct account *head = NULL;
    int option;
    int acc_no;
    char name[50];
    int ATM_pin;
    int balance;
    int amount;
    while (1)
    {
        printf("\n$$$$----->>>> \n");
        printf("---What you want to DO--\n");
        printf("1.create new account\n");
        printf("2.check bank balance\n");
        printf("3.credit money in account\n");
        printf("4.debit money in account\n");
        printf("5.Exit\n");
        printf("^^^select one option from above^^^");

        printf("Enter your choice\n");
        scanf("%d", &option);
        while (getchar() != '\n');
            

        switch (option)
        {
        case 1:
        {
            printf("process started,fill the form!\n");
            printf("Enter the name :\n");
            fgets(name, 50, stdin);
            name[strcspn(name, "\n")] = 0;
            printf("Create your account number(~4 digit):\n");
            scanf("%d", &acc_no);
            while (getchar() != '\n')
                ;
            printf("create 4 digit securiy pin:\n");
            scanf("%d", &ATM_pin);
            while (getchar() != '\n')
                ;
            printf("credit some money(min 500INR):\n");
            scanf("%d", &balance);
            while (getchar() != '\n')
                ;
            head = create_newacc(head, acc_no, ATM_pin, balance, name);
            break;
        }
        case 2:
        {
            printf("checking balance....!\n");
            printf("Enter account no:");
            scanf("%d", &acc_no);
            while (getchar() != '\n')
                ;
            printf("Enter security pin:\n");
            scanf("%d", &ATM_pin);
            while (getchar() != '\n')
                ;
            check_balance(head, acc_no, ATM_pin);
            break;
        }
        case 3:
        {
            printf("let's credit\n");
            printf("Enter account no:n");
            scanf("%d", &acc_no);
            while (getchar() != '\n')
                ;
            printf("Enter amount to credit:\n");
            scanf("%d", &amount);
            while (getchar() != '\n')
                ;
            credit_money(head, acc_no, amount);
            break;
        }
        case 4:
        {
            printf("let's debit\n");
            printf("Enter account no:n");
            scanf("%d", &acc_no);
            while (getchar() != '\n')
                ;
            printf("Enter security pin:\n");
            scanf("%d", &ATM_pin);
            while (getchar() != '\n')
                ;
            printf("Enter amount to debit:\n");
            scanf("%d", &amount);
            while (getchar() != '\n')
                ;
            debit_money(head, acc_no, ATM_pin, amount);
            break;
        }
        case 5:
        {
            printf("Bank closed...lunch time!!\n");
            freeList(head);
            return 0;
        }
        default:
            printf("Invalid choice(select 1 to 5!!!)>>");
        }
    }
    return 0;
}
