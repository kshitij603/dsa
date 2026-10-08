//Implement Single Linked Lists and its operations: creation, insertion, deletion, traversal, search, reverse
#include <iostream>
using namespace std;

struct Node
{
    int data;
    Node *next;
};


Node *head = NULL;

void create()
{
    int n, value;

    cout << "Enter number of nodes: ";
    cin >> n;

    for (int i = 0; i < n; i++)
    {
        cout << "Enter value: ";
        cin >> value;

        Node *newNode = new Node;
        newNode->data = value;
        newNode->next = NULL;

        if (head == NULL)
        {
            head = newNode;
        }
        else
        {
            Node *temp = head;

            while (temp->next != NULL)
            {
                temp = temp->next;
            }

            temp->next = newNode;
        }
    }
}

void insert()
{
    int value, pos;

    cout << "Enter value to insert: ";
    cin >> value;

    cout << "Enter position: ";
    cin >> pos;

    Node *newNode = new Node;
    newNode->data = value;

    if (pos == 1)
    {
        newNode->next = head;
        head = newNode;
        return;
    }

    Node *temp = head;

    for (int i = 1; i < pos - 1; i++)
    {
        temp = temp->next;
    }

    newNode->next = temp->next;
    temp->next = newNode;
}

void deletion()
{
    int pos;

    cout << "Enter position to delete: ";
    cin >> pos;

    Node *temp = head;

    if (pos == 1)
    {
        head = head->next;
        delete temp;
        return;
    }

    for (int i = 1; i < pos - 1; i++)
    {
        temp = temp->next;
    }

    Node *del = temp->next;
    temp->next = del->next;

    delete del;
}

void traverse()
{
    Node *temp = head;

    while (temp != NULL)
    {
        cout << temp->data << " ";
        temp = temp->next;
    }

    cout << endl;
}

void search()
{
    int value, pos = 1;
    bool found = false;

    cout << "Enter value to search: ";
    cin >> value;

    Node *temp = head;

    while (temp != NULL)
    {
        if (temp->data == value)
        {
            cout << "Element found at position " << pos << endl;
            found = true;
            break;
        }

        temp = temp->next;
        pos++;
    }

    if (found == false)
    {
        cout << "Element not found\n";
    }
}

void reverse()
{
    Node *prev = NULL;
    Node *curr = head;
    Node *next = NULL;

    while (curr != NULL)
    {
        next = curr->next;
        curr->next = prev;
        prev = curr;
        curr = next;
    }

    head = prev;
}

int main()
{
    
}
